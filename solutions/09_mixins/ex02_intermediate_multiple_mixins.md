## Solution

```dart
mixin Fly {
  void fly() => print('$runtimeType is flying');
}

mixin Swim {
  void swim() => print('$runtimeType is swimming');
}

mixin Walk {
  void walk() => print('$runtimeType is walking');
}

mixin Sound {
  void makeSound(String sound) => print('$runtimeType says: $sound');
}

class Duck with Fly, Swim, Walk, Sound {
  String name;
  Duck(this.name);
}

class Dog with Walk, Swim, Sound {
  String name;
  Dog(this.name);
}

class Bird with Fly, Walk, Sound {
  String name;
  Bird(this.name);
}

class Fish with Swim {
  String name;
  Fish(this.name);
}

void main() {
  Duck().fly();
  Duck().swim();
  Duck().walk();
  Duck().makeSound('Quack!');

  Dog().walk();
  Dog().swim();
  Dog().makeSound('Woof!');

  Bird().fly();
  Bird().walk();
  Bird().makeSound('Chirp!');

  Fish().swim();
}
```

### Explanation

- **Multiple mixins**: A class can mix in several mixins using `with Fly, Swim, Walk, Sound`. This composes behavior from independent sources.
- **Composition over inheritance**: Instead of a deep hierarchy (Animal → Mammal → Canine → Dog), mixins let us compose exactly the capabilities each class needs.
- `Duck` gets 4 capabilities; `Fish` gets only 1. No class inherits unused behavior — which often happens in deep inheritance trees.
- `runtimeType` in the mixin methods dynamically reflects the class using the mixin, so `Duck().fly()` prints "Duck is flying" even though `fly()` is defined in the `Fly` mixin.
