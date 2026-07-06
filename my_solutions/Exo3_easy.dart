class Song {
  String title;
  String artist;
  int duration;
  Song(this.title, this.artist, this.duration);
  String play() {
    return 'Now playing: $title by $artist ($duration seconds)';
  }
  // TODO: add fields
  // TODO: add parameterized constructor
  // TODO: add play method
}

void main() {
  // TODO: create two Song objects using the constructor
  var song1 = Song('Blinding Lights', 'The Weekend', 200);
  var song2 = Song('Shape of You', 'Ed Sheeran', 233);
  print(song1.play());
  print(song2.play());
}