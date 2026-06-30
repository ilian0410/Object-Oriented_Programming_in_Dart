# Mixins — Easy

## Instructions

Use the provided mixin to add logging capability to a class.

### Mixin
```dart
mixin Logger {
  void log(String message) {
    print('[LOG] $message');
  }
}
```

### Your task

Create a `Server` class that uses the `Logger` mixin with the `with` keyword. The class should have:
- A field `name` (String)
- A constructor
- A method `start()` that logs `"Server name is starting..."` and prints `"Server running"`
- A method `stop()` that logs `"Server name is stopping..."`

In `main()`, create a `Server` object, call `start()` and `stop()`.

## Expected Output

```
[LOG] Server WebServer is starting...
Server running
[LOG] Server WebServer is stopping...
```
