# Encapsulation — Intermediate

## Instructions

Complete the `Employee` class below. Each setter must validate input before storing the value.

### Validation rules

- **name**: cannot be empty. If invalid, print `"Invalid name"` and keep the old value.
- **salary**: must be between 0 and 100000. If invalid, print `"Invalid salary"` and keep the old value.
- **yearsEmployed**: must be between 0 and 50. If invalid, print `"Invalid years"` and keep the old value.

## Starter Code

```dart
class Employee {
  String _name;
  double _salary;
  int _yearsEmployed;

  Employee(this._name, this._salary, this._yearsEmployed);

  // TODO: add getters
  // TODO: add name setter with validation
  // TODO: add salary setter with validation
  // TODO: add yearsEmployed setter with validation

  void display() {
    print('$_name — Salary: \$$_salary, Years: $_yearsEmployed');
  }
}

void main() {
  var emp = Employee('Alice', 50000, 5);
  emp.display(); // Alice — Salary: $50000, Years: 5

  emp.name = 'Bob';
  emp.salary = 60000;
  emp.yearsEmployed = 6;
  emp.display(); // Bob — Salary: $60000, Years: 6

  // Test invalid values
  emp.name = '';       // Invalid name
  emp.salary = -100;   // Invalid salary
  emp.yearsEmployed = 100; // Invalid years

  emp.display(); // Bob — Salary: $60000, Years: 6 (unchanged)
}
```
