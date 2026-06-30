# Mini Project — Banking System (Intermediate)

## Instructions

Extend the banking system with different account types, a transaction logger mixin, and a notification stream.

### Requirements

#### `TransactionLogger` mixin
- A method `log(String message)` that prints `"[TX] $message"` with a timestamp

#### `Account` (abstract-like base class)
- Fields: `accountNumber` (String), `owner` (String), `_balance` (double)
- Constructor, getter for balance
- Methods: `deposit(double amount)`, `withdraw(double amount)` (abstract), `display()`
- Uses `TransactionLogger` mixin

#### `SavingsAccount` extends `Account`
- Additional field: `_interestRate` (double)
- Override `withdraw()`: charges a `$1` fee per withdrawal
- Method: `applyInterest()` — adds interest to balance

#### `CurrentAccount` extends `Account`
- Additional field: `_overdraftLimit` (double)
- Override `withdraw()`: allows balance to go negative up to the overdraft limit

#### `TransactionNotifier`
- Uses `StreamController` to broadcast transactions
- Method: `Stream<String> get transactions`
- Method: `void notify(String event)` — adds to stream

### In `main()`:
- Create a `SavingsAccount` and a `CurrentAccount`
- Perform deposits and withdrawals on both
- Show that savings account charges a fee
- Show that current account allows overdraft up to the limit
- Listen to transactions stream and print notifications

## Expected Output (example)

```
[TX] Savings 1001 deposit: +$1000.00
[TX] Savings 1001 withdrawal: -$200.00 (fee: $1.00)
Savings 1001 — Balance: $799.00

[TX] Current 1002 deposit: +$500.00
[TX] Current 1002 withdrawal: -$600.00
Current 1002 — Balance: -$100.00 (Overdraft used: $100.00)

[TX] Current 1002 withdrawal: -$500.00
Insufficient funds (overdraft limit exceeded)
```
