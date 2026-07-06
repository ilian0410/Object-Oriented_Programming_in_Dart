# Classes and Objects — Intermediate

## Instructions

Complete the code below. The `Counter` class tracks a numeric value with increment and reset.

### Your tasks

1. Create a `Counter` object stored in **two different variables** (`c1` and `c2`)
2. Call `increment()` three times on `c1`
3. Read the value through `c2` and print it
4. Call `reset()` on `c2`
5. Read the value through `c1` and print it

### Questions (answer as comments in your code)

- Why does `c2` see the value after we only modified `c1`?
- After `reset()` on `c2`, why does `c1` show `0`?

## Starter Code

```dart
class Counter {
  int value = 0;

  void increment() {
    value++;
    print('Value is now $value');
  }

  void reset() {
    value = 0;
    print('Counter reset');
  }
}

void main() {
  // TODO: create one Counter with two references
  // TODO: increment through c1 (3 times)
  // TODO: print value through c2
  // TODO: reset through c2
  // TODO: print value through c1
}
```

## Expected Output

```
Value is now 1
Value is now 2
Value is now 3
c2 sees: 3
Counter reset
c1 sees: 0
```
