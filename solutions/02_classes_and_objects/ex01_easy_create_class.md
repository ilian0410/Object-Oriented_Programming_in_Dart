## Solution

```dart
class Book {
  String title;
  String author;
  double price;

  Book(this.title, this.author, this.price);

  void displayInfo() {
    print('$title by $author — \$${price.toStringAsFixed(2)}');
  }
}

void main() {
  var book1 = Book('The Hobbit', 'J.R.R. Tolkien', 15.99);
  var book2 = Book('1984', 'George Orwell', 12.50);

  book1.displayInfo();
  book2.displayInfo();
}
```

### Explanation

- The `Book` class uses Dart's **shorthand constructor** syntax (`Book(this.title, this.author, this.price)`) which automatically assigns constructor parameters to fields.
- Each object has its own copy of fields, so `book1` and `book2` maintain independent state.
- The `displayInfo()` method accesses `this.title`, `this.author`, and `this.price` implicitly (Dart allows omitting `this` when there's no ambiguity).
