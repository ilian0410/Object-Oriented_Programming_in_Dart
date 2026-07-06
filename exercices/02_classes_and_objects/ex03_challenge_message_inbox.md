# Classes and Objects — Challenge

## Instructions

Build a simple message-and-inbox system using two classes.

### `Message` class
- **Fields**: `sender` (String), `text` (String), `isRead` (bool, default `false`)
- **Method**: `markAsRead()` — sets `isRead` to `true`
- **Method**: `display()` — prints `"[FROM sender] text"` and if unread adds `" (NEW)"`

### `Inbox` class
- **Field**: `messages` (List of Message objects, default empty list `[]`)
- **Method**: `receive(Message msg)` — adds the message to the list and prints `"New message from sender"`
- **Method**: `showAll()` — prints all messages using their `display()` method
- **Method**: `showUnread()` — displays only messages where `isRead` is `false`

## Starter Code

```dart
class Message {
  // TODO: add fields
  // TODO: add markAsRead method
  // TODO: add display method
}

class Inbox {
  // TODO: add messages field
  // TODO: add receive method
  // TODO: add showAll method
  // TODO: add showUnread method
}

void main() {
  var inbox = Inbox();

  var m1 = Message();
  m1.sender = 'Alice';
  m1.text = 'Are you coming?';
  inbox.receive(m1);

  var m2 = Message();
  m2.sender = 'Bob';
  m2.text = 'Meeting at 3pm';
  inbox.receive(m2);

  m1.markAsRead();

  print('\n--- All messages ---');
  inbox.showAll();

  print('\n--- Unread ---');
  inbox.showUnread();
}
```

## Expected Output

```
New message from Alice
New message from Bob

--- All messages ---
[FROM Alice] Are you coming?
[FROM Bob] Meeting at 3pm (NEW)

--- Unread ---
[FROM Bob] Meeting at 3pm (NEW)
```
