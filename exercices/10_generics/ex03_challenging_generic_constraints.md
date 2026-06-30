# Generics — Challenging

## Instructions

Build a **generic repository system** with constraints.

### `Identifiable` interface (class)
```dart
class Identifiable {
  String getId();
}
```

### `Repository<T extends Identifiable>` generic class
- Private list `_items` of type `List<T>`
- Method `void add(T item)` — adds item; if an item with the same ID already exists, throw an exception
- Method `T? getById(String id)` — returns item by ID or null
- Method `void remove(String id)` — removes item by ID
- Method `List<T> getAll()` — returns all items
- Method `List<T> find(bool Function(T) predicate)` — filters items by a condition
- Method `void update(String id, T updatedItem)` — replaces the item with the given ID
- Method `int get count` — returns the number of items

### Concrete classes that implement `Identifiable`

1. **`Product`**
   - Fields: `_id` (String), `name` (String), `price` (double)
   - Implements `Identifiable`

2. **`Student`**
   - Fields: `_id` (String), `name` (String), `grade` (double)
   - Implements `Identifiable`

### In `main()`:
- Create a `Repository<Product>` and add some products
- Create a `Repository<Student>` and add some students
- Demonstrate `find()`, `getById()`, `update()`, `remove()`
- Try to add a duplicate ID — should throw an error

## Expected Output (example)

```
Products:
  Laptop ($999.99)
  Mouse ($25.50)
  Keyboard ($89.99)

Students:
  Alice (grade: 85.5)
  Bob (grade: 92.0)

Cheap products (price < 50): [Mouse]
High achievers (grade > 90): [Bob]
Found by ID: Laptop ($999.99)
After removing 'Mouse': [Laptop, Keyboard]
```
