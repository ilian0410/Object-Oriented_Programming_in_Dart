# Mini Project — Banking System (Easy)

## Instructions

Build a basic **bank account system** with a single account type and simple operations.

### `BankAccount` class
- Private field `_balance` (double, default 0.0)
- Public fields: `accountNumber` (String), `owner` (String)
- Constructor takes `accountNumber`, `owner`, and optional `initialBalance`
- Getter for `balance`
- Method `deposit(double amount)` — add to balance if amount > 0
- Method `withdraw(double amount)` — subtract from balance if amount > 0 and sufficient funds exist; otherwise print error message
- Method `displayBalance()` — prints current balance formatted

### `Bank` class
- Holds a list of `BankAccount` objects
- Method `createAccount(String owner)` — generates a unique account number (e.g., starting from "1001") and creates a new account
- Method `findAccount(String accountNumber)` — returns the account or null
- Method `transfer(String fromAccount, String toAccount, double amount)` — transfers money between two accounts
- Method `listAccounts()` — prints all account numbers and owners

### In `main()`:
- Create a `Bank`
- Create 3 accounts
- Deposit and withdraw from accounts
- Transfer between accounts
- Display all balances

## Expected Output (example)

```
Created account 1001 for Alice (Balance: $0.00)
Created account 1002 for Bob (Balance: $0.00)
Created account 1003 for Charlie (Balance: $0.00)

Alice deposited $1000.00. Balance: $1000.00
Bob deposited $500.00. Balance: $500.00

Transferred $200.00 from Alice to Bob
Alice balance: $800.00
Bob balance: $700.00

Charlie tried to withdraw $100.00 — insufficient funds

=== Account List ===
1001 — Alice: $800.00
1002 — Bob: $700.00
1003 — Charlie: $0.00
```
