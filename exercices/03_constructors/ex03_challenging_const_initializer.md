# Constructors — Challenging

## Instructions

Create a geometry library with the following classes:

### `Vector2D`
- Fields: `x` and `y` (both `final double`)
- **Const constructor**: `const Vector2D(this.x, this.y)`
- **Named constructor**: `Vector2D.zero()` that redirects to `Vector2D(0, 0)`
- **Named constructor**: `Vector2D.fromPolar(double radius, double angle)` that uses an **initializer list** to compute `x` and `y` using `radius * cos(angle)` and `radius * sin(angle)`
- **Getter**: `magnitude` that returns `sqrt(x*x + y*y)`
- **Method**: `dotProduct(Vector2D other)` that returns the dot product

### `Line`
- Fields: `start` and `end` (both `Vector2D`, both `final`)
- **Const constructor**: `const Line(this.start, this.end)`
- **Getter**: `length` that returns the distance between start and end

## Starter Code

```dart
import 'dart:math';

class Vector2D {
  final double x;
  final double y;

  // TODO: add const constructor
  // TODO: add Vector2D.zero() redirecting constructor
  // TODO: add Vector2D.fromPolar() with initializer list

  double get magnitude => sqrt(x * x + y * y);

  double dotProduct(Vector2D other) => x * other.x + y * other.y;
}

class Line {
  final Vector2D start;
  final Vector2D end;

  // TODO: add const constructor
  // TODO: add length getter
}

void main() {
  // Test const constructors
  const p1 = Vector2D(3, 4);
  const p2 = Vector2D(1, 2);
  const line = Line(p1, p2);

  // Test zero
  const origin = Vector2D.zero();
  print('Origin: (${origin.x}, ${origin.y})'); // (0, 0)

  // Test fromPolar
  const fromPolar = Vector2D.fromPolar(5, pi / 4);
  print('From polar: (${fromPolar.x.toStringAsFixed(2)}, ${fromPolar.y.toStringAsFixed(2)})');

  // Test const identity
  const a = Vector2D(3, 4);
  const b = Vector2D(3, 4);
  print('Same instance: ${identical(a, b)}'); // true

  // Test magnitude
  print('Magnitude of (3,4): ${p1.magnitude}'); // 5.0

  // Test dot product
  print('Dot product: ${p1.dotProduct(p2)}'); // 11.0

  // Test line length
  print('Line length: ${line.length.toStringAsFixed(2)}');
}
```

## Expected Output

```
Origin: (0.0, 0.0)
From polar: (3.54, 3.54)
Same instance: true
Magnitude of (3,4): 5.0
Dot product: 11.0
Line length: 2.83
```
