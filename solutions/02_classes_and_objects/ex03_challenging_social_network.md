## Solution

```dart
class User {
  String username;
  String email;
  String bio;
  List<Post> posts = [];

  User(this.username, this.email, this.bio);

  Post createPost(String content) {
    var post = Post(content, this);
    posts.add(post);
    return post;
  }

  void deletePost(Post post) {
    posts.remove(post);
    print('$username deleted a post');
  }

  void showTimeline() {
    print('$username\'s timeline:');
    for (var post in posts) {
      print('  "${post.content}" (${post.likes} likes)');
      for (var comment in post.comments) {
        print('    ${comment.author.username}: ${comment.text}');
      }
    }
  }
}

class Post {
  String content;
  User author;
  int likes = 0;
  List<Comment> comments = [];

  Post(this.content, this.author);

  void addComment(String text, User commenter) {
    comments.add(Comment(text, commenter));
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

### Explanation

- **Object graph**: `User` → owns a list of `Post` objects. Each `Post` → owns a list of `Comment` objects.
- **Circular reference**: `Post` holds an `author` reference back to `User`. This is common in domain models.
- **Encapsulation of behavior**: `createPost()` both creates and registers the post — the caller doesn't need to do both steps.
- The bonus `deletePost()` method ensures removal from the user's list is handled cleanly.
