# Inheritance — Intermediate

## Instructions

Build an employee hierarchy.

### Base class `Employee`
- Fields: `name` (String), `baseSalary` (double)
- Constructor
- Method `calculatePay()` that returns `baseSalary`
- Method `describe()` that prints `"name earns \$X"`

### Subclass `Manager`
- Additional field: `bonus` (double)
- Override `calculatePay()` to return `baseSalary + bonus`
- Override `describe()` to call `super.describe()` then print `"(includes \$bonus bonus)"`

### Subclass `Intern`
- Additional field: `durationMonths` (int)
- Override `calculatePay()` to return `baseSalary * 0.5` (interns earn half)
- Override `describe()` to call `super.describe()` then print `"(intern for $durationMonths months)"`

## Expected Output

```dart
void main() {
  var emp = Employee('Alice', 3000);
  var mgr = Manager('Bob', 5000, 1500);
  var intern = Intern('Charlie', 2000, 6);

  emp.describe(); // Alice earns $3000.0
  mgr.describe(); // Bob earns $6500.0 (includes $1500.0 bonus)
  intern.describe(); // Charlie earns $1000.0 (intern for 6 months)
}
```
