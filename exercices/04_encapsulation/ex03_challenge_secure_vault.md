# Encapsulation — Challenge

## Instructions

Design a `Vault` class that securely protects a secret code. All data must be fully encapsulated — no direct field access from outside.

### `Vault` class
- **Private fields**: `_secretCode` (String), `_passcode` (String), `_locked` (bool, default `true`)
- **Constructor**: takes the secret code and a passcode
- **Getter**: `isLocked` — returns whether the vault is locked
- **No getter for `_secretCode`** — the only way to read it is through `open()`
- **No getter for `_passcode`** — it must never be exposed
- **Method**: `open(String attempt)` — if `_locked` is `false`, print `"Vault is already open"`. If `attempt` matches `_passcode`, set `_locked = false` and print `"Vault opened. Secret: _secretCode"`. Otherwise print `"Wrong passcode!"`.
- **Method**: `lock()` — sets `_locked = true`, prints `"Vault locked"`
- **Method**: `reset(String oldPasscode, String newSecret, String newPasscode)` — if `oldPasscode` matches `_passcode` and vault is unlocked, update both the secret code and the passcode. Otherwise print `"Access denied"`.

## Expected Output

```dart
void main() {
  var vault = Vault('I love Dart', '1234');

  vault.open('0000');   // Wrong passcode!
  vault.open('1234');   // Vault opened. Secret: I love Dart
  vault.open('1234');   // Vault is already open

  vault.lock();         // Vault locked
  vault.open('1234');   // Vault opened. Secret: I love Dart

  vault.reset('1234', 'New secret', '5678'); // Access denied (locked)
  vault.open('1234');   // Vault opened. Secret: I love Dart
  vault.reset('1234', 'Flutter rocks', '0000'); // (succeeds — vault is open)
  vault.lock();
  vault.open('0000');   // Vault opened. Secret: Flutter rocks
}
```
