## Solution

```dart
class Player {
  String name;
  int jerseyNumber;
  String position;

  Player(this.name, this.jerseyNumber, this.position);

  void displayStats() {
    print('  #$jerseyNumber ${name} (${position})');
  }
}

class Team {
  String name;
  String city;
  List<Player> players = [];

  Team(this.name, this.city);

  void addPlayer(Player p) {
    players.add(p);
    print('Added ${p.name} to $name');
  }

  void removePlayer(String name) {
    players.removeWhere((p) => p.name == name);
    print('Removed $name from $name');
  }

  void listRoster() {
    print('=== $name Roster ===');
    for (var p in players) {
      p.displayStats();
    }
  }

  int getPlayerCount() => players.length;
}

void main() {
  var steph = Player('Stephen Curry', 30, 'PG');
  var klay = Player('Klay Thompson', 11, 'SG');
  var dray = Player('Draymond Green', 23, 'PF');

  var lebron = Player('LeBron James', 23, 'SF');
  var ad = Player('Anthony Davis', 3, 'PF');

  var warriors = Team('Warriors', 'San Francisco');
  warriors.addPlayer(steph);
  warriors.addPlayer(klay);
  warriors.addPlayer(dray);

  var lakers = Team('Lakers', 'Los Angeles');
  lakers.addPlayer(lebron);
  lakers.addPlayer(ad);

  warriors.listRoster();
  lakers.listRoster();

  // Free agent — player exists without a team
  var harden = Player('James Harden', 13, 'SG');
  print('\nFree Agent: ${harden.name} (#${harden.jerseyNumber})');

  // Even if Warriors team is discarded, players still exist
}
```

### Explanation

- **Aggregation** is a "has-a" relationship where the contained objects (Players) can exist independently of the container (Team).
- If the Warriors `Team` object is discarded, `steph`, `klay`, and `dray` `Player` objects still exist in memory (they could join another team).
- The `Team` holds a `List<Player>` reference, but players are created externally and passed in — the team doesn't create them.
- This is the key difference from composition: in aggregation, the lifecycle of the part is independent of the whole.
