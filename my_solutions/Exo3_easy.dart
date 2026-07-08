class Song {
  final String title;
  final String artist;
  final int duration;
  const Song(this.title, this.artist) : duration = 223;
  String play() {
    return 'Now playing: $title by $artist ($duration seconds)';
  }

  // TODO: add fields
  // TODO: add parameterized constructor
  // TODO: add play method
}

void main() {
  // TODO: create two Song objects using the constructor
  const Song s1 = Song('Blinding Lights', 'The Weekend');
  const Song s2 = Song('Shape of You', 'Ed Sheeran');
  print(s1.play());
  print(s2.play());
}
