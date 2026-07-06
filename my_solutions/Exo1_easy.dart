
class Student {
  String name;
  int age;
  
Student(this.name, this.age);
  void printInfo() {
    print('$name is $age years old.');
  }
}
void main() {
  var student = Student('Ali', 25);
  student.printInfo();
}