## Solution

```dart
import 'dart:math';

abstract class Shape {
  double area();
  double perimeter();

  void describe() {
    print('Area: ${area()}, Perimeter: ${perimeter()}');
  }
}

class Square extends Shape {
  double side;
  Square(this.side);

  @override
  double area() => side * side;

  @override
  double perimeter() => 4 * side;
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() => pi * radius * radius;

  @override
  double perimeter() => 2 * pi * radius;
}

void main() {
  Shape s = Square(5);
  Shape c = Circle(3);

  s.describe(); // Area: 25.0, Perimeter: 20.0
  c.describe(); // Area: 28.26, Perimeter: 18.84
}
```

### Explanation

- `Shape` is declared `abstract` — it cannot be instantiated directly (`Shape s = Shape()` would error).
- It defines a **contract**: every `Shape` must provide `area()` and `perimeter()`. Subclasses that fail to implement these methods won't compile.
- The concrete method `describe()` is **inherited** by all subclasses — it calls the abstract methods that each subclass implements.
- This pattern enforces consistency: all shapes have the same interface while providing their own implementations.
