## Solution

```dart
class BankAccount {
  String accountNumber;
  String owner;
  double _balance;

  BankAccount(this.accountNumber, this.owner, [double initialBalance = 0])
      : _balance = initialBalance;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('${owner} deposited \$${amount.toStringAsFixed(2)}. Balance: \$${_balance.toStringAsFixed(2)}');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && _balance >= amount) {
      _balance -= amount;
      print('${owner} withdrew \$${amount.toStringAsFixed(2)}. Balance: \$${_balance.toStringAsFixed(2)}');
    } else {
      print('${owner} tried to withdraw \$${amount.toStringAsFixed(2)} — insufficient funds');
    }
  }

  void displayBalance() {
    print('$accountNumber — $owner: \$${_balance.toStringAsFixed(2)}');
  }
}

class Bank {
  List<BankAccount> _accounts = [];
  int _nextNumber = 1001;

  BankAccount createAccount(String owner) {
    var acc = BankAccount(_nextNumber.toString(), owner);
    _accounts.add(acc);
    print('Created account ${_nextNumber} for ${owner} (Balance: \$${acc.balance.toStringAsFixed(2)})');
    _nextNumber++;
    return acc;
  }

  BankAccount? findAccount(String accountNumber) {
    for (var acc in _accounts) {
      if (acc.accountNumber == accountNumber) return acc;
    }
    return null;
  }

  void transfer(String fromNumber, String toNumber, double amount) {
    var from = findAccount(fromNumber);
    var to = findAccount(toNumber);
    if (from != null && to != null && amount > 0) {
      from.withdraw(amount);
      to.deposit(amount);
      print('Transferred \$${amount.toStringAsFixed(2)} from $fromNumber to $toNumber');
    }
  }

  void listAccounts() {
    print('\n=== Account List ===');
    for (var acc in _accounts) {
      acc.displayBalance();
    }
  }
}

void main() {
  var bank = Bank();
  var acc1 = bank.createAccount('Alice');
  var acc2 = bank.createAccount('Bob');
  var acc3 = bank.createAccount('Charlie');

  acc1.deposit(1000);
  acc2.deposit(500);

  bank.transfer('1001', '1002', 200);

  print('Alice balance: \$${acc1.balance.toStringAsFixed(2)}');
  print('Bob balance: \$${acc2.balance.toStringAsFixed(2)}');

  acc3.withdraw(100);

  bank.listAccounts();
}
```

### Explanation

- **Next account number**: `_nextNumber` auto-increments to generate unique account numbers starting from "1001".
- **Controlled balance access**: `balance` getter provides read-only access. All modifications go through `deposit()` and `withdraw()` with validation.
- **Transfer logic**: Uses `findAccount()` to resolve both accounts, then performs withdraw/deposit as individual operations.
- The `Bank` manages all accounts centrally, ensuring consistent operations like transfers.
