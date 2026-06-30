# Mini Project — Banking System (Challenging)

## Instructions

Build a **complete banking system** that integrates every OOP concept from the course.

### Requirements

#### 1. `Identifiable` interface (class form)
```dart
class Identifiable {
  String getId();
}
```

#### 2. `Account` (abstract, implements `Identifiable`)
- Fields: `_accountNumber` (String, final), `_owner` (String), `_balance` (double)
- Abstract method: `bool canWithdraw(double amount)`
- Concrete methods: `deposit()`, `withdraw()` (calls `canWithdraw()` first), `getBalance()`, `getId()`
- Has a `TransactionLogger` mixin

#### 3. Account types
- **`SavingsAccount`**: minimum balance of $100 required; withdrawal fee of $1; `canWithdraw()` checks `balance - amount >= 100 + 1`
- **`CurrentAccount`**: overdraft limit; `canWithdraw()` checks `balance - amount >= -overdraftLimit`

#### 4. `Repository<T extends Identifiable>` (generic)
- Stores items, add, getById, remove, getAll, find, count

#### 5. `Bank` (Singleton)
- Holds a `Repository<Account>` for accounts
- Method: `createSavingsAccount(owner, initialDeposit)`
- Method: `createCurrentAccount(owner, initialDeposit, overdraftLimit)`
- Method: `findAccount(String number)`
- Method: `transfer(from, to, amount)`
- Uses `TransactionLogger` mixin

#### 6. `TransactionObserver` (Observer pattern)
- `StreamController` for transaction events
- `Stream<String> get stream`
- Method: `notify(String event)`

#### 7. `BankConsoleApp`
- Combines everything together
- Menu-driven interface (simulated in `main()`)

### Starter Code Skeleton

```dart
import 'dart:async';

mixin Logger {
  void log(String msg) => print('[LOG] $msg');
}

class Identifiable {
  String getId();
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

  void deposit(double amount) { ... }
  void withdraw(double amount) { ... }
  void display() { ... }
}

// TODO: SavingsAccount, CurrentAccount
// TODO: Repository<T extends Identifiable>
// TODO: Bank (Singleton)
// TODO: TransactionObserver
// TODO: BankConsoleApp

void main() {
  // Demonstrate the full system:
  // 1. Create bank (singleton)
  // 2. Create accounts (savings and current)
  // 3. Deposit, withdraw, transfer
  // 4. Show observer notifications
  // 5. List all accounts via repository
  // 6. Demonstrate singleton identity
}
```

## Expected Output (example)

```
[LOG] Bank instance created
[LOG] Savings account 1001 created for Alice (deposit: $1000)
[LOG] Current account 1002 created for Bob (deposit: $500, overdraft: $200)

[TX] Deposit: +$1000.00 to 1001
[TX] Deposit: +$500.00 to 1002

[TX] Transfer: $300.00 from 1001 to 1002
[TX] Withdrawal: -$300.00 from 1001
[TX] Deposit: +$300.00 to 1002

Alice (1001) — Balance: $699.00 (Savings)
Bob (1002) — Balance: $800.00 (Current)

[Trying to withdraw $650 from Savings]
[TX] Failed withdrawal: insufficient funds (min balance requirement)

[Observer received: Transfer: $300.00 from 1001 to 1002]
[Observer received: Withdrawal: -$300.00 from 1001]

Same bank instance: true
```
