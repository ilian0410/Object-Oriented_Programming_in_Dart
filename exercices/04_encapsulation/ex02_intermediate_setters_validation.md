# Encapsulation — Intermediate

## Instructions

Complete the `Student` class below. It should enforce these rules through setters:

1. **Name**: cannot be empty or longer than 50 characters
2. **Age**: must be between 18 and 120
3. **Grade**: must be between 0.0 and 100.0; if not provided, default to 0.0

When a value is rejected, print a message like `"Invalid name: must be 1-50 characters"` but keep the previous valid value.

## Starter Code

```dart
class Student {
  String _name;
  int _age;
  double _grade;

  Student(this._name, this._age) : _grade = 0.0;

  // TODO: add getters

  // TODO: add setter for name with validation

  // TODO: add setter for age with validation

  // TODO: add setter for grade with validation

  void display() {
    print('$_name ($_age years) — Grade: $_grade');
  }
}

void main() {
  var s = Student('Alice', 20);
  s.display(); // Alice (20 years) — Grade: 0.0

  s.name = 'Bob';
  s.age = 25;
  s.grade = 88.5;
  s.display(); // Bob (25 years) — Grade: 88.5

  // Test validation
  s.name = '';          // Invalid name: must be 1-50 characters
  s.age = 15;           // Invalid age: must be 18-120
  s.grade = 150;        // Invalid grade: must be 0.0-100.0

  s.display(); // Bob (25 years) — Grade: 88.5 (unchanged)
}
```
