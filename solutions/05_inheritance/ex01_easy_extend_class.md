## Solution

```dart
class Animal {
  String name;

  Animal(this.name);

  void eat() => print('$name is eating');
  void sleep() => print('$name is sleeping');
}

class Dog extends Animal {
  Dog(String name) : super(name);

  void bark() => print('$name says: Woof!');
}

void main() {
  var dog = Dog('Rex');
  dog.eat();   // Rex is eating (inherited from Animal)
  dog.sleep(); // Rex is sleeping (inherited from Animal)
  dog.bark();  // Rex says: Woof! (defined in Dog)
}
```

### Explanation

- `Dog extends Animal` creates an **IS-A** relationship: a Dog IS an Animal.
- `Dog` inherits `eat()` and `sleep()` from `Animal` without writing any code — that's the power of inheritance.
- The `super(name)` call in the initializer list passes the `name` parameter to `Animal`'s constructor. Every subclass must eventually call a parent constructor.
- `Dog` adds new behavior (`bark()`) that only dogs have, extending the parent class without modifying it.
