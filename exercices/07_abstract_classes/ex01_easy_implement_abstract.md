# Abstract Classes — Easy

## Instructions

Complete the code below by implementing the missing concrete classes.

### Abstract class
```dart
abstract class Shape {
  double area();
  double perimeter();

  void describe() {
    print('Area: ${area()}, Perimeter: ${perimeter()}');
  }
}
```

### Your task

Create two concrete classes that extend `Shape`:

1. **`Square`** with field `side` (double)
2. **`Circle`** with field `radius` (double)

Both must implement `area()` and `perimeter()`.

### Expected Output

```dart
void main() {
  Shape s = Square(5);
  Shape c = Circle(3);

  s.describe();
  c.describe();
}
```

```
Area: 25.0, Perimeter: 20.0
Area: 28.26, Perimeter: 18.84
```
