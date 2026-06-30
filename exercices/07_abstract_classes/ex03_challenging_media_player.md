# Abstract Classes — Challenging

## Instructions

Design a **media player framework** using abstract classes and polymorphism.

### Abstract class `MediaPlayer`
```dart
abstract class MediaPlayer {
  String currentMedia = '';
  bool isPlaying = false;

  void load(String filePath);
  void play();
  void pause();
  void stop();

  String getStatus() {
    if (isPlaying) return 'Playing: $currentMedia';
    if (currentMedia.isNotEmpty) return 'Paused: $currentMedia';
    return 'No media loaded';
  }
}
```

### Your task

Create three media player implementations:

1. **`AudioPlayer`**
   - `load(`filePath`)`: only accepts `.mp3`, `.wav`, `.aac` files — reject others with an error message
   - Sets `currentMedia` to the file name (extracted from path)
   - `play()`: prints `"▶ Playing audio: $currentMedia"` and sets `isPlaying = true`
   - `pause()`: prints `"⏸ Audio paused"` and sets `isPlaying = false`
   - `stop()`: prints `"⏹ Audio stopped"` and resets state

2. **`VideoPlayer`**
   - `load(`filePath`)`: only accepts `.mp4`, `.avi`, `.mkv` files — reject others
   - `play()`: prints `"▶ Playing video: $currentMedia (with subtitles)"`
   - Additional method `setSubtitles(bool enabled)` that toggles subtitles

3. **`StreamingPlayer`**
   - `load(`url`)`: accepts any URL starting with `http://` or `https://`
   - `play()`: prints `"▶ Streaming: $currentMedia"` and simulates buffering
   - Additional method `setQuality(String quality)` — accepts `"720p"`, `"1080p"`, `"4K"` (default `"720p"`)

### `MediaController` class
- Holds a `MediaPlayer` (polymorphic reference)
- Method `playMedia(String source)` — handles loading and playing
- Method `pauseMedia()`, `stopMedia()`
- Method `showStatus()`

### In `main()`:
- Demonstrate that `MediaController` works with any player type
- Show error handling for unsupported formats

## Expected Output (example)

```
Audio: ▶ Playing audio: song.mp3
Video: ▶ Playing video: movie.mp4 (with subtitles)
Stream: ▶ Streaming: https://live.example.com/stream
Error: Unsupported format .txt
```
