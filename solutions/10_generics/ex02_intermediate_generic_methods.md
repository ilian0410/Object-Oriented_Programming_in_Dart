## Solution

```dart
class CollectionUtils {
  static T? firstOrNull<T>(List<T> items) {
    return items.isEmpty ? null : items.first;
  }

  static List<T> reverse<T>(List<T> items) {
    return items.reversed.toList();
  }

  static List<T> filterNotNull<T>(List<T?> items) {
    return items.where((x) => x != null).cast<T>().toList();
  }

  static Map<K, V> listToMap<K, V>(List<K> keys, List<V> values) {
    var map = <K, V>{};
    for (var i = 0; i < keys.length && i < values.length; i++) {
      map[keys[i]] = values[i];
    }
    return map;
  }
}

class Pair<A, B> {
  A first;
  B second;

  Pair(this.first, this.second);

  List<dynamic> toList() => [first, second];

  Pair<B, A> swap() => Pair<B, A>(second, first);
}

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

### Explanation

- **Generic methods**: The type parameter `<T>` is declared on the method, not the class. It's inferred from the argument or explicitly specified.
- **Multiple type parameters**: `Pair<A, B>` shows that generic classes can have more than one type parameter.
- The `swap()` method demonstrates that type parameters can be rearranged — `Pair<int, String>` becomes `Pair<String, int>`.
- `filterNotNull()` shows how generics handle nullable-to-non-nullable conversion: `List<T?>` → `List<T>`.
