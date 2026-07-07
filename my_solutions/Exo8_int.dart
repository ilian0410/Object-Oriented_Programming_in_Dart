class JsonSerializable {
  String toJson() => '';
}

class Describable {
  String getLabel() => '';
  Map<String, String> getProperties() => {};
}

class User implements JsonSerializable, Describable {
  String username;
  String email;
  int age;
  User(this.username, this.email, this.age);
  @override
  String toJson() => '{"username":"alice","email":"a@b.com","age":25}';
  String getLabel() => "User: $username";
  Map<String, String> getProperties() => {
    "Username": username,
    "Email": email,
    "Age": age.toString(),
  };
}
void main() {
  var user = User('alice', 'a@b.com', 25);

  print(user.toJson());
  // {"username":"alice","email":"a@b.com","age":25}

  print(user.getLabel());
  // User: alice

  print(user.getProperties());
  // {Username: alice, Email: a@b.com, Age: 25}
}