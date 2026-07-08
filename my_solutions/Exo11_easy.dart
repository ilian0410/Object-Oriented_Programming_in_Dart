class Car {
  String model;
  int year;
  Car(this.model, this.year);
  void display() {
    print("$model ($year)");
  }
}

class Driver {
  String name;
  int age;
  Car? car;

  Driver(this.name, this.age);

  void assignCar(Car c) {
    car = c;
  }

  void drive() {
    if (car != null) {
      print("$name is driving the car");
    } else {
      print("$name has no car");
    }
  }

  void showInfo() {
    print("Driver: $name ($age)");
    if (car != null) {
      print("  Car: ");
      car!.display();
    } else {
      print("  No car assigned");
    }
  }
}

void main() {
  var c1 = Car("Toyota Corolla", 2022);
  var d1 = Driver("Alice", 25);
  d1.assignCar(c1);
  d1.showInfo();
  var d2 = Driver("Bob", 30);
  d2.showInfo();
  
}