## Solution

```dart
class BankAccount {
  String owner;
  double _balance;

  BankAccount(this.owner, this._balance);

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && _balance >= amount) {
      _balance -= amount;
      print('Withdrew \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
    } else {
      print('Tried to withdraw \$${amount.toStringAsFixed(2)} — insufficient funds');
    }
  }
}

void main() {
  var acc = BankAccount('Alice', 1500);
  print('Owner: ${acc.owner}, Balance: \$${acc.balance.toStringAsFixed(2)}');
  acc.deposit(500);
  acc.withdraw(200);
  acc.withdraw(5000);
  // acc._balance = -100; // ERROR: _balance is not accessible outside the class
}
```

### Explanation

- `_balance` is private (prefixed with `_`), so it cannot be directly modified from outside the class.
- The `balance` getter provides read-only access to `_balance` without exposing the field for modification.
- `deposit()` and `withdraw()` are the only ways to change the balance, and they enforce business rules (no negative deposits, no overdrafts).
- This is the essence of encapsulation: controlled access through a public interface while hiding internal implementation details.
