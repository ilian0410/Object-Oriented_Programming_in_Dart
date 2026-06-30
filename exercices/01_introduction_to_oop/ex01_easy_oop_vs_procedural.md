# Introduction to OOP — Easy

## Instructions

Read the code snippets below. For each one, write whether it follows a **procedural** or an **object-oriented** style. Then explain why.

## Snippet A

```dart
String name = 'Ali';
int age = 25;

void printInfo() {
  print('$name is $age years old');
}

void birthday() {
  age++;
}
```

## Snippet B

```dart
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void printInfo() {
    print('$name is $age years old');
  }

  void birthday() {
    age++;
  }
}

void main() {
  var p = Person('Ali', 25);
  p.printInfo();
  p.birthday();
}
```

## Snippet C

```dart
double radius = 5;
double pi = 3.14;

double area() {
  return pi * radius * radius;
}

void main() {
  print(area());
}
```

## Questions

1. Which snippet(s) are procedural? Which are OOP?
2. What is the key difference between the two styles that helped you decide?
3. Name two benefits of the OOP approach over the procedural one.
