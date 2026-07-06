# Constructors — Challenge

## Instructions

Build a small geometry library using const constructors and initializer lists.

### `Distance` class
- **Fields**: `meters` (double) — must be `final`
- **Const constructor**: `const Distance(this.meters)`
- **Named constructor**: `Distance.fromKilometers(double km)` — uses an **initializer list** to convert km to meters (`km * 1000`)
- **Named constructor**: `Distance.fromMiles(double miles)` — uses an **initializer list** to convert miles to meters (`miles * 1609.34`)
- **Named constructor**: `Distance.zero()` — **redirects** to `Distance(0)`
- **Method**: `compare(Distance other)` that prints which is longer (or if equal)

## Starter Code

```dart
class Distance {
  final double meters;

  // TODO: add const constructor
  // TODO: add Distance.fromKilometers with initializer list
  // TODO: add Distance.fromMiles with initializer list
  // TODO: add Distance.zero() redirecting constructor

  void describe() {
    print('${meters}m');
  }

  void compare(Distance other) {
    if (meters > other.meters) {
      describe();
      print('  is longer than');
      other.describe();
    } else if (meters < other.meters) {
      other.describe();
      print('  is longer than');
      describe();
    } else {
      print('Both are ${meters}m');
    }
  }
}

void main() {
  const d1 = Distance(100);
  // TODO: create d2 = 2 kilometers, d3 = 1 mile, d4 = zero
  // TODO: compare d1 and d2, then d3 and d4
}
```

## Expected Output

```
2000.0m
  is longer than
100.0m
1.0m
  is longer than
0.0m
```

## Bonus

Add a `const` check: create two `Distance(100)` objects and verify they are the same instance using `identical()`.
