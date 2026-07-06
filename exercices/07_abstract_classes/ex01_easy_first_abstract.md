# Abstract Classes — Easy

## Instructions

Complete the code below. `Shape` is an abstract class with two abstract methods. Create a `Circle` class that extends `Shape` and implements both methods.

## Starter Code

```dart
abstract class Shape {
  double area();
  double perimeter();
}

// TODO: create Circle class extending Shape
// - field: radius (double)
// - constructor
// - area() = 3.14 * radius * radius
// - perimeter() = 2 * 3.14 * radius

void main() {
  Shape s = Circle(5);
  print('Area: ${s.area()}');       // 78.5
  print('Perimeter: ${s.perimeter()}'); // 31.4
}
```
