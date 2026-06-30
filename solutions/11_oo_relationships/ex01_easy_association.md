## Solution

```dart
class Professor {
  String name;
  String department;

  Professor(this.name, this.department);

  void teaches() => print('Professor $name teaches in $department');
}

class Student {
  String name;
  Professor? advisor;

  Student(this.name);

  void setAdvisor(Professor p) => advisor = p;

  void displayInfo() {
    print('Student: $name');
    if (advisor != null) {
      print('  Advisor: Professor ${advisor!.name} (${advisor!.department})');
    } else {
      print('  No advisor assigned');
    }
  }
}

void main() {
  var prof = Professor('Smith', 'Computer Science');

  var alice = Student('Alice');
  var bob = Student('Bob');

  alice.setAdvisor(prof);

  alice.displayInfo();
  bob.displayInfo();
}
```

### Explanation

- **Association**: The `Student` class holds an optional reference to a `Professor` via the `advisor` field. Both objects are independent — neither owns the other.
- The `Professor` exists independently of any `Student`. If all students are removed, the professor still exists.
- This is a **unidirectional association** (student knows about professor, but professor doesn't know about student). A bidirectional association would have professor also holding a list of students.
