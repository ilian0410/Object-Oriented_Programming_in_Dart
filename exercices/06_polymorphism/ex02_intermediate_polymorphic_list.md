# Polymorphism — Intermediate

## Instructions

Complete the code below. The `PaymentMethod` base class has a `pay(double amount)` method. Three subclasses override it differently.

Your task: create a list of `PaymentMethod` containing one `CreditCard`, one `PayPal`, and one `Cash` payment. Then loop through the list and call `pay(100)` on each.

## Starter Code

```dart
class PaymentMethod {
  void pay(double amount) => print('Paying \$$amount');
}

class CreditCard extends PaymentMethod {
  String cardNumber;

  CreditCard(this.cardNumber);

  @override
  void pay(double amount) =>
      print('Paid \$$amount with card ****${cardNumber.substring(cardNumber.length - 4)}');
}

class PayPal extends PaymentMethod {
  String email;

  PayPal(this.email);

  @override
  void pay(double amount) =>
      print('Paid \$$amount via PayPal ($email)');
}

class Cash extends PaymentMethod {
  @override
  void pay(double amount) =>
      print('Paid \$$amount in cash');
}

void main() {
  // TODO: create a List<PaymentMethod> with all three types
  // TODO: loop through and call pay(100) on each
}
```

## Expected Output

```
Paid $100 with card ****1234
Paid $100 via PayPal (alice@mail.com)
Paid $100 in cash
```
