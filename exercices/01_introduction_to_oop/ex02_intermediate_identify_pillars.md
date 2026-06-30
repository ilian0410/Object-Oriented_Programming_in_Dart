# Introduction to OOP — Intermediate

## Instructions

Below is a Dart snippet that uses the four pillars of OOP. Read it carefully and answer the questions.

## Code

```dart
class Vehicle {
  String _make;
  String _model;

  Vehicle(this._make, this._model);

  String get make => _make;
  String get model => _model;

  void start() => print('$_make $_model engine starts');
  void stop() => print('$_make $_model engine stops');
}

class Car extends Vehicle {
  int doors;

  Car(String make, String model, this.doors) : super(make, model);

  @override
  void start() {
    print('Insert key');
    super.start();
  }

  void honk() => print('Beep!');
}

class Motorcycle extends Vehicle {
  Motorcycle(String make, String model) : super(make, model);

  @override
  void start() => print('Kick-start... $_make $_model roars');
}

void main() {
  Vehicle v1 = Car('Toyota', 'Corolla', 4);
  Vehicle v2 = Motorcycle('Harley', 'Street 750');

  List<Vehicle> vehicles = [v1, v2];

  for (var v in vehicles) {
    print(v.make);
    v.start();
    v.stop();
    print('---');
  }
}
```

## Questions

1. **Encapsulation**: Which line(s) demonstrate encapsulation? What is hidden and how is it accessed?
2. **Inheritance**: Which class(es) inherit from another? What do they gain?
3. **Polymorphism**: Where does polymorphism occur in the code? What method behaves differently depending on the object?
4. **Abstraction**: How does abstraction appear in this design? What details are hidden from the caller?
