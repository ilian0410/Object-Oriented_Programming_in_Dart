## Solution

### OOP Redesign

```dart
abstract class LibraryItem {
  String _title;
  String _author;
  int _pages;
  bool _isBorrowed = false;
  String? _borrower;

  LibraryItem(this._title, this._author, this._pages);

  String get title => _title;
  String get author => _author;
  bool get isBorrowed => _isBorrowed;
  String? get borrower => _borrower;

  bool borrow(String person) {
    if (!_isBorrowed) {
      _isBorrowed = true;
      _borrower = person;
      return true;
    }
    return false;
  }

  bool returnItem() {
    if (_isBorrowed) {
      _isBorrowed = false;
      _borrower = null;
      return true;
    }
    return false;
  }

  void printStatus() {
    print('Title: $_title | Author: $_author | Pages: $_pages');
    if (_isBorrowed) {
      print('Currently borrowed by: $_borrower');
    } else {
      print('Available');
    }
  }
}

class Book extends LibraryItem {
  Book(String title, String author, int pages) : super(title, author, pages);
}

class EBook extends LibraryItem {
  double fileSizeMB;

  EBook(String title, String author, int pages, this.fileSizeMB)
      : super(title, author, pages);
}

class Member {
  String _name;
  int _id;
  List<String> _borrowedTitles = [];

  Member(this._name, this._id);

  String get name => _name;
  int get id => _id;
  List<String> get borrowedTitles => List.unmodifiable(_borrowedTitles);

  void borrowBook(String title) {
    _borrowedTitles.add(title);
    print('$_name borrowed "$title"');
  }

  void returnBook(String title) {
    _borrowedTitles.remove(title);
    print('$_name returned "$title"');
  }
}

class Library {
  List<LibraryItem> _items = [];
  List<Member> _members = [];

  void addItem(LibraryItem item) => _items.add(item);
  void addMember(Member member) => _members.add(member);

  bool borrowItem(String title, Member member) {
    var item = _items.firstWhere(
      (i) => i.title == title && !i.isBorrowed,
      orElse: () => throw Exception('Item not available'),
    );
    if (item.borrow(member.name)) {
      member.borrowBook(title);
      return true;
    }
    return false;
  }

  bool returnItem(String title, Member member) {
    var item = _items.firstWhere((i) => i.title == title);
    if (item.returnItem()) {
      member.returnBook(title);
      return true;
    }
    return false;
  }
}

void main() {
  var lib = Library();
  lib.addItem(Book('Dart Programming', 'John Doe', 350));
  lib.addItem(EBook('Flutter in Action', 'Jane Doe', 400, 5.2));

  var alice = Member('Alice', 101);
  lib.addMember(alice);

  lib.borrowItem('Dart Programming', alice); // Alice borrowed "Dart Programming"
  lib.borrowItem('Flutter in Action', alice); // Alice borrowed "Flutter in Action"

  lib.returnItem('Dart Programming', alice); // Alice returned "Dart Programming"
}
```

### Key OOP improvements

| Before (Procedural) | After (OOP) | Principle |
|---|---|---|
| Separate variables for each book | `Book` class encapsulates data + behavior | Encapsulation |
| Duplicated borrow logic | `LibraryItem` base class shared by `Book` and `EBook` | Inheritance |
| Different types handled separately | `LibraryItem` list processes uniformly via `borrow()`/`returnItem()` | Polymorphism |
| All details exposed | `Library` hides item storage; `Member` hides borrow list internals | Abstraction |

Extending to support `Teacher` or `Magazine` requires only adding a new subclass — the `Library` and `Member` logic stays unchanged.
