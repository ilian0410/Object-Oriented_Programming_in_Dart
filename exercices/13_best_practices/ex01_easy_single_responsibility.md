# Best Practices — Easy

## Instructions

The class below does **too many things** — it violates the Single Responsibility Principle. Refactor it into smaller classes, each with one clear job.

### Bad code

```dart
class OrderManager {
  List<Map<String, dynamic>> orders = [];

  void addOrder(String item, double price) {
    orders.add({'item': item, 'price': price});
    print('Order added: $item');
  }

  double calculateTotal() {
    double total = 0;
    for (var o in orders) total += o['price'];
    return total;
  }

  void printReceipt() {
    print('=== Receipt ===');
    for (var o in orders) {
      print('${o['item']}: \$${o['price']}');
    }
    print('Total: \$${calculateTotal()}');
  }

  void sendConfirmation(String email) {
    print('Sending receipt to $email...');
    print('Email sent!');
  }

  void saveToDatabase() {
    print('Saving ${orders.length} orders to database...');
    print('Saved!');
  }
}
```

### Your task

Split this into **three separate classes**:

1. **`Order`** — data model with `item` (String) and `price` (double) fields, constructor
2. **`OrderRepository`** — manages the list of orders (add, get all, calculate total)
3. **`ReceiptService`** — prints receipts and sends confirmation emails (uses `OrderRepository`)
4. **`DatabaseService`** — handles saving data (uses `OrderRepository`)

In `main()`, compose these classes to achieve the same behavior.

## Expected Output (example)

```
Order added: Laptop
Order added: Mouse
=== Receipt ===
Laptop: $999.99
Mouse: $25.50
Total: $1025.49
Sending receipt to alice@mail.com...
Email sent!
Saving 2 orders to database...
Saved!
```
