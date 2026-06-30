## Solution

```dart
abstract class Animal {
  void makeSound();
  String get species;
}

class Dog implements Animal {
  String breed;

  Dog(this.breed);

  @override
  void makeSound() => print('Woof!');

  @override
  String get species => 'Canine';

  @override
  String toString() => 'Animal: $species (Dog) — ${breed}';
}

class Cat implements Animal {
  String color;

  Cat(this.color);

  @override
  void makeSound() => print('Meow!');

  @override
  String get species => 'Feline';

  @override
  String toString() => 'Animal: $species (Cat) — ${color}';
}

class Bird implements Animal {
  double wingSpan;

  Bird(this.wingSpan);

  @override
  void makeSound() => print('Chirp!');

  @override
  String get species => 'Avian';

  @override
  String toString() => 'Animal: $species (Bird) — wingspan: ${wingSpan}cm';
}

class AnimalFactory {
  AnimalFactory._();

  static Animal create(String type, Map<String, dynamic> data) {
    switch (type.toLowerCase()) {
      case 'dog':
        return Dog(data['breed'] as String);
      case 'cat':
        return Cat(data['color'] as String);
      case 'bird':
        return Bird(data['wingSpan'] as double);
      default:
        throw ArgumentError('Unknown animal type: $type');
    }
  }
}

void main() {
  var animals = [
    AnimalFactory.create('dog', {'breed': 'Labrador'}),
    AnimalFactory.create('cat', {'color': 'Orange'}),
    AnimalFactory.create('bird', {'wingSpan': 25.0}),
  ];

  for (var a in animals) {
    print(a);
    a.makeSound();
  }
}
```

### Explanation

- **Factory pattern**: `AnimalFactory.create()` decides which concrete class to instantiate based on the `type` string parameter. The caller never needs to know about `Dog`, `Cat`, or `Bird` classes.
- **Centralized creation logic**: If a new animal type is added, only the factory changes — all code that uses the factory stays the same.
- The factory can also perform additional setup, validation, or caching before returning the object.
- This pattern is especially useful when the concrete type depends on runtime conditions (configuration, user input, device capabilities).
