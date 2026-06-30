# Design Patterns — Intermediate

## Instructions

Implement the **Factory pattern** using Dart's `factory` constructor.

### Abstract class
```dart
abstract class Animal {
  void makeSound();
  String get species;
}
```

### Your task

Create three concrete animal classes:

1. **`Dog`** — species: `"Canine"`, sound: `"Woof!"`, has field `breed`
2. **`Cat`** — species: `"Feline"`, sound: `"Meow!"`, has field `color`
3. **`Bird`** — species: `"Avian"`, sound: `"Chirp!"`, has field `wingSpan`

### `AnimalFactory` class
- Private constructor
- Static factory method: `Animal create(String type, Map<String, dynamic> data)`
  - If `type` is `"dog"`, return a Dog with breed from data
  - If `type` is `"cat"`, return a Cat with color from data
  - If `type` is `"bird"`, return a Bird with wingSpan from data
  - Otherwise throw an `ArgumentError`

### In `main()`:
- Use the factory to create different animals without knowing their concrete types
- Store them all in a `List<Animal>` and call `makeSound()` on each
- Demonstrate that the factory hides the creation logic

## Expected Output

```
Animal: Canine (Dog) — Woof!
Animal: Feline (Cat) — Meow!
Animal: Avian (Bird) — Chirp!
```
