## Solution

```dart
class Box<T> {
  T? content;

  Box(this.content);

  T? open() => content;

  void replace(T? newContent) => content = newContent;

  bool isEmpty() => content == null;
}

void main() {
  var stringBox = Box<String>('Hello');
  var intBox = Box<int>(42);
  var doubleBox = Box<double>(3.14);

  print(stringBox.open()); // Hello
  print(intBox.open());    // 42
  print(doubleBox.open()); // 3.14
}
```

### Explanation

- `Box<T>` is a **generic class** — the type `T` is specified when creating an instance: `Box<String>`, `Box<int>`, etc.
- This provides **type safety**: you cannot put a `String` into a `Box<int>` — the compiler prevents it.
- Without generics, you'd need either separate classes (`BoxString`, `BoxInt`, ...) or a `dynamic`-based `Box` that loses type safety.
- Generics enable **reusability** with **type safety** — the best of both worlds.
