# OO Relationships — Intermediate

## Instructions

Model an **aggregation** relationship — a "has-a" where the contained objects can exist independently.

### Classes to create

1. **`Player`**
   - Fields: `name` (String), `jerseyNumber` (int), `position` (String)
   - Method: `displayStats()` — prints player info

2. **`Team`**
   - Fields: `name` (String), `city` (String), `players` (List of Player)
   - Constructor takes `name`, `city`, and initializes an empty players list
   - Method: `addPlayer(Player p)` — adds a player to the team
   - Method: `removePlayer(String name)` — removes a player by name
   - Method: `listRoster()` — prints all players in the team
   - Method: `getPlayerCount()` — returns the number of players

### In `main()`:
- Create several `Player` objects
- Create two `Team` objects
- Add some players to the first team, others to the second
- Show that a player can exist without a team (create a free agent)
- Show that players continue to exist if the team is removed (discard the team reference)

## Expected Output (example)

```
=== Warriors Roster ===
  #30 Stephen Curry (PG)
  #11 Klay Thompson (SG)
  #23 Draymond Green (PF)

=== Lakers Roster ===
  #23 LeBron James (SF)
  #3 Anthony Davis (PF)

Free Agent: James Harden (#13)
```
