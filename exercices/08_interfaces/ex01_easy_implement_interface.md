# Interfaces in Dart — Easy

## Instructions

In Dart, every class automatically defines an interface. Your task is to implement an interface defined by the `Flyable` class.

### Interface class
```dart
class Flyable {
  void fly() => print('Flying');
  void land() => print('Landing');
}
```

### Your task

Create a `Bird` class that **implements** `Flyable`. Remember: when you use `implements`, you must write your own version of every method.

Also create an `Airplane` class that implements `Flyable`.

In `main()`, create one `Bird` and one `Airplane`, store them in `Flyable` variables, and call `fly()` and `land()` on each.

## Expected Output

```
Bird is soaring through the sky
Bird lands on a branch
Airplane engines roar during takeoff
Airplane touches down on runway
```
