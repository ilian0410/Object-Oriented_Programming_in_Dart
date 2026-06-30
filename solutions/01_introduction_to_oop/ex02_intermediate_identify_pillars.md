## Solution

### Answers

1. **Encapsulation** (line 3-4): `_make` and `_model` are private fields. They are accessed via public getters `make` and `model` (lines 7-8). External code cannot directly modify the internal state.

2. **Inheritance** (lines 13, 27): `Car` and `Motorcycle` both `extend Vehicle`. They inherit `make`, `model`, getters, `start()`, and `stop()` — sharing common vehicle behavior without rewriting it.

3. **Polymorphism** (lines 35-43): `Vehicle v1 = Car(...)` and `Vehicle v2 = Motorcycle(...)` use parent references to hold child objects. The loop `for (var v in vehicles)` calls `v.start()` on each — Dart dispatches to the correct `start()` at runtime:
   - `Car.start()` prints "Insert key" then calls `super.start()`
   - `Motorcycle.start()` prints "Kick-start... Harley Street 750 roars"

4. **Abstraction**: The `main()` function calls `v.start()`, `v.stop()`, `v.make` without knowing whether the vehicle is a Car or Motorcycle. The internal details (key insertion vs kick-start) are hidden behind the `start()` interface.
