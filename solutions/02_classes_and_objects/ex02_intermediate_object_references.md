## Solution

```dart
class Item {
  String name;
  double price;

  Item(this.name, this.price);
}

class Cart {
  List<Item> _items = [];

  void addItem(Item item) {
    _items.add(item);
    print('Added ${item.name}');
  }

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }
}

void main() {
  var cart1 = Cart();
  var cart2 = cart1; // both reference the same object

  cart1.addItem(Item('Laptop', 999.99));
  cart1.addItem(Item('Mouse', 25.50));

  print('Total: \$${cart2.totalPrice}'); // $1025.49
}
```

### Answers to questions

1. **Why does cart2 see items added through cart1?** Both `cart1` and `cart2` hold a **reference** to the same `Cart` object in memory. When `addItem` is called on `cart1`, the underlying object is modified. `cart2` points to the same object, so it sees the change.

2. **What if you assigned `cart1 = Cart()`?** The other reference (`cart2`) would still point to the original object. `cart1` would now point to a new, empty cart. The two references would then be independent.
