# Abstract Classes — Intermediate

## Instructions

Design a **payment processing system** using an abstract class as a contract.

### Abstract class `Payment`
```dart
abstract class Payment {
  double amount;

  Payment(this.amount);

  bool validate();
  void process();
  String getReceipt();
}
```

### Your task

Create three concrete payment methods:

1. **`CreditCardPayment`**
   - Fields: `cardNumber` (String), `cvv` (String), `expiryDate` (String)
   - `validate()`: cardNumber must be 16 digits, CVV must be 3 digits
   - `process()`: prints `"Processing credit card payment of \$$amount..."` and sleeps briefly (simulate with a simple print)
   - `getReceipt()`: returns a string with masked card number (e.g., `"****-****-****-1234"`)

2. **`PayPalPayment`**
   - Fields: `email` (String), `password` (String)
   - `validate()`: email must contain `@`
   - `process()`: prints `"Processing PayPal payment of \$$amount..."` and simulates redirect
   - `getReceipt()`: returns `"PayPal: $email"`

3. **`CashPayment`**
   - No additional fields
   - `validate()`: amount must be > 0 and <= 10000
   - `process()`: prints `"Cash payment of \$$amount received"`
   - `getReceipt()`: returns `"Cash payment — no receipt"`

### In `main()`:
- Create a list of `Payment` objects
- Try to process each one
- If validation fails, print the error and skip

## Expected Output (example)

```
CreditCard: Processing credit card payment of $150.0...
CreditCard: ****-****-****-1234
PayPal: Processing PayPal payment of $89.99...
PayPal: PayPal: alice@mail.com
Cash: Processing cash payment of $50.0...
Cash: Cash payment — no receipt
```
