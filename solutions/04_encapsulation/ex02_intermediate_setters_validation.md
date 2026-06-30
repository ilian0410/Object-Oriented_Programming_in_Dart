## Solution

```dart
class Student {
  String _name;
  int _age;
  double _grade;

  Student(this._name, this._age) : _grade = 0.0;

  String get name => _name;
  int get age => _age;
  double get grade => _grade;

  set name(String value) {
    if (value.isEmpty || value.length > 50) {
      print('Invalid name: must be 1-50 characters');
    } else {
      _name = value;
    }
  }

  set age(int value) {
    if (value < 18 || value > 120) {
      print('Invalid age: must be 18-120');
    } else {
      _age = value;
    }
  }

  set grade(double value) {
    if (value < 0 || value > 100) {
      print('Invalid grade: must be 0.0-100.0');
    } else {
      _grade = value;
    }
  }

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

  s.name = '';          // Invalid name: must be 1-50 characters
  s.age = 15;           // Invalid age: must be 18-120
  s.grade = 150;        // Invalid grade: must be 0.0-100.0

  s.display(); // Bob (25 years) — Grade: 88.5 (unchanged)
}
```

### Explanation

- Each setter acts as a **guard** that validates input before modifying the internal field.
- When validation fails, the setter prints an error message but does **not** change the field — so the object retains its last valid state.
- Getters expose the private fields read-only, while setters provide write-access with validation.
- This pattern prevents objects from ever entering an invalid state, which is a key benefit of encapsulation.
