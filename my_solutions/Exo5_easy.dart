class Device {
  String brand;
  String model;

  Device(this.brand, this.model);

  void turnOn() {
    print('$brand $model is now ON');
  }

  void turnOff() {
    print('$brand $model is now OFF');
  }
}

class Smartphone extends Device {
  int batteryLevel;

  Smartphone(String brand, String model, this.batteryLevel) : super(brand, model);

  void takePhoto() {
    print("📸 Click! Photo taken (battery: $batteryLevel%)");
  }
}

void main() {
  var myPhone = Smartphone('Apple', 'iPhone 15', 85);
  myPhone.turnOn();
  myPhone.takePhoto();
  myPhone.turnOff();
}
