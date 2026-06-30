## Solution

```dart
class Media {
  String title;
  int year;
  bool _isCheckedOut = false;

  Media(this.title, this.year);

  bool get isCheckedOut => _isCheckedOut;

  void checkOut() {
    if (!_isCheckedOut) {
      _isCheckedOut = true;
      print('"$title" checked out');
    } else {
      print('"$title" is already checked out');
    }
  }

  void checkIn() {
    if (_isCheckedOut) {
      _isCheckedOut = false;
      print('"$title" checked in');
    }
  }

  String getDetails() => '$title ($year)';
}

class Book extends Media {
  String author;
  int pages;

  Book(String title, int year, this.author, this.pages) : super(title, year);

  @override
  String getDetails() {
    var long = pages > 300 ? ' (Long book)' : '';
    return '$title ($year) by $author — $pages pages$long';
  }
}

class Movie extends Media {
  String director;
  int durationMinutes;

  Movie(String title, int year, this.director, this.durationMinutes)
      : super(title, year);

  @override
  String getDetails() {
    return '$title ($year) directed by $director — $durationMinutes min';
  }
}

class AudioBook extends Book {
  String narrator;
  double durationHours;

  AudioBook(String title, int year, String author, this.narrator,
      this.durationHours)
      : super(title, year, author, 0);

  @override
  String getDetails() {
    return '$title ($year) by $author, narrated by $narrator — $durationHours hours';
  }
}

class Library {
  List<Media> _media = [];

  void addMedia(Media m) => _media.add(m);

  Media? searchByTitle(String query) {
    for (var m in _media) {
      if (m.title.toLowerCase().contains(query.toLowerCase())) return m;
    }
    return null;
  }

  void checkOutMedia(String title) {
    var media = searchByTitle(title);
    if (media != null) {
      media.checkOut();
    } else {
      print('"$title" not found');
    }
  }

  void printCatalog() {
    for (var m in _media) {
      var status = m.isCheckedOut ? ' [Checked Out]' : ' [Available]';
      print(m.getDetails() + status);
    }
  }
}

void main() {
  var lib = Library();

  lib.addMedia(Book('The Hobbit', 1937, 'J.R.R. Tolkien', 310));
  lib.addMedia(Movie('Inception', 2010, 'Christopher Nolan', 148));
  lib.addMedia(AudioBook('Atomic Habits', 2018, 'James Clear', 'James Clear', 5.5));

  lib.printCatalog();
  lib.checkOutMedia('The Hobbit');
  lib.checkOutMedia('The Hobbit');
  lib.printCatalog();
}
```

### Explanation

- **Multi-level inheritance**: `AudioBook` extends `Book` extends `Media`. Each level adds specialized fields and overrides `getDetails()`.
- **Polymorphism**: `Library` stores a `List<Media>` and calls `getDetails()` without knowing the concrete type. Each media type prints its own formatted details.
- **Encapsulation**: `_isCheckedOut` is private to `Media`, with controlled access through `checkOut()`/`checkIn()` methods.
- The hierarchy follows the **Open/Closed Principle**: adding a new media type (e.g., `Magazine`) requires only a new subclass with its own `getDetails()` — no existing code changes.
