# Constructors — Intermediate

## Instructions

Create a `User` class that can be constructed in three different ways:

1. **Full constructor**: takes `name`, `email`, and `role`
2. **Named constructor `User.guest()`**: creates a guest user with name `"Guest"`, email `"guest@example.com"`, role `"viewer"`
3. **Named constructor `User.admin(String name, String email)`**: creates an admin user with role `"admin"`

Additionally, use a **redirecting constructor** — one of the named constructors should delegate to another using `this(...)`.

## Requirements

- All fields (`name`, `email`, `role`) must be `final`
- The `User.guest()` constructor must redirect to the main constructor
- Add a `describe()` method that prints: `"name (role) — email"`

## Expected Output

```dart
void main() {
  var u1 = User('Alice', 'alice@mail.com', 'editor');
  var u2 = User.guest();
  var u3 = User.admin('Bob', 'bob@mail.com');

  u1.describe(); // Alice (editor) — alice@mail.com
  u2.describe(); // Guest (viewer) — guest@example.com
  u3.describe(); // Bob (admin) — bob@mail.com
}
```
