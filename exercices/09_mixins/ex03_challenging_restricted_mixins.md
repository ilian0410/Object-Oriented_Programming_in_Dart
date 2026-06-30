# Mixins — Challenging

## Instructions

Design a **game character system** using restricted mixins (the `on` keyword).

### Base class
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
```

### Your task

Create restricted mixins that can only be applied to `Character` (or its subclasses) because they access `Character`'s fields and methods.

1. **`mixin Magical` on `Character`**
   - Method `castSpell(String spellName, int cost)` — if `mana >= cost`, subtract cost and print `"$name casts $spellName!"`; otherwise print `"Not enough mana"`
   - Method `rechargeMana(int amount)` — adds to `mana` (max 100)

2. **`mixin Defensive` on `Character`**
   - Additional field/property `int shield = 0`
   - Method `raiseShield(int strength)` — sets shield to strength
   - Method `block(int incomingDamage)` — shield absorbs damage first, remaining goes to health
   - Override `takeDamage` concept — when taking damage, first apply shield reduction

3. **`mixin Stealth` on `Character`**
   - Additional field `bool _isHidden = false`
   - Method `hide()` — sets `_isHidden = true`, prints `"$name vanishes into the shadows"`
   - Method `reveal()` — sets `_isHidden = false`
   - Method `sneakAttack(int damage)` — if hidden, deals double damage to the target; if not hidden, deals normal damage

### Concrete classes

1. **`Wizard`** extends `Character` with `Magical`
2. **`Knight`** extends `Character` with `Defensive`
3. **`Rogue`** extends `Character` with `Stealth`
4. **`Paladin`** extends `Character` with `Magical, Defensive`

### In `main()`:
- Create one of each character class
- Demonstrate all their abilities
- Show that a mixin cannot be used on a non-Character class

## Expected Output (example)

```
Wizard — HP: 100, MP: 50
Wizard casts Fireball! (MP: 40)
Not enough mana

Knight raises shield (strength: 30)
Knight takes 20 damage (shield absorbs 20, HP: 100)
Knight takes 50 damage — shield absorbs 10, HP: 60

Rogue vanishes into the shadows
Rogue performs a sneak attack for 60 damage!

Paladin — HP: 100, MP: 50
Paladin casts Holy Light! (MP: 40)
Paladin raises shield (strength: 25)
```
