# Interfaces in Dart — Intermediate

## Instructions

Create a `User` class that implements **two interfaces** at the same time.

### Interface classes

```dart
class JsonSerializable {
  String toJson() => '';
}

class Describable {
  String getLabel() => '';
  Map<String, String> getProperties() => {};
}
```

### Requirements for `User` implementing both interfaces

- **Fields**: `username` (String), `email` (String), `age` (int)
- **Constructor**: parameterized using shorthand
- **`toJson()`**: returns a string like `'{"username":"alice","email":"a@b.com","age":25}'`
- **`getLabel()`**: returns `"User: username"`
- **`getProperties()`**: returns a map like `{"Username": username, "Email": email, "Age": age.toString()}`

## Expected Output

```dart
void main() {
  var user = User('alice', 'a@b.com', 25);

  print(user.toJson());
  // {"username":"alice","email":"a@b.com","age":25}

  print(user.getLabel());
  // User: alice

  print(user.getProperties());
  // {Username: alice, Email: a@b.com, Age: 25}
}
```
