# Polymorphism — Challenge

## Instructions

Build a payroll system that processes different employee types uniformly through polymorphism.

### `Employee` base class
- **Private fields**: `_name` (String), `_id` (String)
- **Constructor**
- **Getter**: `name`, `id`
- **Method**: `double calculatePay()` — returns `0.0` (base)
- **Method**: `String getPayInfo()` — returns `"name (id) earned \$\$amount"`

### `SalariedEmployee` extends `Employee`
- **Additional field**: `annualSalary` (double)
- **Constructor**: takes all fields, calls `super`
- **Override `calculatePay()`**: returns `annualSalary / 12` (monthly pay)

### `HourlyEmployee` extends `Employee`
- **Additional fields**: `hourlyRate` (double), `hoursWorked` (int)
- **Constructor**: takes all fields, calls `super`
- **Override `calculatePay()`**: returns `hourlyRate * hoursWorked`

### `CommissionEmployee` extends `Employee`
- **Additional fields**: `basePay` (double), `commissionRate` (double), `sales` (double)
- **Constructor**: takes all fields, calls `super`
- **Override `calculatePay()`**: returns `basePay + (commissionRate * sales)`

### `Payroll` class
- **Field**: `List<Employee> employees`
- **Method**: `void addEmployee(Employee emp)` — adds to list
- **Method**: `void processPayroll()` — loops through all employees, calls `calculatePay()`, then `getPayInfo()`, and prints each
- **Method**: `double getTotalPayroll()` — sums and returns all pay

## Expected Output

```
=== Processing Payroll ===
Alice (E001) earned $5000.0
Bob (E002) earned $3200.0
Charlie (E003) earned $4850.0
Total payroll: $13050.0
```
