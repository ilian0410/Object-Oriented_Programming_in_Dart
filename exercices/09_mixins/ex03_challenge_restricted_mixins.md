# Mixins — Challenge

## Instructions

Use restricted mixins (the `on` keyword) to add abilities that depend on the host class.

### Base class

```dart
class Player {
  String name;
  int health = 100;
  int mana = 50;

  Player(this.name);

  void takeDamage(int amount) {
    health -= amount;
    if (health <= 0) {
      health = 0;
      print('$name has fallen!');
    } else {
      print('$name takes $amount damage (HP: $health)');
    }
  }

  void displayStats() => print('$name — HP: $health, MP: $mana');
}
```

### Your task

Create restricted mixins that can only be used on `Player` or its subclasses:

1. **`mixin Healer on Player`**
   - Method `heal(int amount)` — increases health (max 100), prints `"name heals amount HP (HP: health)"`
   - Method `fullRestore()` — sets health to 100 and mana to 50

2. **`mixin Mage on Player`**
   - Method `cast(String spell, int cost)` — if `mana >= cost`, reduces mana and prints `"name casts spell!"`; else prints `"Not enough mana"`
   - Method `recharge(int amount)` — increases mana (max 100)

3. **`mixin Tank on Player`**
   - Field `armor` (int, default 0)
   - Method `raiseArmor(int value)` — sets armor
   - Method `block(int damage)` — armor absorbs half the damage (rounded down), rest applies to health

### Concrete classes

1. `Cleric` extends `Player` with `Healer`
2. `Wizard` extends `Player` with `Mage`
3. `Paladin` extends `Player` with `Healer, Tank`
4. `BattleMage` extends `Player` with `Mage, Tank`

### In `main()`:
- Create one of each
- Demonstrate their unique abilities

## Expected Output (example)

```
Cleric — HP: 100, MP: 50
Cleric heals 20 HP (HP: 100)
Wizard casts Fireball! (MP: 40)
Wizard tries to cast Ultimate (costs 100): Not enough mana
Paladin raises armor by 30
Paladin blocks 50 damage (armor absorbs 25, HP: 75)
BattleMage casts Lightning! (MP: 35)
BattleMage raises armor by 15
```
