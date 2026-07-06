# Best Practices — Challenge

## Instructions

The code below violates **multiple** best practices:
- Single Responsibility Principle (one class does everything)
- No encapsulation (all fields public)
- No immutability
- Deep inheritance instead of composition
- Poor naming

Refactor everything applying all best practices from this module.

### Bad code (refactor this)

```dart
class App {
  List<Map<String, dynamic>> tasks = [];
  String userName = '';
  String theme = 'blue';

  void fetch() {
    print('Fetching from API...');
    tasks = [
      {'id': 1, 'title': 'Buy milk', 'done': false},
      {'id': 2, 'title': 'Read book', 'done': true},
    ];
  }

  void show() {
    for (var t in tasks) {
      print('${t['id']}: ${t['title']} [${t['done'] ? '✓' : ' '}]');
    }
  }

  void send() {
    print('Sending report to admin@example.com');
    print('${tasks.length} tasks');
  }

  void setTheme(String t) {
    theme = t;
    print('Theme: $t');
  }

  void save() {
    print('Saving to file...');
  }

  void log(String msg) {
    print('[LOG] $msg');
  }
}
```

### Requirements

Create a well-structured system with:

1. **`TaskItem`** — immutable model with `id`, `title`, `done`. Has `copyWith()`, `toggle()`, `toString()`. Override `==` and `hashCode`.
2. **`TaskRepository`** — stores tasks, add, remove, getById, getAll, toggle.
3. **`ApiService`** — fetches initial tasks from a simulated API.
4. **`ReportService`** — generates reports from the repository.
5. **`Logger` mixin** — provides `log()` method.
6. **`TaskApp`** — uses all of the above with `Logger` mixin. Methods: `init()`, `toggleTask(int id)`, `addTask(String title)`, `showReport()`.

Apply: single responsibility, immutability, encapsulation, composition, private fields with naming.

## Expected Output (example)

```
[LOG] Fetching tasks from API...
1: Buy milk [ ]
2: Read book [✓]
[LOG] Toggling task 1...
1: Buy milk [✓]
2: Read book [✓]
[LOG] Adding new task...
3: Write code [ ]
[LOG] Generating report...
Report: 3 tasks (2 completed)
```
