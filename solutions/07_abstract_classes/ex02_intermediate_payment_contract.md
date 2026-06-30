## Solution

```dart
abstract class Payment {
  double amount;

  Payment(this.amount);

  bool validate();
  void process();
  String getReceipt();
}

class CreditCardPayment extends Payment {
  String cardNumber;
  String cvv;
  String expiryDate;

  CreditCardPayment(double amount, this.cardNumber, this.cvv, this.expiryDate)
      : super(amount);

  @override
  bool validate() {
    return cardNumber.length == 16 && cvv.length == 3;
  }

  @override
  void process() {
    print('CreditCard: Processing credit card payment of \$$amount...');
  }

  @override
  String getReceipt() {
    var masked = '****-****-****-${cardNumber.substring(12)}';
    return 'CreditCard: $masked';
  }
}

class PayPalPayment extends Payment {
  String email;
  String password;

  PayPalPayment(double amount, this.email, this.password) : super(amount);

  @override
  bool validate() => email.contains('@');

  @override
  void process() {
    print('PayPal: Processing PayPal payment of \$$amount...');
  }

  @override
  String getReceipt() => 'PayPal: $email';
}

class CashPayment extends Payment {
  CashPayment(double amount) : super(amount);

  @override
  bool validate() => amount > 0 && amount <= 10000;

  @override
  void process() {
    print('Cash: Cash payment of \$$amount received');
  }

  @override
  String getReceipt() => 'Cash: Cash payment — no receipt';
}

void main() {
  List<Payment> payments = [
    CreditCardPayment(150.0, '1234567890123456', '123', '12/26'),
    PayPalPayment(89.99, 'alice@mail.com', 'pass123'),
    CashPayment(50.0),
    CreditCardPayment(200.0, '1234', '12', '12/26'), // invalid
  ];

  for (var p in payments) {
    if (p.validate()) {
      p.process();
      print(p.getReceipt());
    } else {
      print('${p.runtimeType}: Validation failed');
    }
  }
}
```

### Explanation

- The abstract `Payment` class defines a **contract** with three methods. Every payment method must implement all three.
- Each concrete class has its own **validation logic**, **processing behavior**, and **receipt format** — yet they're all treated uniformly as `Payment` objects.
- The loop in `main()` calls `validate()` → `process()` → `getReceipt()` polymorphically, without any type checks.
- This is the **Template Method** pattern in action: the abstract class defines the structure, subclasses fill in the details.
