## Solution

```dart
class User {
  final String name;
  final String email;

  User(this.name, this.email) {
    if (!isValidEmail(email)) {
      print('Invalid email: $email');
    }
  }

  static bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
}

class UserRepository {
  final List<User> _users = [];

  void add(User user) {
    _users.add(user);
    print('User added: ${user.name} (${user.email})');
  }

  List<User> getAll() => List.unmodifiable(_users);

  void displayUsers() {
    print('Users:');
    for (var u in _users) {
      print('  ${u.name} — ${u.email}');
    }
  }
}

class EmailService {
  void sendWelcome(User user) {
    print('Sending welcome email to ${user.email}');
  }
}

class FilePersistence {
  void save(String filename, List<User> users) {
    print('Saving ${users.length} users to $filename');
  }
}

void main() {
  var repo = UserRepository();
  var emailService = EmailService();
  var persistence = FilePersistence();

  var alice = User('Alice', 'alice@mail.com');
  var bob = User('Bob', 'invalid-email');

  repo.add(alice);
  repo.add(bob);

  emailService.sendWelcome(alice);
  repo.displayUsers();
  persistence.save('users.txt', repo.getAll());
}
```

### Explanation

| Original `UserManager` | Refactored classes | Responsibility |
|---|---|---|
| `addUser()`, `displayUsers()` | `UserRepository` | Managing user storage |
| `sendWelcomeEmail()` | `EmailService` | Sending emails |
| `saveToFile()` | `FilePersistence` | File I/O |
| `isValidEmail()` | `User` (in constructor) | Email validation |

Each class now has **one reason to change**. Changes to email logic affect only `EmailService`. Changes to storage affect only `UserRepository`. This follows the **Single Responsibility Principle**.
