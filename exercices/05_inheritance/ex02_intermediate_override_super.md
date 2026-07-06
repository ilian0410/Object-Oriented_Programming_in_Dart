# Inheritance — Intermediate

## Instructions

Build a restaurant employee system with method overriding.

### `RestaurantEmployee` class
- **Fields**: `name` (String), `hourlyWage` (double)
- **Constructor**
- **Method**: `calculatePay(int hours)` that returns `hours * hourlyWage`
- **Method**: `describe()` that prints `"name works at the restaurant"`

### `Chef` class (extends `RestaurantEmployee`)
- **Additional field**: `specialty` (String)
- **Override `describe()`**: prints the specialty too by **calling `super.describe()`** first, then printing `"They specialize in specialty"`

### `Server` class (extends `RestaurantEmployee`)
- **Additional field**: `tips` (double)
- **Override `calculatePay(int hours)`**: returns `super.calculatePay(hours) + tips`
- **Override `describe()`**: calls `super.describe()` then prints `"They serve tables"`

## Expected Output

```dart
void main() {
  var chef = Chef('Marie', 25.0, 'Pastry');
  var server = Server('Jean', 15.0, 80.0);

  print(chef.calculatePay(40)); // 1000.0
  chef.describe(); // Marie works at the restaurant\nThey specialize in Pastry

  print(server.calculatePay(40)); // 680.0
  server.describe(); // Jean works at the restaurant\nThey serve tables
}
```
