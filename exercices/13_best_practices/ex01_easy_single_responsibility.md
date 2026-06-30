# Best Practices — Easy

## Instructions

The class below violates the **Single Responsibility Principle**. Refactor it into smaller classes, each with one clear job.

### Bad code (refactor this)

```dart
class UserManager {
  List<Map<String, dynamic>> users = [];

  void addUser(String name, String email) {
    users.add({'name': name, 'email': email});
    print('User added: $name');
  }

  void saveToFile() {
    var file = File('users.txt');
    file.writeAsStringSync(users.toString());
    print('Saved to file');
  }

  bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  void sendWelcomeEmail(String email) {
    print('Sending welcome email to $email');
  }

  void displayUsers() {
    for (var u in users) {
      print('${u['name']} — ${u['email']}');
    }
  }
}
```

### Your task

Split this into at least **3 separate classes**:

1. **`User`** — data model with `name` and `email` fields, validation in the constructor
2. **`UserRepository`** — stores and manages the list of users (add, list)
3. **`EmailService`** — handles sending emails
4. **`FilePersistence`** — handles saving/loading from files (optional)

The `main()` function should compose these classes together.

## Expected Output (example)

```
User added: Alice (alice@mail.com)
User added: Bob (invalid-email)
Invalid email: invalid-email
Sending welcome email to alice@mail.com
Users:
  Alice — alice@mail.com
Data saved to file
```
