# Classes and Objects — Challenging

## Instructions

Design a mini social network system with three classes: `User`, `Post`, and `Comment`.

### User class
- Fields: `username`, `email`, `bio`
- A list of `Post` objects owned by the user
- Method `createPost(content)` — creates a new `Post` and adds it to the user's list
- Method `showTimeline()` — prints all posts by the user, each followed by its comments

### Post class
- Fields: `content`, `author` (User), `likes`, `comments` (list of Comment objects)
- Method `addComment(text, commenter)` — creates a Comment and adds it

### Comment class
- Fields: `text`, `author` (User)

## Starter Code

```dart
class User {
  String username;
  String email;
  String bio;
  List<Post> posts = [];

  User(this.username, this.email, this.bio);

  Post createPost(String content) {
    // TODO: create a Post, add it to posts list, return it
  }

  void showTimeline() {
    // TODO: print each post with its comments
  }
}

class Post {
  String content;
  User author;
  int likes = 0;
  List<Comment> comments = [];

  Post(this.content, this.author);

  void addComment(String text, User commenter) {
    // TODO: create Comment, add to comments list
  }

  void like() => likes++;
}

class Comment {
  String text;
  User author;

  Comment(this.text, this.author);
}

void main() {
  var alice = User('alice', 'alice@mail.com', 'Flutter dev');
  var bob = User('bob', 'bob@mail.com', 'Dart lover');

  var post = alice.createPost('Hello world!');
  post.addComment('Welcome!', bob);
  post.addComment('Great post!', alice);
  post.like();
  post.like();
  post.like();

  alice.showTimeline();
}
```

## Expected Output

```
alice's timeline:
  "Hello world!" (3 likes)
    bob: Welcome!
    alice: Great post!
```

## Bonus

Add a `deletePost()` method to `User` that removes a post and ensures all references to it are cleaned up.
