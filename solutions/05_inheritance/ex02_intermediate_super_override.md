## Solution

```dart
class Employee {
  String name;
  double baseSalary;

  Employee(this.name, this.baseSalary);

  double calculatePay() => baseSalary;

  void describe() => print('$name earns \$${calculatePay()}');
}

class Manager extends Employee {
  double bonus;

  Manager(String name, double baseSalary, this.bonus) : super(name, baseSalary);

  @override
  double calculatePay() => baseSalary + bonus;

  @override
  void describe() {
    super.describe();
    print('(includes \$${bonus} bonus)');
  }
}

class Intern extends Employee {
  int durationMonths;

  Intern(String name, double baseSalary, this.durationMonths)
      : super(name, baseSalary);

  @override
  double calculatePay() => baseSalary * 0.5;

  @override
  void describe() {
    super.describe();
    print('(intern for $durationMonths months)');
  }
}

void main() {
  var emp = Employee('Alice', 3000);
  var mgr = Manager('Bob', 5000, 1500);
  var intern = Intern('Charlie', 2000, 6);

  emp.describe(); // Alice earns $3000.0
  mgr.describe(); // Bob earns $6500.0 (includes $1500.0 bonus)
  intern.describe(); // Charlie earns $1000.0 (intern for 6 months)
}
```

### Explanation

- **`@override`** annotation signals that this method intentionally replaces a parent method. Dart's analyzer will warn if no parent method matches the signature.
- **`super.describe()`** allows the subclass to extend the parent's behavior rather than fully replacing it. Both `Manager` and `Intern` call the parent first, then add their own output.
- Each subclass provides its own `calculatePay()` implementation, showing how inheritance enables specialization while sharing the common `describe()` structure.
