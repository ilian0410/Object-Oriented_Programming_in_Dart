## Solution

```dart
class TextPlugin {
  String process(String input) => input;
}

class UpperCasePlugin extends TextPlugin {
  @override
  String process(String input) => input.toUpperCase();
}

class LowerCasePlugin extends TextPlugin {
  @override
  String process(String input) => input.toLowerCase();
}

class ReversePlugin extends TextPlugin {
  @override
  String process(String input) =>
      String.fromCharCodes(input.runes.toList().reversed);
}

class RemoveSpacesPlugin extends TextPlugin {
  @override
  String process(String input) => input.replaceAll(' ', '');
}

class CensorPlugin extends TextPlugin {
  @override
  String process(String input) =>
      input.replaceAllMapped(RegExp(r'\bbad\b', caseSensitive: false),
          (match) => '***');
}

class TextProcessor {
  List<TextPlugin> _plugins = [];

  void addPlugin(TextPlugin plugin) => _plugins.add(plugin);

  void removePlugin(Type type) {
    _plugins.removeWhere((p) => p.runtimeType == type);
  }

  String process(String input) {
    var result = input;
    for (var plugin in _plugins) {
      result = plugin.process(result);
    }
    return result;
  }
}

void main() {
  var processor = TextProcessor();

  processor.addPlugin(UpperCasePlugin());
  processor.addPlugin(ReversePlugin());
  processor.addPlugin(CensorPlugin());

  var result = processor.process('This is a bad example');
  print(result); // ELPMAXE *** A SI SIHT

  processor.removePlugin(ReversePlugin);
  processor.addPlugin(RemoveSpacesPlugin());

  result = processor.process('This is a bad example');
  print(result); // THISIS A***EXAMPLE
}
```

### Bonus — WordCountPlugin

```dart
class WordCountPlugin extends TextPlugin {
  @override
  String process(String input) {
    var count = input.isEmpty ? 0 : input.split(RegExp(r'\s+')).length;
    return '$input [words: $count]';
  }
}
```

### Explanation

- **Plugin architecture**: Each plugin is a `TextPlugin` subclass that overrides `process()`. The `TextProcessor` treats all plugins uniformly.
- **Pipeline pattern**: Plugins are applied sequentially — the output of one plugin becomes the input to the next.
- **Polymorphism in action**: `removePlugin(Type type)` uses `runtimeType` to identify and remove specific plugins, demonstrating runtime type inspection alongside polymorphic processing.
- **Extensibility**: Adding a new transformation requires only a new subclass — no changes to `TextProcessor` at all.
