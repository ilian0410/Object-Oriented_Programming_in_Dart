class Pair<A, B> {
  A first;
  B second;
  Pair(this.first, this.second);
  void display() => print("$first: $second");

 Pair<B, A> swap() {
  return Pair<B, A>(second, first);
}
}
class ListUtils {
  static List<T> repeat<T>(T item, int count) {
  List<T> result = [];
  for (int i = 0; i < count; i++) {
    result.add(item);
  }
  return result;
}

  static T? lastOrNull<T>(List<T> list) {
    if (list.isEmpty) {
      return null;
    }
    return list.last;
  }

  static List<T> merge<T>(List<T> list1, List<T> list2) {
    return [...list1, ...list2];
  }
}

void main() {
  var p1 = Pair<int, String>(1, 'one');
  p1.display(); // 1: one

  var p2 = p1.swap();
  p2.display(); // one: 1

  print(ListUtils.repeat('Hi', 3)); // [Hi, Hi, Hi]
  print(ListUtils.lastOrNull([1, 2, 3])); // 3
  print(ListUtils.lastOrNull<String>([])); // null
  print(ListUtils.merge([1, 2], [3, 4])); // [1, 2, 3, 4]
}
