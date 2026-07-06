# Introduction to OOP — Easy

## Instructions

Below are two code snippets. One is written in **procedural style**, the other in **object-oriented style**. Your task is to rewrite the procedural snippet into a class, following the pattern shown in the OOP snippet.

### Snippet A (procedural)

```dart
String studentName = 'Ali';
int studentAge = 25;

void printStudent() {
  print('$studentName is $studentAge years old');
}
```

### Snippet B (OOP — use this as a model for your answer)

```dart
class Car {
  String model = '';
  int year = 0;

  void describe() {
    print('$model from $year');
  }
}
```

## Your Task

Rewrite Snippet A (procedural) into a `Student` class. Put the two variables inside the class as fields and the function inside as a method. Then in `main()`, create a `Student` object, set its fields, and call the print method.

## Expected Output

```
Ali is 25 years old
```

## Starter Code

```dart
void main() {
  // TODO: create a Student object
  // TODO: set its fields
  // TODO: call its print method
}
```
