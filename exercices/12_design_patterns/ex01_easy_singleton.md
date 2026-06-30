# Design Patterns — Easy

## Instructions

Implement a **Singleton** pattern for a `ConfigManager` class that loads and provides app configuration.

### Requirements

- The class must have a **private constructor**
- It must expose a **static instance** getter
- It should hold a `Map<String, String>` called `_settings` that stores configuration
- Method: `void set(String key, String value)`
- Method: `String? get(String key)`
- Method: `bool has(String key)`
- Method: `void loadDefaults()` — pre-populates with: `{"appName": "MyApp", "version": "1.0.0", "theme": "light"}`

### In `main()`:
- Get the instance twice and demonstrate `identical()` returns true
- Set a config value from one reference
- Read it from the other reference
- Call `loadDefaults()` and print all settings

## Expected Output

```
Same instance: true
Config value set from ref1: dark
Config value read from ref2: dark
Defaults loaded:
  appName = MyApp
  version = 1.0.0
  theme = dark
```
