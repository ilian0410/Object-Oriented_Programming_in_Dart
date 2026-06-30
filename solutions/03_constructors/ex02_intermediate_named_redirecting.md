## Solution

```dart
class User {
  final String name;
  final String email;
  final String role;

  User(this.name, this.email, this.role);

  // Named constructor that redirects to the main constructor
  User.guest() : this('Guest', 'guest@example.com', 'viewer');

  // Named constructor with explicit field assignment
  User.admin(this.name, this.email) : role = 'admin';

  void describe() {
    print('$name ($role) — $email');
  }
}

void main() {
  var u1 = User('Alice', 'alice@mail.com', 'editor');
  var u2 = User.guest();
  var u3 = User.admin('Bob', 'bob@mail.com');

  u1.describe(); // Alice (editor) — alice@mail.com
  u2.describe(); // Guest (viewer) — guest@example.com
  u3.describe(); // Bob (admin) — bob@mail.com
}
```

### Explanation

- `User.guest()` uses a **redirecting constructor** — it has no body and no field initialization of its own. It delegates to `User(this.name, this.email, this.role)` with fixed defaults.
- `User.admin()` uses a **named constructor** with direct field initialization via shorthand `this.` syntax for `name` and `email`, with `role` defaulting to `'admin'`.
- All fields are `final` — they must be initialized either through the constructor parameter or directly in the initializer.
- Named constructors are especially useful for providing domain-specific creation patterns (guest users, admin users) without forcing every caller to understand the full constructor API.
