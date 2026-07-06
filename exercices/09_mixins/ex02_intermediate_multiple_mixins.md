# Mixins — Intermediate

## Instructions

Use multiple mixins to compose different behaviors.

### Mixins

```dart
mixin Fly {
  void fly() => print('$runtimeType soars through the sky');
}

mixin Swim {
  void swim() => print('$runtimeType glides through water');
}

mixin Walk {
  void walk() => print('$runtimeType walks on land');
}

mixin Vocalize {
  void speak(String sound) => print('$runtimeType says: $sound');
}
```

### Your task

Create these classes with the appropriate mixins:

1. `Parrot` — can `Fly`, `Walk`, `Vocalize`. Make it say `"Hello!"`
2. `Duck` — can `Fly`, `Swim`, `Walk`, `Vocalize`. Make it say `"Quack!"`
3. `Shark` — can `Swim` only
4. `Frog` — can `Swim`, `Walk`, `Vocalize`. Make it say `"Ribbit!"`

Each class has a field `name` (String) and a constructor.

### In `main()`:
- Create one of each
- Call the appropriate methods to demonstrate all capabilities

## Expected Output (example)

```
Parrot soars through the sky
Parrot walks on land
Parrot says: Hello!
Duck soars through the sky
Duck glides through water
Duck walks on land
Duck says: Quack!
Shark glides through water
Frog glides through water
Frog walks on land
Frog says: Ribbit!
```
