# Design Patterns — Challenging

## Instructions

Implement the **Observer pattern** using Dart's `Stream` and `StreamController`.

### `NewsAgency` (Subject)
- Private `StreamController<String>` controller (use `.broadcast()`)
- Public `Stream<String>` getter `newsFeed`
- Method `void publishNews(String category, String headline)` — creates a formatted string `"[category] headline"` and adds it to the stream
- Method `void dispose()` — closes the controller

### `Subscriber` (Observer)
- Fields: `name` (String), `StreamSubscription?` subscription
- Method: `void subscribeTo(NewsAgency agency, {List<String>? categories})`
  - Listens to the agency's newsFeed
  - If `categories` is provided, filter only news that matches (news format is `"[category] headline"`)
  - When news arrives, calls `receive(news)`
- Method: `void receive(String news)` — prints `"$name received: $news"`
- Method: `void unsubscribe()` — cancels the subscription

### `NewsAgencyManager`
- Holds a list of `NewsAgency` objects
- Method: `NewsAgency createAgency(String name)`
- Method: `void publishBreakingNews(String headline)` — publishes to all agencies
- Method: `void disposeAll()` — disposes all agencies

### In `main()`:

1. Create two news agencies: `"Sports"` and `"Tech"`
2. Create three subscribers:
   - `"Alice"` — subscribes to Sports only
   - `"Bob"` — subscribes to Tech only
   - `"Charlie"` — subscribes to both
3. Publish some news from each agency
4. Unsubscribe Charlie from Tech
5. Publish more news
6. Dispose everything

## Expected Output (example)

```
Alice received: [Sports] Football World Cup starts
Charlie received: [Sports] Football World Cup starts
Bob received: [Tech] New Flutter 4.0 released
Charlie received: [Tech] New Flutter 4.0 released

(Charlie unsubscribes from Tech)

Alice received: [Sports] Local team wins championship
Charlie received: [Sports] Local team wins championship
Bob received: [Tech] Dart 5.0 announced
```
