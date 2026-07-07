abstract class Vehicle {
  void move();
  void describe() => print("This is a vehicle");
}

class Car extends Vehicle {
  String brand;
  int speed;
  Car(this.brand, this.speed);
  @override
  void move() => print("$brand drives at $speed km/h");
}

class Boat extends Vehicle {
  String name;
  int maxSpeed;
  Boat(this.name, this.maxSpeed);
  @override
  void move() => print("$name sails at $maxSpeed knots");
}

void main () {
  Vehicle v1 = Car("Toyota", 120);
  Vehicle v2 = Boat("Titanic", 30);
v1.move();v1.describe();v2.move();v2.describe();

}
