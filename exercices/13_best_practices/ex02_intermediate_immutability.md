# Best Practices — Intermediate

## Instructions

The class below is mutable and unsafe. Refactor it to be **immutable** following best practices.

### Bad code (refactor this)

```dart
class Point {
  double x;
  double y;

  Point(this.x, this.y);

  void move(double dx, double dy) {
    x += dx;
    y += dy;
  }

  Point copy() {
    return Point(x, y);
  }

  @override
  String toString() => '($x, $y)';
}
```

### Your task

Create a new `ImmutablePoint` class that:

- All fields are **final**
- Has a **const constructor**
- Instead of `move()`, has a method `translate(double dx, double dy)` that **returns a new instance**
- Has a `copyWith({double? x, double? y})` method that returns a modified copy
- Properly overrides `==` and `hashCode` so two points with same coordinates are equal
- Overrides `toString()`

Also create a **`Rectangle`** immutable class with:
- Fields: `topLeft` (ImmutablePoint), `width` (double), `height` (double)
- Const constructor
- Getter: `bottomRight` — computes the bottom-right corner (returns a new ImmutablePoint)
- Getter: `area`

### Expected Output

```dart
void main() {
  const p1 = ImmutablePoint(3, 4);
  const p2 = ImmutablePoint(3, 4);
  const p3 = ImmutablePoint(5, 6);

  print(p1 == p2); // true (same values)
  print(p1 == p3); // false (different values)

  var moved = p1.translate(1, 2);
  print(moved); // (4.0, 6.0)
  print(p1);    // (3.0, 4.0) — unchanged

  var copied = p1.copyWith(y: 10);
  print(copied); // (3.0, 10.0)

  const rect = Rectangle(ImmutablePoint(1, 1), 5, 3);
  print(rect.area); // 15.0
  print(rect.bottomRight); // (6.0, 4.0)
}
```
