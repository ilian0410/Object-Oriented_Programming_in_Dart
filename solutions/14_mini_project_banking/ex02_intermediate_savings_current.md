## Solution

```dart
import 'dart:async';

mixin TransactionLogger {
  void log(String message) => print('[TX] $message');
}

abstract class Account with TransactionLogger {
  String accountNumber;
  String owner;
  double _balance;

  Account(this.accountNumber, this.owner, this._balance);

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      log('${accountNumber} deposit: +\$${amount.toStringAsFixed(2)}');
    }
  }

  void withdraw(double amount);
  void display();
}

class SavingsAccount extends Account {
  double _interestRate;

  SavingsAccount(String accountNumber, String owner, double balance, this._interestRate)
      : super(accountNumber, owner, balance);

  @override
  void withdraw(double amount) {
    var fee = 1.0;
    if (amount > 0 && _balance >= amount + fee) {
      _balance -= (amount + fee);
      log('${accountNumber} withdrawal: -\$${amount.toStringAsFixed(2)} (fee: \$${fee.toStringAsFixed(2)})');
    } else {
      print('Insufficient funds');
    }
  }

  void applyInterest() {
    var interest = _balance * _interestRate / 100;
    _balance += interest;
    log('${accountNumber} interest: +\$${interest.toStringAsFixed(2)}');
  }

  @override
  void display() {
    print('Savings $accountNumber — Balance: \$${_balance.toStringAsFixed(2)}');
  }
}

class CurrentAccount extends Account {
  double _overdraftLimit;

  CurrentAccount(String accountNumber, String owner, double balance, this._overdraftLimit)
      : super(accountNumber, owner, balance);

  @override
  void withdraw(double amount) {
    if (amount > 0 && _balance - amount >= -_overdraftLimit) {
      _balance -= amount;
      log('${accountNumber} withdrawal: -\$${amount.toStringAsFixed(2)}');
      if (_balance < 0) {
        print('(Overdraft used: \$${(-_balance).toStringAsFixed(2)})');
      }
    } else {
      print('Insufficient funds (overdraft limit exceeded)');
    }
  }

  @override
  void display() {
    print('Current $accountNumber — Balance: \$${_balance.toStringAsFixed(2)}');
  }
}

class TransactionNotifier {
  final StreamController<String> _controller = StreamController<String>.broadcast();
  Stream<String> get transactions => _controller.stream;
  void notify(String event) => _controller.add(event);
  void dispose() => _controller.close();
}

void main() {
  var savings = SavingsAccount('1001', 'Alice', 1000, 2.5);
  var current = CurrentAccount('1002', 'Bob', 500, 200);

  var notifier = TransactionNotifier();
  notifier.transactions.listen((e) => print('[Notifier] $e'));

  savings.deposit(1000);
  savings.withdraw(200);
  savings.display();

  current.deposit(500);
  current.withdraw(600);
  current.display();

  current.withdraw(500); // exceeds overdraft limit
}
```

### Explanation

- **`TransactionLogger` mixin**: Adds logging capability to both account types without inheritance. The `log()` method prefixes messages with `[TX]`.
- **SavingsAccount**: Charges a `$1` fee per withdrawal by overriding `withdraw()`. Also provides `applyInterest()` for interest calculation.
- **CurrentAccount**: Allows balance to go negative up to `_overdraftLimit`. The `withdraw()` override checks `balance - amount >= -overdraftLimit`.
- **Abstract `withdraw()`**: Each account type implements withdrawal differently, demonstrating polymorphic behavior through the abstract `Account` class.
- **`TransactionNotifier`**: Uses a `StreamController.broadcast()` to notify external listeners about transactions — a preview of the Observer pattern.
