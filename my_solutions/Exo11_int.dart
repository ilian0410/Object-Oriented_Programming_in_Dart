class Song {
  String title;
  String artist;
  int duration; // in seconds

  Song(this.title, this.artist, this.duration);

  String formatDuration() {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;
    return "$minutes: $seconds";
  }

  void display() {
    print("$title by $artist (${formatDuration()})");
  }
}

class Playlist {
  String name;
  List<Song> songs = [];

  Playlist(this.name);

  void addSong(Song s) {
    songs.add(s);
    print("Added ${s.title} to $name");
  }

  void removeSong(String title) {
    songs.removeWhere((song) => song.title == title);
  }

  int totalDuration() {
    return songs.fold(0, (sum, song) => sum + song.duration);
  }

  void listSongs() {
    for (int i = 0; i < songs.length; i++) {
      print(
        "${i + 1}. ${songs[i].title} by ${songs[i].artist} (${songs[i].formatDuration()})",
      );
    }
  }

  void display() {
    print("\n=== Playlist: $name ===");
    listSongs();
    int totalSec = totalDuration();
    int minutes = totalSec ~/ 60;
    int seconds = totalSec % 60;
    print("Total duration: $minutes:${seconds.toString().padLeft(2, '0')}");
  }
}

void main() {
  var s1 = Song("Blinding Lights", "The Weekend", 200);
  var s2 = Song("Uptown Funk", "Bruno Mars", 270);
  var s3 = Song("Shape of You", "Ed Sheeran", 234);
  var play = Playlist("Workout Mix");

  play.addSong(s1);
  play.addSong(s2);
  play.addSong(s3);
  play.display();
}
