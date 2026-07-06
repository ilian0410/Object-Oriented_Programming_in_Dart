# Abstract Classes — Intermediate

## Instructions

Create an abstract `Vehicle` class and two concrete implementations.

### `Vehicle` abstract class
- **Abstract method**: `void move()` — no body
- **Concrete method**: `void describe()` that prints `"This is a vehicle"`

### `Car` class (extends `Vehicle`)
- **Fields**: `brand` (String), `speed` (int)
- **Constructor**
- **Override `move()`**: prints `"brand drives at speed km/h"`

### `Boat` class (extends `Vehicle`)
- **Fields**: `name` (String), `maxSpeed` (int)
- **Constructor**
- **Override `move()`**: prints `"name sails at maxSpeed knots"`

### In `main()`:
- Store a `Car` and a `Boat` in `Vehicle` variables
- Call `move()` and `describe()` on each

## Expected Output

```
Toyota drives at 120 km/h
This is a vehicle
Titanic sails at 30 knots
This is a vehicle
```
