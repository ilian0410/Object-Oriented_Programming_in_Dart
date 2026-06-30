## Solution

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

class AudioPlayer extends MediaPlayer {
  final List<String> _supportedFormats = ['.mp3', '.wav', '.aac'];

  @override
  void load(String filePath) {
    var ext = filePath.substring(filePath.lastIndexOf('.'));
    if (!_supportedFormats.contains(ext)) {
      print('AudioPlayer: Unsupported format $ext');
      return;
    }
    currentMedia = filePath.split('\\').last.split('/').last;
    print('AudioPlayer: Loaded $currentMedia');
  }

  @override
  void play() {
    if (currentMedia.isNotEmpty) {
      isPlaying = true;
      print('▶ Playing audio: $currentMedia');
    }
  }

  @override
  void pause() {
    isPlaying = false;
    print('⏸ Audio paused');
  }

  @override
  void stop() {
    isPlaying = false;
    currentMedia = '';
    print('⏹ Audio stopped');
  }
}

class VideoPlayer extends MediaPlayer {
  final List<String> _supportedFormats = ['.mp4', '.avi', '.mkv'];
  bool _subtitles = false;

  @override
  void load(String filePath) {
    var ext = filePath.substring(filePath.lastIndexOf('.'));
    if (!_supportedFormats.contains(ext)) {
      print('VideoPlayer: Unsupported format $ext');
      return;
    }
    currentMedia = filePath.split('\\').last.split('/').last;
    print('VideoPlayer: Loaded $currentMedia');
  }

  @override
  void play() {
    if (currentMedia.isNotEmpty) {
      isPlaying = true;
      var sub = _subtitles ? ' (with subtitles)' : '';
      print('▶ Playing video: $currentMedia$sub');
    }
  }

  @override
  void pause() {
    isPlaying = false;
    print('⏸ Video paused');
  }

  @override
  void stop() {
    isPlaying = false;
    currentMedia = '';
    print('⏹ Video stopped');
  }

  void setSubtitles(bool enabled) => _subtitles = enabled;
}

class StreamingPlayer extends MediaPlayer {
  String _quality = '720p';

  @override
  void load(String url) {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      print('StreamingPlayer: Invalid URL');
      return;
    }
    currentMedia = url;
    print('StreamingPlayer: Loading stream...');
  }

  @override
  void play() {
    if (currentMedia.isNotEmpty) {
      isPlaying = true;
      print('▶ Streaming: $currentMedia ($_quality)');
    }
  }

  @override
  void pause() {
    isPlaying = false;
    print('⏸ Stream paused (buffering...)');
  }

  @override
  void stop() {
    isPlaying = false;
    currentMedia = '';
    print('⏹ Stream disconnected');
  }

  void setQuality(String quality) {
    if (['720p', '1080p', '4K'].contains(quality)) _quality = quality;
  }
}

class MediaController {
  MediaPlayer _player;

  MediaController(this._player);

  void playMedia(String source) {
    _player.load(source);
    if (_player.currentMedia.isNotEmpty) {
      _player.play();
    }
  }

  void pauseMedia() => _player.pause();
  void stopMedia() => _player.stop();
  void showStatus() => print(_player.getStatus());
}

void main() {
  var audioController = MediaController(AudioPlayer());
  audioController.playMedia('song.mp3');          // ▶ Playing audio: song.mp3

  var videoController = MediaController(VideoPlayer());
  videoController.playMedia('movie.mp4');         // ▶ Playing video: movie.mp4

  var streamController = MediaController(StreamingPlayer());
  streamController.playMedia('https://live.example.com/stream'); // ▶ Streaming: ...

  var badController = MediaController(AudioPlayer());
  badController.playMedia('notes.txt');           // AudioPlayer: Unsupported format .txt
}
```

### Explanation

- The abstract `MediaPlayer` defines the **common interface** for all players. Each player provides its own implementation while sharing the `currentMedia` and `isPlaying` state.
- **Format validation** is handled by each player, demonstrating how abstract methods enforce different rules.
- **Subtype-specific methods** (`setSubtitles`, `setQuality`) show that while all players share the core interface, each can extend it uniquely.
- `MediaController` works with any `MediaPlayer` subclass through polymorphism — it never needs to know the concrete type.
