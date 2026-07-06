# Encapsulation — Easy

## Instructions

Create a `BankAccount` class with proper encapsulation.

### Requirements

- **Private field**: `_balance` (double)
- **Public field**: `owner` (String)
- **Constructor**: takes `owner` and `initialBalance` using shorthand syntax
- **Getter**: `balance` that returns `_balance`
- **Method**: `deposit(double amount)` — adds to balance if amount > 0
- **Method**: `withdraw(double amount)` — subtracts if sufficient funds exist, otherwise prints `"Insufficient funds"`

In `main()`, create an account, deposit money, withdraw money, and try an invalid withdrawal.

## Expected Output

```
Owner: Alice, Balance: $1000.0
Deposited $500.0. New balance: $1500.0
Withdrew $200.0. New balance: $1300.0
Tried to withdraw $2000.0 — Insufficient funds
```
