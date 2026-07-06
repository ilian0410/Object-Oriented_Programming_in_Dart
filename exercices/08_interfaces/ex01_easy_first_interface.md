# Interfaces in Dart — Easy

## Instructions

In Dart, every class defines an interface. The `Drawable` class below is used as an interface. Create a `Circle` class that **implements** `Drawable` — you must write every method yourself.

## Starter Code

```dart
class Drawable {
  void draw() => print('Drawing');
  void resize(double factor) => print('Resizing by $factor');
}

// TODO: create Circle that implements Drawable
// - field: radius (double)
// - constructor
// - draw() should print "○ Drawing a circle of radius radius"
// - resize() should print "○ Resizing circle radius by factor"

void main() {
  Drawable d = Circle(5);
  d.draw();     // ○ Drawing a circle of radius 5.0
  d.resize(2);  // ○ Resizing circle radius by 2.0
}
```
