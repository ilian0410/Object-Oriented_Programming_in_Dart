# Classes and Objects — Intermediate

## Instructions

Complete the code below. The `Cart` class represents a shopping cart. You must:

1. Add a `totalPrice` getter that calculates the sum of all item prices
2. In `main()`, create **two cart references** that point to the **same** cart object
3. Add items through one reference, then read through the other
4. Print the total price

## Starter Code

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

  // TODO: add totalPrice getter here
}

void main() {
  // TODO: create ONE cart object with TWO references

  // TODO: add items using one reference

  // TODO: print total using the other reference
}
```

## Questions (answer in comments)

1. Why does the second reference see the items added through the first?
2. What would happen if you assigned a new `Cart()` to one of the references — would the other be affected?
