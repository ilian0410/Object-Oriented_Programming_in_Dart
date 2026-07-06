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
  List<PaymentMethod> payments = [
    CreditCard('11111234'),
    PayPal('alice@mail.com'),
    Cash()
  ];
  // TODO: loop through and call pay(100) on each
  for (var payment in payments) {
    payment.pay(100);
  }
}