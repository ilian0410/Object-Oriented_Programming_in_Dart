class Order {
  String item;
  double price;

  Order(this.item, this.price);
}

class OrderRepository {
  List<Order> orders = [];

  void addOrder(Order order) {
    orders.add(order);
    print('Order added: ${order.item}');
  }

  List<Order> getAllOrders() {
    return orders;
  }

  double calculateTotal() {
    return orders.fold(0, (sum, order) => sum + order.price);
  }
}

class ReceiptService {
  final OrderRepository orderRepository;

  ReceiptService(this.orderRepository);

  void printReceipt() {
    print('=== Receipt ===');
    for (var order in orderRepository.getAllOrders()) {
      print('${order.item}: \$${order.price}');
    }
    print('Total: \$${orderRepository.calculateTotal()}');
  }

  void sendConfirmation(String email) {
    print('Sending receipt to $email...');
    print('Email sent!');
  }
}

class DatabaseService {
  final OrderRepository orderRepository;

  DatabaseService(this.orderRepository);

  void saveToDatabase() {
    print('Saving ${orderRepository.getAllOrders().length} orders to database...');
    print('Saved!');
  }
}

void main() {
  var orderRepo = OrderRepository();
  var receiptService = ReceiptService(orderRepo);
  var dbService = DatabaseService(orderRepo);

  orderRepo.addOrder(Order('Laptop', 999.99));
  orderRepo.addOrder(Order('Mouse', 25.50));
  


  receiptService.printReceipt();
  dbService.saveToDatabase();
}
