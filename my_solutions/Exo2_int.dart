class Counter {
  int value = 0;

  void increment() {
    value++;
    print('Value is now $value');
  }

  void reset() {
    value = 0;
    print('Counter reset');
  }
}

void main() {

  // TODO: create one Counter with two references
   var c1 = Counter();
   var c2 = c1;


  // TODO: increment through c1 (3 times)
  c1.increment();
  
  c1.increment();
  
  c1.increment();
 

  // TODO: print value through c2
  print('c2 sees: ${c2.value}');

  // TODO: reset through c2
  c2.reset();

  // TODO: print value through c1
  print('c1 sees: ${c1.value}');

}
