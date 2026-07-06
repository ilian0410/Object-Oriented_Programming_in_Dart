# Mini Project — Banking System (Easy)

## Instructions

Build a basic banking system with two classes.

### `Account` class
- **Private field**: `_balance` (double)
- **Public fields**: `accountNumber` (String), `owner` (String)
- **Constructor**: takes `accountNumber`, `owner`, and optional `initialBalance` (default 0)
- **Getter**: `balance`
- **Method**: `deposit(double amount)` — adds to balance if > 0
- **Method**: `withdraw(double amount)` — subtracts if sufficient funds, otherwise prints `"Insufficient funds"`
- **Method**: `display()` — prints `"accountNumber — owner: \$balance"`

### `SimpleBank` class
- **Private field**: `List<Account> _accounts` and `int _nextNumber` starting at 1001
- **Method**: `Account openAccount(String owner, [double initialDeposit = 0])` — creates account with unique number
- **Method**: `Account? findAccount(String number)` — finds by number
- **Method**: `bool transfer(String fromNum, String toNum, double amount)` — transfers between accounts
- **Method**: `void listAccounts()` — displays all accounts

### In `main()`:
- Open 3 accounts
- Deposit/withdraw
- Transfer between accounts
- Display all

## Expected Output (example)

```
Opened account 1001 for Alice
Opened account 1002 for Bob
Opened account 1003 for Charlie
Alice deposited $1000.0
Bob deposited $500.0
Transferred $200.0 from 1001 to 1002
1001 — Alice: $800.0
1002 — Bob: $700.0
1003 — Charlie: $0.0
```
