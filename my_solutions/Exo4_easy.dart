class BankAccount {
  String owner;
  double _balance;

  BankAccount(this.owner, this._balance);

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }

  void withdraw(double amount) {
    if ((amount <= _balance) && (amount >= 0)) {
      _balance -= amount;
    } else {
      print('Tried to withdraw \$${amount} — Insufficient funds');
    }
  }
}

void main() {
  var account = BankAccount('Alice', 1000.0);
  print('Owner: ${account.owner}, Balance: \$${account.balance}');
  account.deposit(500.0);
  print('Deposited \$500.0. New balance: \$${account.balance}');
  account.withdraw(200.0);
  print('Withdrew \$200.0. New balance: \$${account.balance}');
  account.withdraw(2000.0);
}




