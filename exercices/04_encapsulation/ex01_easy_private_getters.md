# Encapsulation — Easy

## Instructions

Create a `BankAccount` class with:

- A **private field** `_balance` (double)
- A **public field** `owner` (String)
- A **getter** `balance` that returns `_balance`
- A **method** `deposit(double amount)` that adds to `_balance` if amount > 0
- A **method** `withdraw(double amount)` that subtracts from `_balance` if amount > 0 and sufficient funds exist

In `main()`, demonstrate that:
- You can read the balance through the getter
- You cannot access `_balance` directly (comment out the line that would cause an error)

## Expected Output

```
Owner: Alice, Balance: $1500.00
Deposited 500. New balance: $2000.00
Withdrew 200. New balance: $1800.00
Tried to withdraw 5000 — insufficient funds
```
