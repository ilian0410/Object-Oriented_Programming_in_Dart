# Best Practices — Intermediate

## Instructions

The `Person` class below is mutable. Refactor it into an **immutable** `ImmutablePerson` class following best practices.

### Mutable version (refactor this)

```dart
class Person {
  String firstName;
  String lastName;
  int age;

  Person(this.firstName, this.lastName, this.age);

  void celebrateBirthday() {
    age++;
  }

  Person copy() {
    return Person(firstName, lastName, age);
  }

  @override
  String toString() => '$firstName $lastName ($age)';
}
```

### Requirements for `ImmutablePerson`

- All fields must be **`final`**
- Use a **`const` constructor**
- Instead of `celebrateBirthday()`, have a method `withBirthday()` that **returns a new instance** with `age + 1`
- Have a `copyWith({String? firstName, String? lastName, int? age})` method that returns a modified copy
- Override **`==`** and **`hashCode`** so two persons with the same fields are equal
- Override `toString()`

### In `main()`:

```dart
void main() {
  const p1 = ImmutablePerson('Alice', 'Smith', 25);
  const p2 = ImmutablePerson('Alice', 'Smith', 25);
  const p3 = ImmutablePerson('Bob', 'Jones', 30);

  print(p1 == p2); // true
  print(p1 == p3); // false

  var older = p1.withBirthday();
  print(older); // Alice Smith (26)
  print(p1);    // Alice Smith (25) — unchanged

  var renamed = p1.copyWith(lastName: 'Johnson');
  print(renamed); // Alice Johnson (25)
}
```
