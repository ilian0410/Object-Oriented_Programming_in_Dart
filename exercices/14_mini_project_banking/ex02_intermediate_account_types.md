# Mini Project — Banking System (Intermediate)

## Instructions

Extend the banking system with different account types and a transaction logger mixin.

### `Logger` mixin
```dart
mixin Logger {
  void log(String message) => print('[BANK] $message');
}
```

### `Account` abstract class
- **Private fields**: `_accountNumber` (String), `_owner` (String), `_balance` (double)
- **Constructor**: takes all three
- **Getters**: `accountNumber`, `owner`, `balance`
- **Abstract method**: `bool canWithdraw(double amount)`
- **Concrete methods**: `deposit(double amount)`, `withdraw(double amount)` (checks `canWithdraw` first), `display()`
- **Uses `Logger` mixin**

### `SavingsAccount` extends `Account`
- **Additional field**: `_interestRate` (double)
- **Constructor**: takes all fields, passes to `super`
- **`canWithdraw(amount)`**: returns true if `balance - amount >= 50` (minimum balance requirement) AND amount > 0
- **Method**: `applyInterest()` — adds interest to balance

### `CurrentAccount` extends `Account`
- **Additional field**: `_overdraftLimit` (double)
- **Constructor**: takes all fields, passes to `super`
- **`canWithdraw(amount)`**: returns true if `balance - amount >= -_overdraftLimit`

### In `main()`:
- Create a `SavingsAccount` (Alice, $1000, 2.5% interest) and a `CurrentAccount` (Bob, $500, $200 overdraft)
- Deposit, withdraw, apply interest on savings
- Show that savings blocks withdrawals below minimum balance
- Show that current account allows overdraft up to limit

## Expected Output (example)

```
[BANK] Savings 1001 deposit: +$500.0
[BANK] Savings 1001 withdrawal: -$200.0
[BANK] Savings 1001 interest applied: +$32.5
Savings 1001 — Alice: $1332.5
[BANK] Current 1002 deposit: +$300.0
[BANK] Current 1002 withdrawal: -$700.0
Current 1002 — Bob: $100.0
[BANK] Current 1002 withdrawal: -$400.0
Insufficient funds (overdraft limit exceeded)
```
