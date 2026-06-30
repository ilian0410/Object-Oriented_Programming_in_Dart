## Solution

```dart
class ConfigManager {
  static final ConfigManager _instance = ConfigManager._internal();

  ConfigManager._internal();

  factory ConfigManager() => _instance;

  final Map<String, String> _settings = {};

  void set(String key, String value) => _settings[key] = value;

  String? get(String key) => _settings[key];

  bool has(String key) => _settings.containsKey(key);

  void loadDefaults() {
    _settings['appName'] = 'MyApp';
    _settings['version'] = '1.0.0';
    _settings['theme'] = 'light';
  }
}

void main() {
  var ref1 = ConfigManager();
  var ref2 = ConfigManager();

  print('Same instance: ${identical(ref1, ref2)}'); // true

  ref1.set('theme', 'dark');
  print('Config value set from ref1: ${ref1.get('theme')}');
  print('Config value read from ref2: ${ref2.get('theme')}');

  ref2.loadDefaults();
  print('Defaults loaded:');
  print('  appName = ${ref1.get('appName')}');
  print('  version = ${ref1.get('version')}');
  print('  theme = ${ref1.get('theme')}');
}
```

### Explanation

- **Private constructor**: `ConfigManager._internal()` prevents external instantiation with `ConfigManager()` — but the factory constructor intercepts this.
- **Factory constructor**: `factory ConfigManager() => _instance` always returns the same cached instance. The `new` keyword semantics are preserved while enforcing singleton behavior.
- **Static instance**: `static final ConfigManager _instance = ConfigManager._internal()` is created once when the class is first referenced (lazy initialization in Dart).
- `identical(ref1, ref2)` returns `true` because both variables point to the exact same object in memory.
- Singleton is ideal for shared resources like configuration, logging, or database connections — ensuring one consistent state across the app.
