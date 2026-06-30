# Polymorphism — Easy

## Instructions

Complete the code below so that:

1. `Cat` and `Dog` override `makeSound()` from `Animal`
2. In `main()`, store a `Cat` and a `Dog` in `Animal` variables
3. Call `makeSound()` on each — the correct subclass version must run

## Starter Code

```dart
class Animal {
  void makeSound() => print('Some sound');
}

// TODO: create Cat class that overrides makeSound()

// TODO: create Dog class that overrides makeSound()

void main() {
  // TODO: store a Cat in an Animal variable, call makeSound()

  // TODO: store a Dog in an Animal variable, call makeSound()
}
```

## Expected Output

```
Meow!
Woof!
```
