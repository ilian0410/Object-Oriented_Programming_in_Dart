# Design Patterns — Challenge

## Instructions

Implement the **Observer** pattern using Dart's `Stream` and `StreamController`. The subject (weather station) notifies all observers (displays) when the temperature changes.

### `WeatherStation` (Subject)
- **Private field**: `StreamController<double> _controller` (use `StreamController<double>.broadcast()`)
- **Public getter**: `Stream<double> get temperatureStream` — exposes `_controller.stream`
- **Method**: `void updateTemperature(double temp)` — adds the temperature to the stream and prints `"Station: new temperature = temp°C"`
- **Method**: `void dispose()` — closes the controller

### Observer classes — each implements display behavior

1. **`PhoneDisplay`**
   - Method: `void subscribe(WeatherStation station)` — listens to `station.temperatureStream` and prints `"Phone: temperature is temp°C"`
   - Method: `void unsubscribe()` — cancels the subscription

2. **`WindowDisplay`**
   - Method: `void subscribe(WeatherStation station)` — listens to `station.temperatureStream` and prints `"Window: temperature is temp°C"`
   - Method: `void unsubscribe()` — cancels the subscription

3. **`AlertDisplay`**
   - Method: `void subscribe(WeatherStation station)` — listens to `station.temperatureStream` and if `temp > 35`, prints `"🔥 ALERT: Heat warning! temp°C"`; if `temp < 5`, prints `"❄️ ALERT: Freeze warning! temp°C"`
   - Method: `void unsubscribe()` — cancels the subscription

## Expected Output

```dart
void main() {
  var station = WeatherStation();

  var phone = PhoneDisplay();
  var window = WindowDisplay();
  var alert = AlertDisplay();

  phone.subscribe(station);
  window.subscribe(station);
  alert.subscribe(station);

  station.updateTemperature(22);
  station.updateTemperature(38);

  phone.unsubscribe();

  station.updateTemperature(15);

  station.dispose();
}
```

```
Station: new temperature = 22.0°C
Phone: temperature is 22.0°C
Window: temperature is 22.0°C
Station: new temperature = 38.0°C
Phone: temperature is 38.0°C
Window: temperature is 38.0°C
🔥 ALERT: Heat warning! 38.0°C
Station: new temperature = 15.0°C
Window: temperature is 15.0°C
```
