# OOP Relationships — Challenge

## Instructions

Build a **library system** that demonstrates both composition and aggregation, and highlight the difference.

### Composition: `Page` belongs to `Book`
- `Page` objects are **created inside** the `Book` — they cannot exist without it
- If the `Book` is destroyed, all its `Page` objects are gone

### Aggregation: `Author` writes `Book`
- `Author` objects exist **independently** — they can exist before and after the `Book`

### Classes

**`Page`** (part of composition with Book)
- Fields: `number` (int), `content` (String)
- Constructor
- Method: `display()` — prints `"Page number: content"`

**`Author`** (part of aggregation with Book)
- Fields: `name` (String), `birthYear` (int)
- Constructor
- Method: `int getAge(int currentYear)` — returns `currentYear - birthYear`

**`Book`** (uses composition for pages, aggregation for author)
- Fields: `title` (String), `author` (Author — aggregated, passed in), `pages` (List of Page — composed, created inside)
- Constructor: takes `title`, `author`, and a `List<String>` of page contents. For each content string, **creates a new `Page`** (composition)
- Method: `readPage(int number)` — displays the page with that number (1-indexed)
- Method: `bookInfo()` — prints title, author name, and page count

### In `main()`:
- Create an `Author` object (exists independently)
- Create a `Book` with that author and some page contents
- Show book info and read a page
- Demonstrate aggregation: the `Author` still exists if we discard the `Book` reference
- Demonstrate composition: pages are gone when the `Book` is gone (assign `null` to the book reference and show that pages can't be accessed)

## Expected Output (example)

```
Book: "Dart Essentials" by Alice (age: 30)
Pages: 3

Reading page 1:
Page 1: Introduction to Dart

Author still exists: Alice (age: 30)

(After discarding the book, pages are no longer accessible)
```
