# Polymorphism — Intermediate

## Instructions

Create a `Shape` hierarchy where each shape has an `area()` method. Then write code that processes a list of shapes polymorphically.

### Classes to create

1. **`Shape`** — base class with method `area()` that returns `0.0`
2. **`Circle`** — takes `radius`, area = π × r²
3. **`Rectangle`** — takes `width` and `height`, area = w × h
4. **`Triangle`** — takes `base` and `height`, area = 0.5 × b × h

### In `main()`:

- Create a `List<Shape>` containing one of each shape
- Loop through the list, print the area of each shape
- Also print the **total area** of all shapes combined

## Expected Output

```
Circle area: 78.50
Rectangle area: 20.00
Triangle area: 15.00
Total area: 113.50
```

## Challenge Question (answer in a comment)

What would happen if you added a `Square extends Rectangle` class? Would the loop still work? Why?
