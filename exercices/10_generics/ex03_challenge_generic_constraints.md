# Generics — Challenge

## Instructions

Build a generic `Repository<T>` with a type constraint that ensures items have an ID.

### `Identifiable` interface (class form)

```dart
class Identifiable {
  String getID() => '';
}
```

### `Repository<T extends Identifiable>` class
- **Private field**: `List<T> _items = []`
- **Method**: `void add(T item)` — adds item. If an item with the same ID exists, print `"Duplicate ID: id"` and don't add.
- **Method**: `T? findById(String id)` — returns the item or null
- **Method**: `void removeById(String id)` — removes the item
- **Method**: `List<T> getAll()` — returns all items
- **Method**: `List<T> findBy(bool Function(T) condition)` — returns matching items
- **Getter**: `int get count`

### Concrete classes that implement `Identifiable`

1. **`Product`** — fields: `_id` (String), `name` (String), `price` (double). Constructor, `getID()` returns `_id`, `toString()` returns `"name (\$price)"`

2. **`Student`** — fields: `_id` (String), `name` (String), `gpa` (double). Constructor, `getID()` returns `_id`, `toString()` returns `"name (GPA: gpa)"`

### In `main()`:
- Create a `Repository<Product>` and add a few products
- Create a `Repository<Student>` and add a few students
- Demonstrate `findById()`, `findBy()`, `removeById()`, and duplicate detection

## Expected Output (example)

```
Products: [Laptop ($999.99), Mouse ($25.5), Keyboard ($89.99)]
Found by ID: Laptop ($999.99)
Cheap items: [Mouse ($25.5)]
Students: [Alice (GPA: 3.8), Bob (GPA: 3.2)]
High achievers: [Alice (GPA: 3.8)]
After removing Mouse: [Laptop ($999.99), Keyboard ($89.99)]
Duplicate ID: P1 — not added
```
