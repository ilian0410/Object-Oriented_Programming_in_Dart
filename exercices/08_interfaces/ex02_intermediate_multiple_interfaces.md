# Interfaces in Dart — Intermediate

## Instructions

Create a class that implements **multiple interfaces**.

### Interface classes
```dart
class Serializable {
  String toJson();
  void fromJson(String json);
}

class Loggable {
  void logInfo();
  String getLoggerName();
}

class Validatable {
  bool isValid();
  List<String> getErrors();
}
```

### Your task

Create a `UserAccount` class that implements **all three** interfaces:

**Fields**: `username`, `email`, `age`

**`Serializable` implementation**:
- `toJson()`: returns a JSON string like `'{"username":"alice","email":"a@b.com","age":25}'`
- `fromJson(String json)`: parse a simple JSON string and populate fields (for simplicity, assume the format is always the same)

**`Loggable` implementation**:
- `logInfo()`: prints `"[UserAccount] username (email)"`
- `getLoggerName()`: returns `"UserAccount"`

**`Validatable` implementation**:
- `isValid()`: username must not be empty, email must contain `@`, age must be > 0
- `getErrors()`: returns a list of error messages for each invalid field

### In `main()`:
- Create a `UserAccount` and test the interfaces
- Demonstrate that it can be used as any of the three interface types

## Expected Output (example)

```
Serialized: {"username":"alice","email":"a@b.com","age":25}
[UserAccount] alice (a@b.com)
Valid: true

--- Invalid user ---
Errors:
  - Email must contain @
  - Age must be positive
```
