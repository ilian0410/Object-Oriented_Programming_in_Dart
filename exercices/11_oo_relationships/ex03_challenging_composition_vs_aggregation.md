# OO Relationships — Challenging

## Instructions

Design a **restaurant management system** that demonstrates both composition and aggregation.

### Composition relationship (Engine → Car style)

1. **`OrderItem`**
   - Fields: `menuItem` (String), `quantity` (int), `price` (double)
   - Getter `totalPrice` = price × quantity
   - Cannot exist outside an `Order`

2. **`Order`**
   - Fields: `tableNumber` (int), `items` (List of OrderItem, initialized inside Order)
   - Method: `addItem(String menuItem, int quantity, double price)`
   - Method: `removeItem(String menuItem)`
   - Method: `getTotal()` — returns sum of all item totals
   - Method: `getReceipt()` — prints a formatted receipt

### Aggregation relationship (University → Student style)

3. **`Chef`**
   - Fields: `name` (String), `specialty` (String)
   - Exists independently of the restaurant

4. **`Waiter`**
   - Fields: `name` (String), `section` (String), `tips` (double)
   - Exists independently of the restaurant

### Restaurant class

5. **`Restaurant`**
   - Fields: `name` (String), `chefs` (List of Chef — aggregation), `waiters` (List of Waiter — aggregation), `orders` (List of Order — composition)
   - Method: `hireChef(Chef c)`
   - Method: `hireWaiter(Waiter w)`
   - Method: `createOrder(int tableNumber)` — creates a new Order and adds it to the list
   - Method: `addToOrder(int tableNumber, String item, int qty, double price)`
   - Method: `closeOrder(int tableNumber)` — prints receipt and removes the order
   - Method: `listStaff()` — prints all chefs and waiters

### In `main()`:
- Create a Restaurant
- Hire chefs and waiters (aggregation — they exist before and after)
- Create orders and add items (composition — orders only exist within the restaurant)
- Close an order (receipt printed, order destroyed)
- Show that chefs/waiters still exist after the restaurant reference is gone
- Show that orders are gone when the restaurant reference is gone

## Expected Output (example)

```
=== Restaurant: La Maison ===
Staff:
  Chef: Marie (Pastry)
  Chef: Pierre (Grill)
  Waiter: Jean (Section A)

Order #5:
  Pasta x2 — $24.00
  Wine x1 — $18.00
  Total: $42.00

After closing restaurant, chefs still exist:
  Marie (Pastry)
  Pierre (Grill)
```
