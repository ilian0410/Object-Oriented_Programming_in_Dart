class Temperature {
  double value;
  String unit;

  Temperature(this.value, this.unit);

  Temperature.celsius(double cel) : this(cel, 'C');

  Temperature.fahrenheit(double fah)
      : this(fah , 'F');

  Temperature.fromKelvin(double kel)
      : this(kel - 273.15, 'C');

  void describe() {
    print('${value.toStringAsFixed(2)} $unit');
  }
}
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


