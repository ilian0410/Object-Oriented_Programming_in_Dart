## Solution

```dart
import 'dart:async';

class NewsAgency {
  final String name;
  final StreamController<String> _controller = StreamController<String>.broadcast();

  NewsAgency(this.name);

  Stream<String> get newsFeed => _controller.stream;

  void publishNews(String category, String headline) {
    var news = '[$category] $headline';
    print('${name} Agency: $news');
    _controller.add(news);
  }

  void dispose() => _controller.close();
}

class Subscriber {
  String name;
  StreamSubscription<String>? _subscription;

  Subscriber(this.name);

  void subscribeTo(NewsAgency agency, {List<String>? categories}) {
    _subscription = agency.newsFeed.listen((news) {
      if (categories != null) {
        var category = news.split(']')[0].substring(1); // extract [Category]
        if (!categories.contains(category)) return;
      }
      receive(news);
    });
    print('$name subscribed to ${agency.name}');
  }

  void receive(String news) => print('  $name received: $news');

  void unsubscribe() {
    _subscription?.cancel();
    print('$name unsubscribed');
  }
}

class NewsAgencyManager {
  List<NewsAgency> _agencies = [];

  NewsAgency createAgency(String name) {
    var agency = NewsAgency(name);
    _agencies.add(agency);
    return agency;
  }

  void publishBreakingNews(String headline) {
    for (var agency in _agencies) {
      agency.publishNews('Breaking', headline);
    }
  }

  void disposeAll() {
    for (var agency in _agencies) {
      agency.dispose();
    }
  }
}

void main() async {
  var manager = NewsAgencyManager();

  var sports = manager.createAgency('Sports');
  var tech = manager.createAgency('Tech');

  var alice = Subscriber('Alice');
  var bob = Subscriber('Bob');
  var charlie = Subscriber('Charlie');

  alice.subscribeTo(sports, categories: ['Sports']);
  bob.subscribeTo(tech, categories: ['Tech']);
  charlie.subscribeTo(sports, categories: ['Sports']);
  charlie.subscribeTo(tech, categories: ['Tech']);

  sports.publishNews('Sports', 'Football World Cup starts');
  tech.publishNews('Tech', 'New Flutter 4.0 released');

  charlie.unsubscribe();

  sports.publishNews('Sports', 'Local team wins championship');
  tech.publishNews('Tech', 'Dart 5.0 announced');

  manager.disposeAll();
}
```

### Explanation

- **Subject (NewsAgency)**: Holds a `StreamController.broadcast()`. When `publishNews()` is called, it adds the event to the stream, which notifies all listeners.
- **Observers (Subscriber)**: Each subscriber `listen()` to the agency's stream. They can filter by category before processing.
- **Broadcast streams**: Using `.broadcast()` allows multiple subscribers to listen to the same stream — the core of the one-to-many Observer pattern.
- **Unsubscription**: When `charlie.unsubscribe()` is called, `_subscription?.cancel()` stops receiving events. Subsequent news updates no longer reach Charlie.
- This pattern is the foundation of **BLoC** (Business Logic Component) in Flutter, where widgets observe state changes through streams.
