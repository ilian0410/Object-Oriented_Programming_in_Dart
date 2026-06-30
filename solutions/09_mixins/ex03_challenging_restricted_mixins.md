## Solution

```dart
class Character {
  String name;
  int health = 100;
  int mana = 50;

  Character(this.name);

  void takeDamage(int amount) {
    health -= amount;
    if (health <= 0) {
      health = 0;
      print('$name has been defeated!');
    } else {
      print('$name takes $amount damage (HP: $health)');
    }
  }

  void heal(int amount) {
    health = (health + amount).clamp(0, 100);
    print('$name heals $amount (HP: $health)');
  }

  void describe() => print('$name — HP: $health, MP: $mana');
}

mixin Magical on Character {
  void castSpell(String spellName, int cost) {
    if (mana >= cost) {
      mana -= cost;
      print('$name casts $spellName! (MP: $mana)');
    } else {
      print('Not enough mana');
    }
  }

  void rechargeMana(int amount) {
    mana = (mana + amount).clamp(0, 100);
  }
}

mixin Defensive on Character {
  int shield = 0;

  void raiseShield(int strength) {
    shield = strength;
    print('$name raises shield (strength: $strength)');
  }

  void block(int incomingDamage) {
    if (shield > 0) {
      var absorbed = shield < incomingDamage ? shield : incomingDamage;
      shield -= absorbed;
      var remaining = incomingDamage - absorbed;
      if (remaining > 0) {
        takeDamage(remaining);
        print('($shield shield remaining)');
      } else {
        print('$name blocks all $incomingDamage damage');
      }
    } else {
      takeDamage(incomingDamage);
    }
  }
}

mixin Stealth on Character {
  bool _isHidden = false;

  void hide() {
    _isHidden = true;
    print('$name vanishes into the shadows');
  }

  void reveal() {
    _isHidden = false;
    print('$name reveals themself');
  }

  void sneakAttack(int damage) {
    if (_isHidden) {
      print('$name performs a sneak attack for ${damage * 2} damage!');
      _isHidden = false;
    } else {
      print('$name attacks for $damage damage');
    }
  }
}

class Wizard extends Character with Magical {
  Wizard(String name) : super(name);
}

class Knight extends Character with Defensive {
  Knight(String name) : super(name);
}

class Rogue extends Character with Stealth {
  Rogue(String name) : super(name);
}

class Paladin extends Character with Magical, Defensive {
  Paladin(String name) : super(name);
}

void main() {
  var wizard = Wizard('Gandalf');
  wizard.describe();
  wizard.castSpell('Fireball', 10);
  wizard.castSpell('Ultimate', 100);

  var knight = Knight('Arthur');
  knight.raiseShield(30);
  knight.block(20);
  knight.block(50);

  var rogue = Rogue('Shadow');
  rogue.hide();
  rogue.sneakAttack(30);

  var paladin = Paladin('Uther');
  paladin.describe();
  paladin.castSpell('Holy Light', 10);
  paladin.raiseShield(25);
}
```

### Explanation

- **Restricted mixins** with `on Character` mean these mixins can only be applied to `Character` or its subclasses. Trying `class Table with Magical {}` would cause a compile error.
- The mixins access `Character`'s fields (`health`, `mana`, `name`) directly because the `on` clause guarantees the target is a `Character`.
- `Paladin` combines `Magical` and `Defensive` — demonstrating that a class can compose multiple restricted mixins.
- This pattern is used extensively in Flutter (e.g., `SingleTickerProviderStateMixin` is restricted `on State`).
