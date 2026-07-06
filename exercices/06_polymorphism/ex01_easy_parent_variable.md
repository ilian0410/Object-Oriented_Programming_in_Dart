# Polymorphism — Easy

## Instructions

Complete the code below. The `Notification` base class has a `send()` method. `EmailNotification` and `SmsNotification` override it differently.

Your task: in `main()`, store an `EmailNotification` in a `Notification` variable and an `SmsNotification` in another `Notification` variable, then call `send()` on each.

## Starter Code

```dart
class Notification {
  void send() => print('Sending generic notification');
}

class EmailNotification extends Notification {
  String email;

  EmailNotification(this.email);

  @override
  void send() => print('Email sent to $email');
}

class SmsNotification extends Notification {
  String phone;

  SmsNotification(this.phone);

  @override
  void send() => print('SMS sent to $phone');
}

void main() {
  // TODO: create EmailNotification stored as Notification
  // TODO: create SmsNotification stored as Notification
  // TODO: call send() on both
}
```

## Expected Output

```
Email sent to alice@mail.com
SMS sent to +212600000000
```
