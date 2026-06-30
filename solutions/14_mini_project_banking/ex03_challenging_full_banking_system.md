## Solution

```dart
import 'dart:async';

mixin Logger {
  void log(String msg) => print('[LOG] $msg');
}

class Identifiable {
  String getId() => '';
}

abstract class Account with Logger implements Identifiable {
  String _accountNumber;
  String _owner;
  double _balance;

  Account(this._accountNumber, this._owner, this._balance);

  String get accountNumber => _accountNumber;
  String get owner => _owner;
  double get balance => _balance;

  @override
  String getId() => _accountNumber;

  bool canWithdraw(double amount);

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      log('Deposit: +\$${amount.toStringAsFixed(2)} to $_accountNumber');
    }
  }

  void withdraw(double amount) {
    if (canWithdraw(amount)) {
      _balance -= amount;
      log('Withdrawal: -\$${amount.toStringAsFixed(2)} from $_accountNumber');
    } else {
      log('Failed withdrawal: insufficient funds for $_accountNumber');
    }
  }

  void display() {
    print('$owner ($_accountNumber) — Balance: \$${_balance.toStringAsFixed(2)}');
  }
}

class SavingsAccount extends Account {
  final double _minimumBalance = 100;
  final double _withdrawalFee = 1;

  SavingsAccount(String accountNumber, String owner, double balance)
      : super(accountNumber, owner, balance);

  @override
  bool canWithdraw(double amount) {
    return amount > 0 && _balance - amount >= _minimumBalance + _withdrawalFee;
  }

  @override
  void withdraw(double amount) {
    var total = amount + _withdrawalFee;
    if (canWithdraw(amount)) {
      _balance -= total;
      log('Withdrawal: -\$${amount.toStringAsFixed(2)} (fee: \$${_withdrawalFee.toStringAsFixed(2)}) from $_accountNumber');
    } else {
      log('Failed withdrawal: insufficient funds (min balance requirement) for $_accountNumber');
    }
  }

  @override
  void display() {
    print('$owner ($_accountNumber) — Balance: \$${_balance.toStringAsFixed(2)} (Savings)');
  }
}

class CurrentAccount extends Account {
  double _overdraftLimit;

  CurrentAccount(String accountNumber, String owner, double balance, this._overdraftLimit)
      : super(accountNumber, owner, balance);

  @override
  bool canWithdraw(double amount) {
    return amount > 0 && _balance - amount >= -_overdraftLimit;
  }

  @override
  void display() {
    print('$owner ($_accountNumber) — Balance: \$${_balance.toStringAsFixed(2)} (Current)');
  }
}

class Repository<T extends Identifiable> {
  final List<T> _items = [];

  void add(T item) => _items.add(item);
  T? getById(String id) {
    for (var item in _items) {
      if (item.getId() == id) return item;
    }
    return null;
  }
  void remove(String id) => _items.removeWhere((i) => i.getId() == id);
  List<T> getAll() => List.unmodifiable(_items);
  List<T> find(bool Function(T) predicate) => _items.where(predicate).toList();
  int get count => _items.length;
}

class Bank with Logger {
  static final Bank _instance = Bank._internal();
  Bank._internal();
  factory Bank() => _instance;

  final Repository<Account> _accounts = Repository<Account>();
  int _nextNumber = 1001;

  SavingsAccount createSavingsAccount(String owner, double initialDeposit) {
    var acc = SavingsAccount(_nextNumber.toString(), owner, initialDeposit);
    _accounts.add(acc);
    log('Savings account $_nextNumber created for $owner (deposit: \$$initialDeposit)');
    _nextNumber++;
    return acc;
  }

  CurrentAccount createCurrentAccount(String owner, double initialDeposit, double overdraftLimit) {
    var acc = CurrentAccount(_nextNumber.toString(), owner, initialDeposit, overdraftLimit);
    _accounts.add(acc);
    log('Current account $_nextNumber created for $owner (deposit: \$$initialDeposit, overdraft: \$$overdraftLimit)');
    _nextNumber++;
    return acc;
  }

  Account? findAccount(String number) => _accounts.getById(number);

  void transfer(String fromNumber, String toNumber, double amount) {
    var from = findAccount(fromNumber);
    var to = findAccount(toNumber);
    if (from != null && to != null && amount > 0) {
      log('Transfer: \$${amount.toStringAsFixed(2)} from $fromNumber to $toNumber');
      from.withdraw(amount);
      to.deposit(amount);
    }
  }

  void listAccounts() {
    print('\n=== All Accounts ===');
    for (var acc in _accounts.getAll()) {
      acc.display();
    }
  }
}

class TransactionObserver {
  final StreamController<String> _controller = StreamController<String>.broadcast();
  Stream<String> get stream => _controller.stream;
  void notify(String event) => _controller.add(event);
  void dispose() => _controller.close();
}

class BankConsoleApp with Logger {
  final Bank _bank;
  final TransactionObserver _observer;

  BankConsoleApp(this._bank, this._observer) {
    _observer.stream.listen((event) {
      print('[Observer received: $event]');
    });
  }

  void run() {
    log('BankConsoleApp started');

    var aliceSavings = _bank.createSavingsAccount('Alice', 1000);
    var bobCurrent = _bank.createCurrentAccount('Bob', 500, 200);

    _observer.notify('Alice opens savings account');
    _observer.notify('Bob opens current account');

    aliceSavings.deposit(300);
    _observer.notify('Alice deposits \$300');

    _bank.transfer('1001', '1002', 200);
    _observer.notify('Alice sends \$200 to Bob');

    _bank.listAccounts();

    aliceSavings.withdraw(900); // Should fail — min balance
    bobCurrent.withdraw(600);   // Should succeed — uses overdraft
  }
}

void main() {
  var bank = Bank();
  var anotherRef = Bank();
  print('Same bank instance: ${identical(bank, anotherRef)}'); // true

  var observer = TransactionObserver();
  var app = BankConsoleApp(bank, observer);
  app.run();

  observer.dispose();
}
```

### Explanation

This project integrates **every OOP concept** from the course:

| Concept | Where it's used |
|---|---|
| **Encapsulation** | Private fields `_accountNumber`, `_balance` in `Account` |
| **Inheritance** | `SavingsAccount` and `CurrentAccount` extend `Account` |
| **Polymorphism** | `Account` references hold child objects; `display()` and `canWithdraw()` dispatch dynamically |
| **Abstract classes** | `Account` is abstract with `canWithdraw()` as an abstract method |
| **Interfaces** | `implements Identifiable` on `Account` |
| **Mixins** | `Logger` mixin on `Account` and `Bank`; `with Logger` |
| **Generics** | `Repository<T extends Identifiable>` with type constraint |
| **Singleton** | `Bank` with private constructor and factory |
| **Observer** | `TransactionObserver` using `StreamController` |
| **Best practices** | Immutable fields where possible, single responsibility, composition |

The system is extensible — adding `BusinessAccount` requires only a new class extending `Account` with its own `canWithdraw()` logic, without changing `Bank`, `Repository`, or the observer.
