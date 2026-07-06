# Mixins — Easy

## Instructions

Use the provided `Logger` mixin to add logging to a `WebServer` class.

### Mixin

```dart
mixin Logger {
  void log(String message) {
    print('[LOG] $message');
  }
}
```

### Your task

Create a `WebServer` class that uses `Logger` with the `with` keyword:
- **Field**: `host` (String), `port` (int)
- **Constructor**
- **Method**: `start()` — logs `"Server host:port is starting..."` and prints `"Server running"`
- **Method**: `stop()` — logs `"Server host:port is shutting down"`

## Expected Output

```
[LOG] Server localhost:8080 is starting...
Server running
[LOG] Server localhost:8080 is shutting down
```
