import 'dart:async';

class Identifiable {
  String getID() => '';
}

mixin Logger {
  void log(String message) {
    print(message);
  }
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
  String getID() => _accountNumber;

  bool canWithdraw(double amount);

  void deposit(double amount) {
    _balance += amount;
  }

  void withdraw(double amount) {
    if (canWithdraw(amount)) {
      _balance -= amount;
    }
  }

  void display();
}

class SavingsAccount extends Account {
  SavingsAccount(String accountNumber, String owner, double balance)
    : super(accountNumber, owner, balance);

  @override
  bool canWithdraw(double amount) {
    return (_balance - amount) >= 100.0;
  }

  @override
  void display() {
    print(
      '$owner ($accountNumber) — Balance: \$${_balance.toStringAsFixed(1)} (Savings)',
    );
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(
    String accountNumber,
    String owner,
    double balance,
    this.overdraftLimit,
  ) : super(accountNumber, owner, balance);

  @override
  bool canWithdraw(double amount) {
    return (_balance + overdraftLimit) >= amount;
  }

  @override
  void display() {
    print(
      '$owner ($accountNumber) — Balance: \$${_balance.toStringAsFixed(1)} (Current)',
    );
  }
}

class Repository<T extends Identifiable> {
  List<T> _items = [];

  void add(T item) {
    _items.add(item);
  }

  T? findById(String id) {
    for (var item in _items) {
      if (item.getID() == id) {
        return item;
      }
    }
    return null;
  }

  void removeById(String id) {
    _items.removeWhere((item) => item.getID() == id);
  }

  List<T> getAll() {
    return _items;
  }

  int count() {
    return _items.length;
  }

  List<T> findBy(bool Function(T) predicate) {
    List<T> List1 = [];
    for (var item in _items) {
      if (predicate(item)) {
        List1.add(item);
      }
    }
    return List1;
  }
}

class Bank with Logger {
  static final Bank _instance = Bank._internal();

  factory Bank() {
    return _instance;
  }

  Bank._internal();

  Repository<Account> repository = Repository<Account>();
  int _nextId = 1001;

  SavingsAccount createSavingsAccount(String owner, double initialBalance) {
    String id = '$_nextId';
    _nextId++;

    var account = SavingsAccount(id, owner, initialBalance);
    repository.add(account);
    log(
      '[BANK] Savings $id: $owner opened with \$${initialBalance.toStringAsFixed(1)}',
    );
    return account;
  }

  CurrentAccount createCurrentAccount(
    String owner,
    double initialBalance,
    double overdraftLimit,
  ) {
    String id = '$_nextId';
    _nextId++;

    var account = CurrentAccount(id, owner, initialBalance, overdraftLimit);
    repository.add(account);
    log(
      '[BANK] Current $id: $owner opened with \$${initialBalance.toStringAsFixed(1)} (overdraft: \$${overdraftLimit.toStringAsFixed(0)})',
    );
    return account;
  }

  bool transfer(String fromId, String toId, double amount) {
    var fromAccount = repository.findById(fromId);
    var toAccount = repository.findById(toId);

    if (fromAccount != null && toAccount != null) {
      if (fromAccount.canWithdraw(amount)) {
        fromAccount.withdraw(amount);
        toAccount.deposit(amount);
        log(
          '[BANK] Transfer \$${amount.toStringAsFixed(1)} from $fromId to $toId',
        );
        return true;
      }
    }
    return false;
  }
}

class TransactionBroadcaster {
  final StreamController<String> _controller =
      StreamController<String>.broadcast(sync: true);

  Stream<String> get stream => _controller.stream;

  void emit(String event) {
    _controller.add(event);
  }

  void close() {
    _controller.close();
  }
}

class BankingSystem {
  final Bank bank = Bank();
  final TransactionBroadcaster broadcaster = TransactionBroadcaster();

  void deposit(String accountId, double amount) {
    var account = bank.repository.findById(accountId);
    if (account != null) {
      account.deposit(amount);
      broadcaster.emit(
        '[TX] Deposit: +\$${amount.toStringAsFixed(1)} to $accountId',
      );
    }
  }

  void withdraw(String accountId, double amount) {
    var account = bank.repository.findById(accountId);
    if (account != null) {
      if (account.canWithdraw(amount)) {
        account.withdraw(amount);
        broadcaster.emit(
          '[TX] Withdrawal: -\$${amount.toStringAsFixed(1)} from $accountId',
        );
      }
    }
  }

  void transfer(String fromId, String toId, double amount) {
    bool success = bank.transfer(fromId, toId, amount);
    if (success) {
      broadcaster.emit(
        '[TX] Transfer: \$${amount.toStringAsFixed(1)} from $fromId to $toId',
      );
    }
  }
}

void main() {
  final b1 = Bank();
  final b2 = Bank();
  final syst = BankingSystem();

  syst.broadcaster.stream.listen((event) {
    print(event);
  });

  final Alice = syst.bank.createSavingsAccount('Alice', 1000.0);
  final Bob = syst.bank.createCurrentAccount('Bob', 500.0, 200.0);

  syst.deposit(Alice.getID(), 300.0);
  syst.withdraw(Alice.getID(), 200.0);
  syst.transfer(Alice.getID(), Bob.getID(), 150.0);

  List<Account> tousLesComptes = syst.bank.repository.getAll();
  for (var account in tousLesComptes) {
    account.display();
  }

  print('Same bank: ${b1 == b2}');

  syst.broadcaster.close();
}
