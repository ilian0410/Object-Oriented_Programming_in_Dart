# OOP Relationships — Intermediate

## Instructions

Model an **aggregation** relationship between a `Playlist` and `Song` objects. Songs can exist without the playlist.

### `Song` class
- **Fields**: `title` (String), `artist` (String), `duration` (int, in seconds)
- **Constructor**
- **Method**: `formatDuration()` — returns `"m:ss"` format
- **Method**: `display()` — prints `"title by artist (duration)"`

### `Playlist` class
- **Fields**: `name` (String), `songs` (List of Song, initialized as empty `[]`)
- **Constructor**: takes `name`
- **Method**: `addSong(Song s)` — adds a song and prints `"Added title to name"`
- **Method**: `removeSong(String title)` — removes a song by title
- **Method**: `totalDuration()` — returns the sum of all song durations in seconds
- **Method**: `listSongs()` — prints all songs in the playlist
- **Method**: `display()` — prints playlist name followed by all songs and total duration

### In `main()`:
- Create several `Song` objects
- Create a `Playlist` and add some songs
- Display the playlist
- Show that songs exist independently (create a `Song` that isn't added to any playlist)
- Remove a song from the playlist and show that the song object still exists

## Expected Output (example)

```
Added Blinding Lights to Workout Mix
Added Uptown Funk to Workout Mix
Added Shape of You to Workout Mix

=== Playlist: Workout Mix ===
1. Blinding Lights by The Weeknd (3:20)
2. Uptown Funk by Bruno Mars (4:30)
3. Shape of You by Ed Sheeran (3:54)
Total duration: 11:44

Standalone song: Bohemian Rhapsody by Queen (5:55)
```
