# Introduction to OOP — Intermediate

## Instructions

The code below is written in **procedural style** — all the data and functions are separate. Your job is to group everything into a `Rectangle` class.

## Procedural Code

```dart
double width = 0;
double height = 0;

void setSize(double w, double h) {
  width = w;
  height = h;
}

double calculateArea() {
  return width * height;
}

void printInfo() {
  print('Rectangle: ${width}x${height}, area = ${calculateArea()}');
}
```

## Your Task

1. Create a `Rectangle` class
2. Move `width` and `height` inside as fields with default value `0`
3. Move `setSize`, `calculateArea`, and `printInfo` inside as methods
4. In `main()`, create a `Rectangle` object, set its size, and print its info

## Expected Output

```
Rectangle: 5x3, area = 15
```

## Starter Code

```dart
class Rectangle {
  // TODO: add width and height fields
  // TODO: add setSize method
  // TODO: add calculateArea method
  // TODO: add printInfo method
}

void main() {
  // TODO: create Rectangle, set size, print info
}
```
