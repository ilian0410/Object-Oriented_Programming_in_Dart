# OOP Relationships — Easy

## Instructions

Model an **association** between a `Driver` and a `Car`. Both classes are independent — they just know about each other.

### `Car` class
- **Fields**: `model` (String), `year` (int)
- **Constructor**
- **Method**: `display()` — prints `"model (year)"`

### `Driver` class
- **Fields**: `name` (String), `age` (int), `car` (Car?) — an associated car, initially `null`
- **Constructor**: takes `name` and `age`
- **Method**: `assignCar(Car c)` — sets the `car` field
- **Method**: `drive()` — if `car` is not null, print `"name is driving the car"`; otherwise print `"name has no car"`
- **Method**: `showInfo()` — prints driver name/age and associated car info

## Expected Output

```
Driver: Alice (25)
  Car: Toyota Corolla (2022)

Driver: Bob (30)
  No car assigned
```
