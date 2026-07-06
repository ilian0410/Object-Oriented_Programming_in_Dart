# Constructors — Intermediate

## Instructions

Create a `Temperature` class that can be constructed in multiple ways.

### Requirements

- **Fields**: `value` (double), `scale` (String, either `"C"` or `"F"`)
- **Main constructor**: takes `value` and `scale` using shorthand syntax
- **Named constructor `Temperature.celsius(double value)`**: creates a Temperature with scale `"C"` — must redirect to the main constructor
- **Named constructor `Temperature.fahrenheit(double value)`**: creates a Temperature with scale `"F"` — must redirect to the main constructor
- **Named constructor `Temperature.fromKelvin(double kelvin)`**: uses an **initializer list** to convert Kelvin to Celsius (`value = kelvin - 273.15`) and sets scale to `"C"`
- **Method**: `describe()` that prints `"value°scale"`

## Expected Output

```dart
void main() {
  var t1 = Temperature(25, 'C');
  var t2 = Temperature.celsius(30);
  var t3 = Temperature.fahrenheit(98.6);
  var t4 = Temperature.fromKelvin(300);

  t1.describe(); // 25.0°C
  t2.describe(); // 30.0°C
  t3.describe(); // 98.6°F
  t4.describe(); // 26.85°C
}
```
