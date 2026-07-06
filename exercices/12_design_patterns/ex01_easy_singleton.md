# Design Patterns — Easy

## Instructions

Implement the **Singleton** pattern for a `AppConfig` class that provides application settings.

### Requirements
- **Private constructor**: `AppConfig._internal()`
- **Static final instance**: `static final AppConfig _instance = AppConfig._internal();`
- **Factory constructor**: `factory AppConfig() => _instance;`
- **Private field**: `Map<String, String> _settings = {};`
- **Method**: `void set(String key, String value)` — stores a setting
- **Method**: `String? get(String key)` — retrieves a setting
- **Method**: `bool has(String key)` — checks if a setting exists
- **Method**: `void loadDefaults()` — sets `theme` to `"light"`, `language` to `"en"`, `version` to `"1.0"`

### In `main()`:
- Get the instance twice into two variables and verify `identical()` returns `true`
- Set a value through one reference, read through the other
- Call `loadDefaults()` and print all settings

## Expected Output

```
Same instance: true
Theme set from ref1: dark
Theme read from ref2: dark
Defaults:
  theme = dark
  language = en
  version = 1.0
```
