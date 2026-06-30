## Solution

```dart
class Animal {
  void makeSound() => print('Some sound');
}

class Cat extends Animal {
  @override
  void makeSound() => print('Meow!');
}

class Dog extends Animal {
  @override
  void makeSound() => print('Woof!');
}

void main() {
  Animal a1 = Cat();
  Animal a2 = Dog();

  a1.makeSound(); // Meow!
  a2.makeSound(); // Woof!
}
```

### Explanation

- **Parent reference, child object**: The variables `a1` and `a2` are declared as `Animal`, but they hold `Cat` and `Dog` objects respectively.
- **Dynamic dispatch**: At compile time, Dart sees `Animal.makeSound()`. At runtime, it looks up the actual object type and calls the correct overridden version — `Cat.makeSound()` or `Dog.makeSound()`.
- This is the essence of polymorphism: code written against the parent interface works correctly with any subclass implementation.
