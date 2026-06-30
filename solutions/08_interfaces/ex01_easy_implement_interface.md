## Solution

```dart
class Flyable {
  void fly() => print('Flying');
  void land() => print('Landing');
}

class Bird implements Flyable {
  @override
  void fly() => print('Bird is soaring through the sky');

  @override
  void land() => print('Bird lands on a branch');
}

class Airplane implements Flyable {
  @override
  void fly() => print('Airplane engines roar during takeoff');

  @override
  void land() => print('Airplane touches down on runway');
}

void main() {
  Flyable f1 = Bird();
  Flyable f2 = Airplane();

  f1.fly();
  f1.land();

  f2.fly();
  f2.land();
}
```

### Explanation

- In Dart, every class defines an implicit **interface**. Using `implements Flyable`, we accept the contract that `Bird` and `Airplane` must provide `fly()` and `land()` methods.
- Unlike `extends`, `implements` gives **no code inheritance** — we must write every method from scratch.
- Both `Bird` and `Airplane` satisfy the `Flyable` interface with completely different implementations. This is the **interface segregation** principle: different classes fulfill the same contract in their own way.
