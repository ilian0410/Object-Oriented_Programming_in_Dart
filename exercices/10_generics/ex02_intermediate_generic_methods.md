# Generics — Intermediate

## Instructions

Create a utility class with **generic methods** that work with collections.

### `CollectionUtils` class
Implement the following static generic methods:

1. **`T? firstOrNull<T>(List<T> items)`** — returns the first element or null if the list is empty
2. **`List<T> reverse<T>(List<T> items)`** — returns a new list with elements in reverse order
3. **`List<T> filterNotNull<T>(List<T?> items)`** — filters out null values and returns a `List<T>` (non-nullable)
4. **`Map<K, V> listToMap<K, V>(List<K> keys, List<V> values)`** — combines two lists into a map

### `Pair` generic class
Create a generic `Pair<A, B>` class with:
- Fields: `first` (A), `second` (B)
- Method: `List<dynamic> toList()` — returns `[first, second]`
- Method: `Pair<B, A> swap()` — returns a new pair with swapped types

### Expected Output

```dart
void main() {
  print(CollectionUtils.firstOrNull([1, 2, 3])); // 1
  print(CollectionUtils.firstOrNull<String>([])); // null

  print(CollectionUtils.reverse([1, 2, 3])); // [3, 2, 1]

  var withNulls = [1, null, 3, null, 5];
  print(CollectionUtils.filterNotNull(withNulls)); // [1, 3, 5]

  var keys = ['a', 'b', 'c'];
  var vals = [1, 2, 3];
  print(CollectionUtils.listToMap(keys, vals)); // {a: 1, b: 2, c: 3}

  var p = Pair<int, String>(1, 'one');
  print(p.toList()); // [1, one]

  var swapped = p.swap();
  print('${swapped.first} — ${swapped.second}'); // one — 1
}
```
