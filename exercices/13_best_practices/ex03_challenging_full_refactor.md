# Best Practices — Challenging

## Instructions

The code below violates **multiple** best practices:
- Single Responsibility Principle
- Encapsulation (all fields are public)
- Immutability (no final fields)
- No clear separation of concerns
- Deep inheritance instead of composition

Refactor **everything** applying all best practices from the module.

### Bad code (refactor this)

```dart
class App {
  List<Map<String, dynamic>> items = [];
  String currentUser = '';
  String theme = 'light';

  void fetchItems() {
    print('Fetching items from API...');
    items = [
      {'id': 1, 'title': 'Task 1', 'done': false},
      {'id': 2, 'title': 'Task 2', 'done': true},
    ];
  }

  void displayItems() {
    for (var item in items) {
      print('${item['id']}: ${item['title']} [${item['done'] ? '✓' : ' '}]');
    }
  }

  void sendReport() {
    print('Sending report email to admin@example.com');
    print('Report: ${items.length} items');
  }

  void changeTheme(String t) {
    theme = t;
    print('Theme changed to $t');
  }

  void saveToDatabase() {
    print('Saving ${items.length} items to database...');
  }

  void logAction(String action) {
    print('[LOG] $currentUser performed: $action');
  }
}

class TodoItem {
  int id;
  String title;
  bool done;
  String priority;

  TodoItem(this.id, this.title, this.done, this.priority);

  void toggle() {
    done = !done;
  }
}

class UrgentTodo extends TodoItem {
  DateTime deadline;

  UrgentTodo(int id, String title, bool done, this.deadline)
      : super(id, title, done, 'high');
}
```

### Requirements

Create a well-structured app with:

1. **Model layer**: immutable `TodoItem` class with `copyWith()`, proper `==`, `hashCode`, `toString()`
2. **Repository layer**: `TodoRepository` that stores and manages items (add, remove, toggle, filter)
3. **Service layer**: `ApiService` (fetch), `ReportService` (generate reports), `Logger` (logging) — mixin or separate classes
4. **UI/Presentation layer**: `TodoConsoleApp` that uses the services

Use `final` everywhere possible. Apply single responsibility. Use composition where appropriate.

### In `main()`:
- Instantiate the refactored classes
- Fetch, display, toggle, add, remove items
- Generate a report
- Log actions

## Expected Output (example)

```
[LOG] Fetching items...
1: Task 1 [ ]
2: Task 2 [✓]

[LOG] Toggling item 1...
1: Task 1 [✓]
2: Task 2 [✓]

[LOG] Adding item...
3: New Task [ ]

Report: 3 items (2 completed)
```
