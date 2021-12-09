// class User {
//   User(this.name);
//   final String name;
//   // Error: instance member _calculateSecret can't be accessed in an initializer.
//   final int _secretNumber = _calculateSecret();
//
//   int _calculateSecret() {
//     return name.length + 42;
//   }
// }

// 1st Solution: use late keyword
// Dart doesn’t initialize the variable right away.
// It only initializes it when you access it the first
// time. This is also known as Lazy Initialization.
class User {
  User(this.name);
  final String name;
  late final int _secretNumber = _calculateSecret();

  int _calculateSecret() {
    return name.length + 42;
  }

  void printSecret() => print(_secretNumber);
}

// 2nd Solution: initialize a field variable in the constructor body
class User1 {
  // Initializing a final variable in the constructor body wouldn’t
  // have been allowed if it weren’t marked as late.
  User1(this.name) {
    _secretNumber = _calculateSecret();
  }

  final String name;
  late final int _secretNumber;

  int _calculateSecret() {
    return name.length + 42;
  }

  void printSecret() => print(_secretNumber);
}

//
class User2 {
  // you’re promising Dart that you’ll initialize the field before it's ever used
  late String name;
}

// Benefits of being lazy
class SomeClass {
  late String? value = doHeavyCalculation();
  String? doHeavyCalculation() {
    // do some very heavy calculation
    // The method doHeavyCalculation is only run after
    // you access value the first time. And if you never
    // access it, you never do the work!
  }
}

void main() {
  // will result in an error at run-time: LateInitializationError: Field 'name' has not been initialized.
  // we broke our promise
  final user = User2();
  print(user.name);
}
