class Drawable {
  void draw() => print('Drawing');
  void resize(double factor) => print('Resizing by $factor');
}

// TODO: create Circle that implements Drawable
// - field: radius (double)
// - constructor
// - draw() should print "○ Drawing a circle of radius radius"
// - resize() should print "○ Resizing circle radius by factor"
class Circle implements Drawable {
  double radius;
  Circle(this.radius);
  @override
  void draw() => print("○ Drawing a circle of radius $radius");
  @override
  void resize(double factor) => print("○ Resizing circle radius by $factor"); 
}

void main() {
  Drawable d = Circle(5);
  d.draw(); // ○ Drawing a circle of radius 5.0
  d.resize(2); // ○ Resizing circle radius by 2.0
}
