# Interfaces in Dart — Challenge

## Instructions

Design a storage system where different backends are swap-able through interfaces.

### `Storage` interface (defined as a class)

```dart
class Storage {
  void save(String key, String value) {}
  String? read(String key) => null;
  void delete(String key) {}
  bool contains(String key) => false;
}
```

### Requirements

**1. `MapStorage`** — implements `Storage` using a `Map<String, String>` internally
- `save()` stores in the map
- `read()` retrieves from the map
- `delete()` removes from the map
- `contains()` checks if key exists in the map

**2. `EncryptedStorage`** — implements `Storage`, wraps another `Storage`
- Constructor takes another `Storage` (the inner storage)
- `save()`: reverses the value before storing (simple mock encryption)
- `read()`: reverses the value back after reading
- `delete()` and `contains()`: delegate to inner storage

**3. `LoggingStorage`** — implements `Storage`, wraps another `Storage`
- Constructor takes another `Storage`
- Every method prints `"[Storage] calling methodName(key)"` then delegates

## Expected Output

```dart
void main() {
  var basic = MapStorage();
  var encrypted = EncryptedStorage(basic);
  var logged = LoggingStorage(encrypted);

  logged.save('password', 's3cret');
  // [Storage] save(password)
  print(logged.read('password')); // s3cret (decrypted back)
  // [Storage] read(password)

  print(logged.contains('password')); // true
  // [Storage] contains(password)

  logged.delete('password');
  // [Storage] delete(password)
}
```

## Bonus

Add a `CachedStorage` implementation that caches `read()` results: the first `read()` calls the inner storage, subsequent reads for the same key return the cached value without calling the inner storage. Add a `clearCache()` method.
