# Generics — Intermediate

## Instructions

Create a generic `Pair<A, B>` class and a utility with generic methods.

### `Pair<A, B>` class
- **Fields**: `first` (A), `second` (B)
- **Constructor**
- **Method**: `void display()` — prints `"first: second"`
- **Method**: `Pair<B, A> swap()` — returns a new `Pair` with swapped types and values

### `ListUtils` class with static generic methods

1. **`static List<T> repeat<T>(T item, int count)`** — returns a list with the item repeated `count` times
2. **`static T? lastOrNull<T>(List<T> items)`** — returns the last element or `null` if empty
3. **`static List<T> merge<T>(List<T> a, List<T> b)`** — returns a new list with all elements from both lists

## Expected Output

```dart
void main() {
  var p1 = Pair<int, String>(1, 'one');
  p1.display(); // 1: one

  var p2 = p1.swap();
  p2.display(); // one: 1

  print(ListUtils.repeat('Hi', 3)); // [Hi, Hi, Hi]
  print(ListUtils.lastOrNull([1, 2, 3])); // 3
  print(ListUtils.lastOrNull<String>([])); // null
  print(ListUtils.merge([1, 2], [3, 4])); // [1, 2, 3, 4]
}
```
