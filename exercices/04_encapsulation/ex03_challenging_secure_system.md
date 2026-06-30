# Encapsulation — Challenging

## Instructions

Design a **secure document management system** using encapsulation principles.

### `Document` class
- Fields: `_id` (String, private), `_title` (String, private), `_content` (String, private), `_owner` (String, private), `_isEncrypted` (bool, private, default false)
- Constructor takes all fields except `_isEncrypted`
- Getters for all fields
- No setters — documents are immutable after creation except for encryption status
- Method `encrypt()`: sets `_isEncrypted = true` and replaces `_content` with a reversed version of the content (simple mock encryption)
- Method `decrypt()`: if `_isEncrypted` is true, reverses content back and sets `_isEncrypted = false`
- Method `read(String user)`: returns the content only if the user is the owner and the document is not encrypted; otherwise returns `"Access denied"` or `"Document is encrypted"`

### `DocumentManager` class
- Private field `_documents` (List of Document)
- Method `addDocument(Document doc)`: adds a document
- Method `getDocument(String id)`: returns the document by id (or null)
- Method `listDocuments(String user)`: returns a list of document titles owned by that user (without exposing content)

## Starter Code

```dart
class Document {
  String _id;
  String _title;
  String _content;
  String _owner;
  bool _isEncrypted = false;

  Document(this._id, this._title, this._content, this._owner);

  // TODO: add getters

  String read(String user) {
    // TODO: implement access control
  }

  void encrypt() {
    // TODO: mock encryption — reverse content
  }

  void decrypt() {
    // TODO: reverse encryption if encrypted
  }
}

class DocumentManager {
  List<Document> _documents = [];

  void addDocument(Document doc) => _documents.add(doc);

  Document? getDocument(String id) {
    // TODO: find and return document by id
  }

  List<String> listDocuments(String user) {
    // TODO: return titles of documents owned by user
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
