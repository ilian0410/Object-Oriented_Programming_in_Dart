mixin Fly {
  void fly() => print('$runtimeType soars through the sky');
}

mixin Swim {
  void swim() => print('$runtimeType glides through water');
}

mixin Walk {
  void walk() => print('$runtimeType walks on land');
}

mixin Vocalize {
  void speak(String sound) => print('$runtimeType says: $sound');
}

class Parrot with Fly, Walk, Vocalize {
  String name;
  Parrot(this.name);
  void sayHello() => speak("Hello!");
}
class Duck with Fly, Swim, Walk, Vocalize {
  String name;
  Duck(this.name);
  void sayQuack() => speak("Quack!");
}
class Shark with Swim {
  String name;
  Shark(this.name); 
  void swimInWater() => swim();
}
class Frog with Swim, Walk, Vocalize {
  String name;
  Frog(this.name);
  void sayRibbit() => speak("Ribbit!");
}
void main() {
  var parrot = Parrot("Faaaaaaahhhhhh");
  parrot.fly();
  parrot.walk();  
  parrot.sayHello();
  var duck = Duck("bruuuhh");
  duck.fly();
  duck.swim();
  duck.walk();
  duck.sayQuack();
  var shark = Shark("Neo la frite");
  shark.swimInWater();
  var frog = Frog("le bandit des annees 80");
  frog.swim();
  frog.walk();
  frog.sayRibbit();
}