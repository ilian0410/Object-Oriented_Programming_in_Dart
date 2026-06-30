# Introduction to OOP — Challenging

## Instructions

The code below is written in a purely procedural style. Your task is to **redesign it using OOP principles**.

Apply all four pillars where appropriate:
- **Encapsulation**: hide internal data
- **Inheritance**: share common behavior
- **Polymorphism**: treat different types uniformly
- **Abstraction**: hide complex details

## Starter Code

```dart
String title = '';
String author = '';
int pages = 0;
bool isBorrowed = false;
String borrower = '';

void borrowBook(String person) {
  if (!isBorrowed) {
    isBorrowed = true;
    borrower = person;
    print('$person borrowed "$title"');
  } else {
    print('"$title" is already borrowed by $borrower');
  }
}

void returnBook() {
  if (isBorrowed) {
    print('"$title" returned by $borrower');
    isBorrowed = false;
    borrower = '';
  } else {
    print('"$title" was not borrowed');
  }
}

void printStatus() {
  print('Title: $title | Author: $author | Pages: $pages');
  if (isBorrowed) {
    print('Currently borrowed by: $borrower');
  } else {
    print('Available');
  }
}

String studentName = '';
int studentId = 0;
List<String> borrowedTitles = [];

void studentBorrow(String bookTitle) {
  borrowedTitles.add(bookTitle);
  print('$studentName borrowed "$bookTitle"');
}

void studentReturn(String bookTitle) {
  borrowedTitles.remove(bookTitle);
  print('$studentName returned "$bookTitle"');
}

void main() {
  title = 'Dart Programming';
  author = 'John Doe';
  pages = 350;

  studentName = 'Alice';
  studentId = 101;

  borrowBook('Alice');
  studentBorrow('Dart Programming');
  printStatus();
}
```

## Requirements

- Create a `Book` class with proper encapsulation
- Create a `Student` class
- Create a `Library` class that manages borrowing/returning
- Apply OOP principles to make the code extensible (e.g., adding a `Teacher` or `EBook` later should be easy)
- The `main()` function should produce the same behavior
