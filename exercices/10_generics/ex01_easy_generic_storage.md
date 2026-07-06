# Generics — Easy

## Instructions

Create a generic `Container<T>` class that can hold one item of any type.

### Requirements
- **Field**: `T? content`
- **Constructor**: takes `T? content`
- **Method**: `T? getContent()` — returns the content
- **Method**: `void setContent(T? value)` — updates the content
- **Method**: `bool isEmpty()` — returns `true` if content is `null`

In `main()`, create:
- A `Container<String>` holding `"Dart"`
- A `Container<int>` holding `42`
- A `Container<double>` holding `3.14`

Call `getContent()` on each and print the result.

## Expected Output

```
Dart
42
3.14
```
