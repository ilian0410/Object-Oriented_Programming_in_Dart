class Employee {
  String _name;
  double _salary;
  int _yearsEmployed;

  Employee(this._name, this._salary, this._yearsEmployed);

  // TODO: add getters
  String get name => _name;
  double get salary => _salary;
  int get yearsEmployed => _yearsEmployed;

  // TODO: add name setter with validation
  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    } else {
      print("Invalid name");
    }
  }

  // TODO: add salary setter with validation
  set salary(double newSalary) {
    if (newSalary >= 0 && newSalary <= 100000) {
      _salary = newSalary;
    } else {
      print("Invalid salary");
    }
  }

  // TODO: add yearsEmployed setter with validation
  set yearsEmployed(int newYearsEmployed) {
    if (newYearsEmployed >= 0 && newYearsEmployed <= 50) {
      _yearsEmployed = newYearsEmployed;
    } else {
      print("Invalid years");
    }
  }

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