# Design Patterns — Intermediate

## Instructions

Implement the **Factory** pattern using Dart's `factory` constructor to create different types of `Notification` objects.

### `Notification` class with a factory constructor

```dart
class Notification {
  void send() {}
}
```

### Your task

1. **`EmailNotification`** extends `Notification`
   - Field: `email` (String)
   - Constructor: takes `email`
   - Override `send()`: prints `"Email sent to email"`

2. **`SmsNotification`** extends `Notification`
   - Field: `phoneNumber` (String)
   - Constructor: takes `phoneNumber`
   - Override `send()`: prints `"SMS sent to phoneNumber"`

3. **`PushNotification`** extends `Notification`
   - Field: `deviceToken` (String)
   - Constructor: takes `deviceToken`
   - Override `send()`: prints `"Push notification sent to deviceToken"`

4. **`NotificationFactory`** class
   - **Private constructor**: `NotificationFactory._()`
   - **Static factory method**: `Notification create(String type, Map<String, String> data)`
     - If `type` is `"email"`, return `EmailNotification(data['address']!)`
     - If `type` is `"sms"`, return `SmsNotification(data['phone']!)`
     - If `type` is `"push"`, return `PushNotification(data['token']!)`
     - Otherwise throw `ArgumentError`

## Expected Output

```dart
void main() {
  var notifications = [
    NotificationFactory.create('email', {'address': 'alice@mail.com'}),
    NotificationFactory.create('sms', {'phone': '+212600000000'}),
    NotificationFactory.create('push', {'token': 'abc123'}),
  ];

  for (var n in notifications) {
    n.send();
  }
}
// Email sent to alice@mail.com
// SMS sent to +212600000000
// Push notification sent to abc123
```
