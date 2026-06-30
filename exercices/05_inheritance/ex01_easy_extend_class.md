# Inheritance — Easy

## Instructions

Create an `Animal` base class with:

- Field `name` (String)
- Constructor that takes `name`
- Method `eat()` that prints `"name is eating"`
- Method `sleep()` that prints `"name is sleeping"`

Then create a `Dog` subclass that:

- Calls the parent constructor using `super`
- Adds a method `bark()` that prints `"name says: Woof!"`

In `main()`, create a `Dog` object and call all three methods.

## Expected Output

```
Rex is eating
Rex is sleeping
Rex says: Woof!
```

## Restrictions

- Do not override any methods
- The `Dog` class must be only a few lines
