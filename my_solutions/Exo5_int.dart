class RestaurantEmployee {
  String name;
  double hourlyWage;

  RestaurantEmployee(this.name, this.hourlyWage);

  double calculatePay(int hours) {
    return hours * hourlyWage;
  }

  void describe() {
    print('$name works at the restaurant');
  }
}
class Chef extends RestaurantEmployee {
  String specialty;

  Chef(String name, double hourlyWage, this.specialty) : super(name, hourlyWage);

  @override
  void describe() {
    super.describe();
    print('They specialize in $specialty');
  }
}
class Server extends RestaurantEmployee {
  double tips;

  Server(String name, double hourlyWage, this.tips) : super(name, hourlyWage);

  @override
  double calculatePay(int hours) {
    return super.calculatePay(hours) + tips;
  }

  @override
  void describe() {
    super.describe();
    print('They serve tables');
  }
}
void main() {
  var chef = Chef('Marie', 25.0, 'Pastry');
  var server = Server('Jean', 15.0, 80.0);

  print(chef.calculatePay(40)); // 1000.0
  chef.describe(); // Marie works at the restaurant\nThey specialize in Pastry

  print(server.calculatePay(40)); // 680.0
  server.describe(); // Jean works at the restaurant\nThey serve tables
}