# Generics — Easy

## Instructions

Create a generic `Box` class that can hold any single item.

### Requirements
- Class name: `Box<T>`
- Field: `T content`
- Constructor that takes `T content`
- Method: `T open()` that returns the content
- Method: `void replace(T newContent)` that replaces the content
- Method: `bool isEmpty()` that returns true if content is null

In `main()`, create:
- A `Box<String>` holding `"Hello"`
- A `Box<int>` holding `42`
- A `Box<double>` holding `3.14`

Call `open()` on each and print the result.

## Expected Output

```
Hello
42
3.14
```
