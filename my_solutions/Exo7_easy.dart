abstract class Shape {
  double area();
  double perimeter();
}


class Circle extends Shape {
  double radius;
  Circle(this.radius);
@override
double area() => 3.14 * radius * radius;
@override
double perimeter() => 2 * 3.14 * radius;
}


void main() {
  Shape s = Circle(5);
  print('Area: ${s.area()}'); // 78.5
  print('Perimeter: ${s.perimeter().toStringAsFixed(1)}'); // 31.4
}
