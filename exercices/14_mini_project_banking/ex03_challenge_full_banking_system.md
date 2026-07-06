# Mini Project — Banking System (Challenge)

## Instructions

Build a **complete banking system** integrating every OOP concept from the course.

### Requirements

#### 1. `Identifiable` interface
```dart
class Identifiable {
  String getID() => '';
}
```

#### 2. `Account` abstract class (implements `Identifiable`)
- Private fields: `_accountNumber`, `_owner`, `_balance`
- Constructor, getters
- Abstract: `bool canWithdraw(double amount)`
- Concrete: `deposit()`, `withdraw()` (calls `canWithdraw`), `display()`
- Uses `Logger` mixin

#### 3. `SavingsAccount` — min balance $100, `canWithdraw` checks that
#### 4. `CurrentAccount` — overdraft limit, `canWithdraw` checks it

#### 5. `Repository<T extends Identifiable>` (generic)
- Store, add, findById, removeById, getAll, count, findBy

#### 6. `Bank` (Singleton)
- `Repository<Account>` for storage
- Create savings and current accounts
- Transfer between accounts
- Uses `Logger` mixin

#### 7. `TransactionBroadcaster` (Observer pattern)
- `StreamController<String>.broadcast()`
- `Stream<String> get stream`
- `void emit(String event)`

#### 8. `BankingSystem`
- Combines everything
- Uses `TransactionBroadcaster` to emit events on deposits, withdrawals, transfers

### In `main()`:
- Verify Bank is a singleton
- Create one savings and one current account
- Perform deposits, withdrawals, transfers
- Listen to the broadcaster stream and print events
- List all accounts via the repository

## Expected Output (example)

```
[BANK] Savings 1001: Alice opened with $1000.0
[BANK] Current 1002: Bob opened with $500.0 (overdraft: $200)
[TX] Deposit: +$300.0 to 1001
[TX] Withdrawal: -$200.0 from 1001
[BANK] Transfer $150.0 from 1001 to 1002
[TX] Transfer: $150.0 from 1001 to 1002
Alice (1001) — Balance: $950.0 (Savings)
Bob (1002) — Balance: $650.0 (Current)
Same bank: true
```
