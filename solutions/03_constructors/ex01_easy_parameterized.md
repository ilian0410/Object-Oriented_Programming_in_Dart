## Solution

```dart
class Laptop {
  final String _brand;
  final int _ram;
  final double _price;

  Laptop(this._brand, this._ram, this._price);

  String get brand => _brand;
  int get ram => _ram;
  double get price => _price;

  String specs() {
    return 'Brand: $_brand, RAM: ${_ram}GB, Price: \$${_price.toStringAsFixed(2)}';
  }
}

void main() {
  var laptop1 = Laptop('Dell', 16, 1200.00);
  var laptop2 = Laptop('Apple', 8, 999.99);

  print(laptop1.specs());
  print(laptop2.specs());
}
```

### Explanation

- All fields are `final` — they can only be set once in the constructor. This follows the **favor immutability** best practice.
- Using shorthand `this.` syntax eliminates boilerplate: `Laptop(this._brand, this._ram, this._price)` is equivalent to writing manual field assignments.
- Getters provide read-only access to private fields without exposing mutation capabilities.
