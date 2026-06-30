# Interfaces in Dart — Challenging

## Instructions

Design a **pluggable storage system** where different storage backends can be swapped without changing the code that uses them.

### `Storage` interface (defined as a class)
```dart
class Storage {
  void save(String key, String value) {}
  String? read(String key) {}
  void delete(String key) {}
  bool exists(String key) => false;
  List<String> listKeys() => [];
}
```

### Your task

Create **three implementations** of the `Storage` interface:

1. **`InMemoryStorage`** — stores data in a `Map<String, String>` in memory. Data is lost when the program exits.

2. **`PrefixedStorage`** — a **decorator** that wraps another `Storage` and adds a prefix to all keys. For example, if prefix is `"user_"`, calling `save("name", "Alice")` actually calls `save("user_name", "Alice")` on the wrapped storage. This class should also implement `Storage`.

3. **`CacheStorage`** — another decorator that wraps a `Storage` and caches `read()` results. If `read()` is called with a key that was previously read, return the cached value instead of calling the inner storage. Include a method `clearCache()`.

### `DataRepository` class
- Takes a `Storage` object via constructor (polymorphism through interface)
- Method `storeUser(String id, String data)` — saves prefixed data
- Method `getUser(String id)` — retrieves user data
- Method `deleteUser(String id)` — deletes user data
- Method `getAllUsers()` — returns all stored user data

### In `main()`:
- Create an `InMemoryStorage`
- Wrap it with `PrefixedStorage` with prefix `"user_"`
- Wrap that with `CacheStorage`
- Pass the final wrapped storage to `DataRepository`
- Demonstrate that the system works with all layers
- Show that cached reads are faster (or at least don't re-read from inner storage)

## Expected Output (example)

```
Stored user_1: Alice's data
Stored user_2: Bob's data
Read user_1 (cached): Alice's data
Read user_1 (cached, fast): Alice's data
All users: [Alice's data, Bob's data]
Cache cleared
Read user_1 (from storage): Alice's data
```
