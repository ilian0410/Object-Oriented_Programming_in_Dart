class Dog {

String name;
int age;
String breed;
Dog(this.name, this.age, this.breed);
void bark() {print('Woof! I\'m $name');}
String describe() {return '$name is a $age-year-old $breed.';}
  // TODO: add fields
  // TODO: add bark method
  // TODO: add describe method
}

void main() {
  var dog = Dog('Rex', 3, 'German Shepherd');
  dog.bark();
  print(dog.describe());
  // TODO: create Dog, set fields, call methods
}