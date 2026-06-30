## Solution

```dart
class Storage {
  void save(String key, String value) {}
  String? read(String key) => null;
  void delete(String key) {}
  bool exists(String key) => false;
  List<String> listKeys() => [];
}

class InMemoryStorage implements Storage {
  final Map<String, String> _data = {};

  @override
  void save(String key, String value) => _data[key] = value;

  @override
  String? read(String key) => _data[key];

  @override
  void delete(String key) => _data.remove(key);

  @override
  bool exists(String key) => _data.containsKey(key);

  @override
  List<String> listKeys() => _data.keys.toList();
}

class PrefixedStorage implements Storage {
  final Storage _inner;
  final String _prefix;

  PrefixedStorage(this._inner, this._prefix);

  String _prefixed(String key) => '$_prefix$key';

  @override
  void save(String key, String value) => _inner.save(_prefixed(key), value);

  @override
  String? read(String key) => _inner.read(_prefixed(key));

  @override
  void delete(String key) => _inner.delete(_prefixed(key));

  @override
  bool exists(String key) => _inner.exists(_prefixed(key));

  @override
  List<String> listKeys() {
    var allKeys = _inner.listKeys();
    return allKeys
        .where((k) => k.startsWith(_prefix))
        .map((k) => k.substring(_prefix.length))
        .toList();
  }
}

class CacheStorage implements Storage {
  final Storage _inner;
  final Map<String, String> _cache = {};

  CacheStorage(this._inner);

  void clearCache() => _cache.clear();

  @override
  void save(String key, String value) {
    _inner.save(key, value);
    _cache[key] = value;
  }

  @override
  String? read(String key) {
    if (_cache.containsKey(key)) {
      print('Cache hit: $key');
      return _cache[key];
    }
    var value = _inner.read(key);
    if (value != null) _cache[key] = value;
    return value;
  }

  @override
  void delete(String key) {
    _inner.delete(key);
    _cache.remove(key);
  }

  @override
  bool exists(String key) => _cache.containsKey(key) || _inner.exists(key);

  @override
  List<String> listKeys() => _inner.listKeys();
}

class DataRepository {
  final Storage _storage;

  DataRepository(this._storage);

  void storeUser(String id, String data) {
    _storage.save(id, data);
    print('Stored $id: $data');
  }

  String? getUser(String id) {
    var data = _storage.read(id);
    if (data != null) print('Read $id: $data');
    return data;
  }

  void deleteUser(String id) {
    _storage.delete(id);
    print('Deleted $id');
  }

  List<String> getAllUsers() {
    return _storage.listKeys().map((k) => _storage.read(k) ?? '').toList();
  }
}

void main() {
  var memory = InMemoryStorage();
  var prefixed = PrefixedStorage(memory, 'user_');
  var cached = CacheStorage(prefixed);
  var repo = DataRepository(cached);

  repo.storeUser('1', "Alice's data");
  repo.storeUser('2', "Bob's data");

  repo.getUser('1'); // Read user_1: Alice's data (from storage, caches it)
  repo.getUser('1'); // Cache hit: user_1 (fast, from cache)

  print('All users: ${repo.getAllUsers()}');

  cached.clearCache();
  print('Cache cleared');
  repo.getUser('1'); // Read user_1: Alice's data (from storage again)
}
```

### Explanation

- **Interface-based design**: `Storage` is an interface that all implementations satisfy. The system never depends on concrete storage classes.
- **Decorator pattern**: `PrefixedStorage` and `CacheStorage` wrap another `Storage`, adding behavior transparently. They implement the same interface, so they can nest arbitrarily.
- **Key design insight**: `DataRepository` receives a `Storage` through the constructor and never knows about the wrapping layers. Adding caching or key prefixing requires zero changes to the business logic.
- This demonstrates the **Dependency Inversion Principle**: high-level modules (`DataRepository`) depend on abstractions (`Storage`), not concrete implementations.
