# Inheritance — Challenging

## Instructions

Design a **media library** hierarchy that models different types of media.

### Requirements

Create these classes:

1. **`Media`** (base class)
   - Fields: `title` (String), `year` (int), `_isCheckedOut` (bool, private)
   - Constructor, getter for `isCheckedOut`
   - Methods: `checkOut()` (sets `_isCheckedOut = true`), `checkIn()` (sets `_isCheckedOut = false`)
   - Abstract-like method `getDetails()` that returns a String description

2. **`Book`** extends `Media`
   - Additional fields: `author` (String), `pages` (int)
   - Override `getDetails()` to include author, pages, and whether it's a long book (>300 pages)

3. **`Movie`** extends `Media`
   - Additional fields: `director` (String), `durationMinutes` (int)
   - Override `getDetails()` to include director and duration

4. **`AudioBook`** extends `Book`
   - Additional fields: `narrator` (String), `durationHours` (double)
   - Override `getDetails()` to include narrator and duration

5. **`Library`** class
   - Holds a list of `Media` objects
   - Method `addMedia(Media m)`
   - Method `searchByTitle(String query)` — returns matching media
   - Method `checkOutMedia(String title)` — finds by title and checks out if available
   - Method `printCatalog()` — prints details of all media

## Starter Code

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

// TODO: create Book, Movie, AudioBook, and Library classes

void main() {
  var lib = Library();

  lib.addMedia(Book('The Hobbit', 1937, 'J.R.R. Tolkien', 310));
  lib.addMedia(Movie('Inception', 2010, 'Christopher Nolan', 148));
  lib.addMedia(AudioBook('Atomic Habits', 2018, 'James Clear', 'James Clear', 5.5));

  lib.printCatalog();
  // The Hobbit (1937) by J.R.R. Tolkien — 310 pages (Long book)
  // Inception (2010) directed by Christopher Nolan — 148 min
  // Atomic Habits (2018) by James Clear, narrated by James Clear — 5.5 hours

  lib.checkOutMedia('The Hobbit'); // "The Hobbit" checked out
  lib.checkOutMedia('The Hobbit'); // "The Hobbit" is already checked out
  lib.printCatalog(); // should show checkout status
}
```
