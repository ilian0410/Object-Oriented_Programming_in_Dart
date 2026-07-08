class Container<T> {
  T? content;
  Container(this.content);
  T? getContent() => content;
  void setContent(T? value) {
    content = value;
  }

  bool isEmpty() => content == null;
}

void main() {
  var t = Container("Dart");
  var s = Container(42);
  var d = Container(3.14);
  print(t.getContent());
   print( s.getContent());
  print(d.getContent());

}
