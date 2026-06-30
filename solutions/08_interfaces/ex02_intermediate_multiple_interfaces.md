## Solution

```dart
class Serializable {
  String toJson() => '';
  void fromJson(String json) {}
}

class Loggable {
  void logInfo() {}
  String getLoggerName() => '';
}

class Validatable {
  bool isValid() => true;
  List<String> getErrors() => [];
}

class UserAccount implements Serializable, Loggable, Validatable {
  String username;
  String email;
  int age;

  UserAccount(this.username, this.email, this.age);

  @override
  String toJson() => '{"username":"$username","email":"$email","age":$age}';

  @override
  void fromJson(String json) {
    var parts = json.replaceAll(RegExp(r'[{}"]'), '').split(',');
    for (var part in parts) {
      var kv = part.split(':');
      if (kv.length == 2) {
        var key = kv[0].trim();
        var value = kv[1].trim();
        if (key == 'username') username = value;
        if (key == 'email') email = value;
        if (key == 'age') age = int.parse(value);
      }
    }
  }

  @override
  void logInfo() => print('[UserAccount] $username ($email)');

  @override
  String getLoggerName() => 'UserAccount';

  @override
  bool isValid() => username.isNotEmpty && email.contains('@') && age > 0;

  @override
  List<String> getErrors() {
    var errors = <String>[];
    if (username.isEmpty) errors.add('Username is required');
    if (!email.contains('@')) errors.add('Email must contain @');
    if (age <= 0) errors.add('Age must be positive');
    return errors;
  }
}

void main() {
  var user = UserAccount('alice', 'a@b.com', 25);

  print('Serialized: ${user.toJson()}');
  user.logInfo();
  print('Valid: ${user.isValid()}');

  var invalid = UserAccount('bob', 'invalid', -1);
  print('\n--- Invalid user ---');
  print('Errors:');
  for (var e in invalid.getErrors()) {
    print('  - $e');
  }
}
```

### Explanation

- `UserAccount` implements three interfaces: `Serializable`, `Loggable`, and `Validatable`. It must provide **all methods** from all three interfaces.
- This is **multiple interface implementation** — a capability not possible with `extends` (single inheritance only).
- Each interface represents a different **concern** or **capability**. By implementing all three, `UserAccount` is simultaneously serializable, loggable, and validatable.
- The class can be used wherever any of its interface types are expected, enabling polymorphic behavior across multiple dimensions.
