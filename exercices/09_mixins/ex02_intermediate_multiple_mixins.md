# Mixins — Intermediate

## Instructions

Use multiple mixins to compose behavior from different sources.

### Mixins
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
```

### Your task

Create the following classes with the appropriate mixins:

1. **`Duck`** — can fly, swim, walk, and make the sound "Quack!"
2. **`Dog`** — can walk, swim, and make the sound "Woof!"
3. **`Bird`** — can fly, walk, and make the sound "Chirp!"
4. **`Fish`** — can swim (no sound)

Each class should have a field `name` (String) and a constructor.

### In `main()`:
- Create one instance of each
- Call the appropriate methods to demonstrate their capabilities

## Expected Output (example)

```
Duck is flying
Duck is swimming
Duck is walking
Duck says: Quack!
Dog is walking
Dog is swimming
Dog says: Woof!
Bird is flying
Bird is walking
Bird says: Chirp!
Fish is swimming
```
