# Inheritance — Easy

## Instructions

Create a `Device` base class and a `Smartphone` subclass.

### `Device` class
- **Fields**: `brand` (String), `model` (String)
- **Constructor**: parameterized using shorthand
- **Method**: `turnOn()` that prints `"brand model is now ON"`
- **Method**: `turnOff()` that prints `"brand model is now OFF"`

### `Smartphone` class (extends `Device`)
- **Additional field**: `batteryLevel` (int)
- **Constructor**: takes `brand`, `model`, `batteryLevel` and calls `super(brand, model)`
- **Method**: `takePhoto()` that prints `"📸 Click! Photo taken (battery: batteryLevel%)"`

In `main()`, create a `Smartphone` object and call `turnOn()`, `takePhoto()`, and `turnOff()`.

## Expected Output

```
Apple iPhone 15 is now ON
📸 Click! Photo taken (battery: 85%)
Apple iPhone 15 is now OFF
```
