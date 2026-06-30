## Solution

```dart
class Document {
  String _id;
  String _title;
  String _content;
  String _owner;
  bool _isEncrypted = false;

  Document(this._id, this._title, this._content, this._owner);

  String get id => _id;
  String get title => _title;
  String get owner => _owner;
  bool get isEncrypted => _isEncrypted;

  // No getter for _content — only accessible through read()
  // No setters at all — document state is controlled through methods

  String read(String user) {
    if (user != _owner) return 'Access denied';
    if (_isEncrypted) return 'Document is encrypted';
    return _content;
  }

  void encrypt() {
    if (!_isEncrypted) {
      _content = String.fromCharCodes(_content.runes.toList().reversed);
      _isEncrypted = true;
      print('Document $_id encrypted');
    }
  }

  void decrypt() {
    if (_isEncrypted) {
      _content = String.fromCharCodes(_content.runes.toList().reversed);
      _isEncrypted = false;
      print('Document $_id decrypted');
    }
  }
}

class DocumentManager {
  List<Document> _documents = [];

  void addDocument(Document doc) => _documents.add(doc);

  Document? getDocument(String id) {
    for (var doc in _documents) {
      if (doc.id == id) return doc;
    }
    return null;
  }

  List<String> listDocuments(String user) {
    var titles = <String>[];
    for (var doc in _documents) {
      if (doc.owner == user) titles.add(doc.title);
    }
    return titles;
  }
}

void main() {
  var manager = DocumentManager();

  var doc1 = Document('D001', 'Report', 'Quarterly earnings are up', 'Alice');
  var doc2 = Document('D002', 'Notes', 'Meeting at 3pm', 'Bob');
  manager.addDocument(doc1);
  manager.addDocument(doc2);

  doc1.encrypt();

  print(doc1.read('Alice')); // Document is encrypted
  print(doc1.read('Bob'));   // Access denied
  doc1.decrypt();
  print(doc1.read('Alice')); // Quarterly earnings are up

  print(manager.listDocuments('Alice')); // [Report]
}
```

### Explanation

- **Full encapsulation**: All fields are private. No direct access to `_content` — it's only accessible through the controlled `read()` method.
- **Access control**: `read()` enforces two layers — ownership check and encryption check.
- **Mock encryption**: A simple character reversal demonstrates how internal state can be transformed while keeping the interface unchanged.
- **DocumentManager** further encapsulates the document collection, exposing only list of titles (not content) for privacy.
- This design prevents unauthorized access and ensures documents cannot be corrupted from outside.
