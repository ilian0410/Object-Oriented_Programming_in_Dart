## Solution

```dart
import 'dart:math';

// --- Model layer (immutable) ---

class TodoItem {
  final String id;
  final String title;
  final bool done;
  final String priority;

  const TodoItem(this.id, this.title, this.done, this.priority);

  TodoItem copyWith({String? id, String? title, bool? done, String? priority}) {
    return TodoItem(
      id ?? this.id,
      title ?? this.title,
      done ?? this.done,
      priority ?? this.priority,
    );
  }

  TodoItem toggle() => copyWith(done: !done);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoItem && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => '$id: $title [${done ? '✓' : ' '}] ($priority)';
}

// --- Repository layer ---

class TodoRepository {
  final List<TodoItem> _items = [];

  void add(TodoItem item) => _items.add(item);
  void remove(String id) => _items.removeWhere((i) => i.id == id);

  TodoItem? getById(String id) {
    for (var item in _items) {
      if (item.id == id) return item;
    }
    return null;
  }

  List<TodoItem> getAll() => List.unmodifiable(_items);
  List<TodoItem> getCompleted() => _items.where((i) => i.done).toList();
  List<TodoItem> getPending() => _items.where((i) => !i.done).toList();

  int get count => _items.length;
  int get completedCount => getCompleted().length;
}

// --- Service layer ---

class ApiService {
  List<TodoItem> fetchItems() {
    print('[API] Fetching items...');
    return [
      TodoItem('1', 'Task 1', false, 'high'),
      TodoItem('2', 'Task 2', true, 'medium'),
    ];
  }
}

class ReportService {
  String generateReport(List<TodoItem> items) {
    var total = items.length;
    var done = items.where((i) => i.done).length;
    return 'Report: $total items ($done completed)';
  }
}

// --- Mixin for logging ---

mixin Logger {
  void log(String action) => print('[LOG] $action');
}

// --- Presentation layer ---

class TodoConsoleApp with Logger {
  final TodoRepository _repository;
  final ApiService _api;
  final ReportService _reporter;
  int _nextId = 1;

  TodoConsoleApp(this._repository, this._api, this._reporter);

  void fetchAndDisplay() {
    log('Fetching items');
    var items = _api.fetchItems();
    for (var item in items) {
      _repository.add(item);
    }
    _nextId = items.length + 1;
    displayAll();
  }

  void toggleItem(String id) {
    var item = _repository.getById(id);
    if (item != null) {
      log('Toggling item $id');
      _repository.remove(id);
      _repository.add(item.toggle());
    }
    displayAll();
  }

  void addItem(String title, String priority) {
    log('Adding item');
    var id = (_nextId++).toString();
    _repository.add(TodoItem(id, title, false, priority));
    displayAll();
  }

  void removeItem(String id) {
    log('Removing item $id');
    _repository.remove(id);
  }

  void displayAll() {
    for (var item in _repository.getAll()) {
      print(item);
    }
    print('');
  }

  void showReport() {
    var report = _reporter.generateReport(_repository.getAll());
    log(report);
    print(report);
  }
}

void main() {
  var repo = TodoRepository();
  var api = ApiService();
  var reporter = ReportService();

  var app = TodoConsoleApp(repo, api, reporter);
  app.fetchAndDisplay();
  app.toggleItem('1');
  app.addItem('New Task', 'low');
  app.showReport();
}
```

### Explanation

| Original problem | Refactored solution | Best practice |
|---|---|---|
| One class doing everything | Separated into `TodoItem`, `TodoRepository`, `ApiService`, `ReportService`, `TodoConsoleApp` | **Single Responsibility** |
| Mutable fields everywhere | `TodoItem` is immutable with `copyWith()` and `toggle()` returning new instances | **Favor Immutability** |
| No encapsulation | Repository hides `_items` list; only exposes controlled methods | **Encapsulation** |
| Deep inheritance (`UrgentTodo extends TodoItem`) | Removed; priority is now a field (composition over inheritance) | **Composition Over Inheritance** |
| Manual logging logic | `Logger` mixin applied to the console app | **Mixin for cross-cutting concerns** |
