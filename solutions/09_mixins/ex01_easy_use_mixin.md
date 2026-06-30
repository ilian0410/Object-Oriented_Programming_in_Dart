## Solution

```dart
mixin Logger {
  void log(String message) {
    print('[LOG] $message');
  }
}

class Server with Logger {
  String name;

  Server(this.name);

  void start() {
    log('Server $name is starting...');
    print('Server running');
  }

  void stop() {
    log('Server $name is stopping...');
  }
}

void main() {
  var server = Server('WebServer');
  server.start();
  server.stop();
}
```

### Explanation

- The `with Logger` syntax mixes the `Logger` mixin into `Server`. All methods from `Logger` become available directly on `Server` instances.
- Mixins provide **code reuse without inheritance**. `Server` gets `log()` without extending any class — it keeps its own class hierarchy free.
- Unlike `extends`, mixins don't create an IS-A relationship. `Server` is not a `Logger` — it just *has* logging capability.
