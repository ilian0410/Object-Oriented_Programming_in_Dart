## Solution

```dart
class OrderItem {
  String menuItem;
  int quantity;
  double price;

  OrderItem(this.menuItem, this.quantity, this.price);

  double get totalPrice => price * quantity;

  @override
  String toString() => '  $menuItem x$quantity — \$${totalPrice.toStringAsFixed(2)}';
}

class Order {
  int tableNumber;
  List<OrderItem> items = [];

  Order(this.tableNumber);

  void addItem(String menuItem, int quantity, double price) {
    items.add(OrderItem(menuItem, quantity, price));
    print('Added $menuItem x$quantity to order #$tableNumber');
  }

  void removeItem(String menuItem) {
    items.removeWhere((i) => i.menuItem == menuItem);
  }

  double getTotal() {
    double total = 0;
    for (var item in items) total += item.totalPrice;
    return total;
  }

  void getReceipt() {
    print('\nOrder #$tableNumber:');
    for (var item in items) print(item);
    print('  Total: \$${getTotal().toStringAsFixed(2)}');
  }
}

class Chef {
  String name;
  String specialty;

  Chef(this.name, this.specialty);

  @override
  String toString() => 'Chef: $name ($specialty)';
}

class Waiter {
  String name;
  String section;
  double tips = 0;

  Waiter(this.name, this.section);

  @override
  String toString() => 'Waiter: $name (Section $section)';
}

class Restaurant {
  String name;
  List<Chef> chefs = [];
  List<Waiter> waiters = [];
  List<Order> orders = [];

  Restaurant(this.name);

  void hireChef(Chef c) => chefs.add(c);
  void hireWaiter(Waiter w) => waiters.add(w);

  void createOrder(int tableNumber) {
    orders.add(Order(tableNumber));
    print('Created order for table #$tableNumber');
  }

  void addToOrder(int tableNumber, String item, int qty, double price) {
    var order = orders.firstWhere((o) => o.tableNumber == tableNumber);
    order.addItem(item, qty, price);
  }

  void closeOrder(int tableNumber) {
    var order = orders.firstWhere((o) => o.tableNumber == tableNumber);
    order.getReceipt();
    orders.remove(order);
    print('Order #$tableNumber closed\n');
  }

  void listStaff() {
    print('=== $name ===');
    print('Staff:');
    for (var c in chefs) print('  $c');
    for (var w in waiters) print('  $w');
    print('');
  }
}

void main() {
  var marie = Chef('Marie', 'Pastry');
  var pierre = Chef('Pierre', 'Grill');
  var jean = Waiter('Jean', 'A');

  var restaurant = Restaurant('La Maison');
  restaurant.hireChef(marie);
  restaurant.hireChef(pierre);
  restaurant.hireWaiter(jean);

  restaurant.listStaff();

  restaurant.createOrder(5);
  restaurant.addToOrder(5, 'Pasta', 2, 12.00);
  restaurant.addToOrder(5, 'Wine', 1, 18.00);
  restaurant.closeOrder(5);

  // Chef objects still exist after restaurant is discarded
  print('After closing, chefs still exist:');
  print(marie);
  print(pierre);
}
```

### Explanation

**Composition** (Order ↔ OrderItem):
- `Order` creates its own `OrderItem` objects internally via `addItem()`.
- `OrderItem` has no independent existence — it's meaningless outside an order.
- When the order is closed and removed, its `OrderItem` objects become unreachable.

**Aggregation** (Restaurant ↔ Chef/Waiter):
- `Chef` and `Waiter` objects are created independently and passed to the restaurant.
- They exist before the restaurant and continue to exist after it's discarded.
- The same chef could work at multiple restaurants.

**Key distinction**: With composition, the part dies with the whole. With aggregation, the part lives on.
