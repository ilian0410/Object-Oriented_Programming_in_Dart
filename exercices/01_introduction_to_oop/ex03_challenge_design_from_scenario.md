# Introduction to OOP — Challenge

## Instructions

A local library needs a simple digital catalog. They track books with four pieces of data — title, author, pages, and whether it's checked out — and they need three actions: check out a book, return it, and display its info.

Currently everything is written procedurally with loose variables and functions. Your job is to design and write a `Book` class that groups all this data and behavior together.

## Procedural Code (needs conversion)

```dart
String bookTitle = '';
String bookAuthor = '';
int bookPages = 0;
bool isCheckedOut = false;

void checkOut() {
  isCheckedOut = true;
  print('Checked out');
}

void checkIn() {
  isCheckedOut = false;
  print('Returned');
}

void displayBook() {
  String status = isCheckedOut ? 'Checked out' : 'Available';
  print('"$bookTitle" by $bookAuthor ($bookPages pages) — $status');
}
```

## Requirements

- Create a `Book` class
- All four fields go inside with sensible defaults
- All three functions go inside as methods
- In `main()`, create one book, display it, check it out, display again, return it, display once more

## Expected Output

```
"The Hobbit" by J.R.R. Tolkien (310 pages) — Available
Checked out
"The Hobbit" by J.R.R. Tolkien (310 pages) — Checked out
Returned
"The Hobbit" by J.R.R. Tolkien (310 pages) — Available
```
