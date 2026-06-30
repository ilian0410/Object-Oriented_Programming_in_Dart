## Solution

```dart
class Identifiable {
  String getId() => '';
}

class Repository<T extends Identifiable> {
  final List<T> _items = [];

  void add(T item) {
    if (_items.any((i) => i.getId() == item.getId())) {
      throw Exception('Item with ID ${item.getId()} already exists');
    }
    _items.add(item);
  }

  T? getById(String id) {
    for (var item in _items) {
      if (item.getId() == id) return item;
    }
    return null;
  }

  void remove(String id) {
    _items.removeWhere((item) => item.getId() == id);
  }

  List<T> getAll() => List.unmodifiable(_items);

  List<T> find(bool Function(T) predicate) {
    return _items.where(predicate).toList();
  }

  void update(String id, T updatedItem) {
    var index = _items.indexWhere((i) => i.getId() == id);
    if (index != -1) {
      _items[index] = updatedItem;
    }
  }

  int get count => _items.length;
}

class Product implements Identifiable {
  String _id;
  String name;
  double price;

  Product(this._id, this.name, this.price);

  @override
  String getId() => _id;

  @override
  String toString() => '$name (\$${price})';
}

class Student implements Identifiable {
  String _id;
  String name;
  double grade;

  Student(this._id, this.name, this.grade);

  @override
  String getId() => _id;

  @override
  String toString() => '$name (grade: $grade)';
}

void main() {
  var productRepo = Repository<Product>();
  productRepo.add(Product('P1', 'Laptop', 999.99));
  productRepo.add(Product('P2', 'Mouse', 25.50));
  productRepo.add(Product('P3', 'Keyboard', 89.99));

  var studentRepo = Repository<Student>();
  studentRepo.add(Student('S1', 'Alice', 85.5));
  studentRepo.add(Student('S2', 'Bob', 92.0));

  print('Products:');
  for (var p in productRepo.getAll()) print('  $p');

  print('\nStudents:');
  for (var s in studentRepo.getAll()) print('  $s');

  print('\nCheap products: ${productRepo.find((p) => p.price < 50)}');
  print('High achievers: ${studentRepo.find((s) => s.grade > 90)}');

  var found = productRepo.getById('P1');
  print('Found by ID: $found');

  productRepo.remove('P2');
  print('After removing Mouse: ${productRepo.getAll()}');

  // This would throw:
  // productRepo.add(Product('P1', 'Duplicate', 0));
}
```

### Explanation

- **Generic constraint**: `T extends Identifiable` ensures that `T` must implement the `Identifiable` interface. The repository can safely call `item.getId()` on any item.
- **Type safety**: `Repository<Product>` accepts only `Product` objects; `Repository<Student>` accepts only `Student` objects. The compiler enforces this.
- **Code reuse**: The same `Repository` class works for any type that implements `Identifiable`. No separate `ProductRepository` or `StudentRepository` classes needed.
- **Constraint enforcement**: Any class without an `Identifiable` implementation causes a compile error if used with `Repository`.
