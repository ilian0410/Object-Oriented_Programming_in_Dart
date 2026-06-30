## Solution

```dart
class ImmutablePoint {
  final double x;
  final double y;

  const ImmutablePoint(this.x, this.y);

  ImmutablePoint translate(double dx, double dy) {
    return ImmutablePoint(x + dx, y + dy);
  }

  ImmutablePoint copyWith({double? x, double? y}) {
    return ImmutablePoint(x ?? this.x, y ?? this.y);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImmutablePoint && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => '($x, $y)';
}

class Rectangle {
  final ImmutablePoint topLeft;
  final double width;
  final double height;

  const Rectangle(this.topLeft, this.width, this.height);

  ImmutablePoint get bottomRight =>
      ImmutablePoint(topLeft.x + width, topLeft.y + height);

  double get area => width * height;
}

void main() {
  const p1 = ImmutablePoint(3, 4);
  const p2 = ImmutablePoint(3, 4);
  const p3 = ImmutablePoint(5, 6);

  print(p1 == p2); // true (same values)
  print(p1 == p3); // false (different values)

  var moved = p1.translate(1, 2);
  print(moved); // (4.0, 6.0)
  print(p1);    // (3.0, 4.0) — unchanged!

  var copied = p1.copyWith(y: 10);
  print(copied); // (3.0, 10.0)

  const rect = Rectangle(ImmutablePoint(1, 1), 5, 3);
  print(rect.area); // 15.0
  print(rect.bottomRight); // (6.0, 4.0)
}
```

### Explanation

- **All fields are `final`**: Once set, they cannot change. This eliminates an entire class of bugs related to accidental mutation.
- **Const constructor**: Enables compile-time constants. `identical(ImmutablePoint(3,4), ImmutablePoint(3,4))` returns `true` — Dart reuses the same instance.
- **`translate()` returns new instance**: Instead of mutating `x` and `y`, it creates a new `ImmutablePoint`. The original remains unchanged.
- **`copyWith()`**: Provides convenient partial updates while preserving immutability.
- **Proper `==` and `hashCode`**: Two instances with the same coordinates are considered equal — essential for value objects.
- Immutable objects are **thread-safe**, **easier to reason about**, and work perfectly with Flutter's widget rebuild mechanism.
