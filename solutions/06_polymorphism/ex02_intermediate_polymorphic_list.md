## Solution

```dart
import 'dart:math';

class Shape {
  double area() => 0.0;
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() => pi * radius * radius;
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

class Triangle extends Shape {
  double base, height;
  Triangle(this.base, this.height);

  @override
  double area() => 0.5 * base * height;
}

void main() {
  List<Shape> shapes = [
    Circle(5),
    Rectangle(4, 5),
    Triangle(6, 5),
  ];

  double total = 0;
  for (var shape in shapes) {
    var a = shape.area();
    print('${shape.runtimeType} area: ${a.toStringAsFixed(2)}');
    total += a;
  }
  print('Total area: ${total.toStringAsFixed(2)}');
}
```

### Challenge answer

Adding `Square extends Rectangle` would work **without changing the loop**. Since `Square` is a `Rectangle` (and thus a `Shape`), it can be added to `List<Shape>`. The loop calls `area()` polymorphically — `Square` inherits `Rectangle.area()` (or can override it for optimization). The existing code handling `Shape` objects remains completely unchanged, demonstrating the power of polymorphism for extensibility.
