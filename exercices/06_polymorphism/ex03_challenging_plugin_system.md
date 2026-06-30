# Polymorphism — Challenging

## Instructions

Design a **plugin system** for a simple text processor. Different plugins process text in different ways, but they all share the same interface.

### `TextPlugin` abstract-like base class
- Method `String process(String input)` that returns modified text

### Plugins to implement

1. **`UpperCasePlugin`** — converts all text to uppercase
2. **`LowerCasePlugin`** — converts all text to lowercase
3. **`ReversePlugin`** — reverses the entire string
4. **`RemoveSpacesPlugin`** — removes all spaces
5. **`CensorPlugin`** — replaces the word `"bad"` with `"***"` (case-insensitive)

### `TextProcessor` class
- Holds a list of `TextPlugin` objects
- Method `addPlugin(TextPlugin plugin)`
- Method `removePlugin(Type type)` — removes a plugin by its runtime type
- Method `process(String input)` — applies **all** plugins in sequence and returns the result

## Starter Code

```dart
class TextPlugin {
  String process(String input) => input; // base: no transformation
}

// TODO: create UpperCasePlugin
// TODO: create LowerCasePlugin
// TODO: create ReversePlugin
// TODO: create RemoveSpacesPlugin
// TODO: create CensorPlugin

class TextProcessor {
  List<TextPlugin> _plugins = [];

  void addPlugin(TextPlugin plugin) => _plugins.add(plugin);

  void removePlugin(Type type) {
    _plugins.removeWhere((p) => p.runtimeType == type);
  }

  String process(String input) {
    // TODO: apply all plugins sequentially
  }
}

void main() {
  var processor = TextProcessor();

  processor.addPlugin(UpperCasePlugin());
  processor.addPlugin(ReversePlugin());
  processor.addPlugin(CensorPlugin());

  var result = processor.process('This is a bad example');
  print(result); // ELPMAXE *** A SI SIHT

  // Remove reverse and add remove spaces
  processor.removePlugin(ReversePlugin);
  processor.addPlugin(RemoveSpacesPlugin());

  result = processor.process('This is a bad example');
  print(result); // THISIS A***EXAMPLE
}
```

## Bonus

Add a `WordCountPlugin` that appends `" [words: N]"` to the end of the processed text.
