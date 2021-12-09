import 'package:characters/characters.dart';
import 'dart:math';
import 'user4.dart';
import 'user5.dart';
import 'user6.dart';
import 'user7.dart';

// ------------------------------ Data Structures ------------------------------
class User {
  // short-form constructor
  // unnamed constructor; there is always one (user or compiler provided)
  User(this.id, this.name);

  // same as long-form constructor:
  // User(int id, String name) {
  //   this.id = id;
  //   this.name = name;
  // }

  // named constructor (there can be many)
  User.anonymous() {
    id = 0;
    name = 'anonymous';
  }

  // we need to initialize members with values
  int id = 0;
  String name = '';
}

class User1 {
  // unnamed constructor
  User1(this.id, this.name);

  // named constructor; forwarding/redirecting constructor
  User1.anonymous1() : this(0, 'anonymous'); // initializer expression
  User1.special() : this(0, 'special');

  // no need for initialization any more; values will be set in constructors
  int id;
  String name;
}

class User2 {
  // unnamed constructor
  User2(this.id, this.name);

  // named constructor
  // Forwarding (redirecting) constructor
  User2.anonymous1() : this(0, 'anonymous');

  int id;
  String name;

  // methods
  String toJson() {
    return '{"id":$id,"name":"$name"}';
  }

  // defined in (root) class Object
  @override
  String toString() {
    return 'User(id: $id, name: $name)';
  }
}

class User3 {
  // unnamed constructor with named & defaulted arguments
  User3({this.id = 0, this.name = 'anonymous'});

  // named constructor
  // Forwarding (redirecting) constructor
  User3.anonymous1() : this(id: 0, name: 'anonymous');

  int id;
  String name;

  // methods
  String toJson() {
    return '{"id":$id,"name":"$name"}';
  }

  // defined in (root) class Object
  @override
  String toString() {
    return 'User(id: $id, name: $name)';
  }
}

// In summary, constructors can be:
// - forwarding or non-forwarding
// - named or unnamed
// - generative or factory
// - constant or not constant
//
// e.g.
// const User(this.id, this.name);
// is a
// - non-forwarding
// - unnamed
// - generative
// - const
// constructor

class Email {
  var _address = '';
  // getter
  // ignore: unnecessary_getters_setters
  String get value => _address;
  // setter
  set value(String address) => _address = address;
}

// static/class variables and methods
class SomeClass {
  static int myProperty = 42;
  static void myMethod() => print('Hello, Dart!');
}

class MySingleton {
  MySingleton._(); // private named constructor; you can't create an instance from outside the class
  // 'static' allows access instance from outside through the class
  static final MySingleton instance = MySingleton._();

  void printMe() => print("MySingleton");
}

class MyFactorySingleton {
  MyFactorySingleton._();
  static final MyFactorySingleton _instance = MyFactorySingleton._();
  // factory constructor can return existing instances
  factory MyFactorySingleton() => _instance;

  void printMe() => print("MyFactorySingleton");
}

enum Weather { sunny, snowy, cloudy, rainy }

enum Grade { A, B, C, D, F }

class Person {
  Person(this.givenName, this.surname);
  String givenName;
  String surname;
  String get fullName => '$givenName $surname';
  @override
  String toString() => fullName;
}

class Student extends Person {
  Student(String givenName, String surname) : super(givenName, surname);
  var grades = <Grade>[];
  // Overriding parent methods
  @override
  String get fullName => '$surname, $givenName';
}

// Multi-level hierarchy
class SchoolBandMember extends Student {
  SchoolBandMember(String givenName, String surname)
      : super(givenName, surname);
  static const minimumPracticeTime = 2;
}

// Sibling classes
class StudentAthlete extends Student {
  StudentAthlete(String givenName, String surname) : super(givenName, surname);
  bool get isEligible => grades.every((grade) => grade != Grade.F);
}

// Dart	only allows single-inheritance
// Class hierarchy:
//             Object
//               |
//             Person
//               |
//             Student
//               |
//      -------------------
//      |                 |
// SchoolBandMember StudentAthlete

// Calling super last in an initializer list
class SomeParent {
  void doSomeWork() {
    print('parent working');
  }
}

// In this example, calling super() is actually unnecessary,
// because Dart always calls the default constructor for the
// super class if there are no arguments to pass.
class SomeChild extends SomeParent {
  SomeChild(double height)
      : assert(height != 0),
        _height = height,
        super(); // calling super last
  final double _height;
  @override
  void doSomeWork() {
    super.doSomeWork(); // Calling super from an overridden method
    print('child doing some other work');
  }

  void printSomeChild() => print(_height);
}

// Abstract classes
abstract class Animal {
  bool isAlive = true; // concrete field
  void eat(); // abstract methods; subclasses must implement
  void move();
  @override
  String toString() {
    // concrete method
    return "I'm a $runtimeType";
  }
}

// Concrete subclass
class Platypus extends Animal {
  @override
  void eat() {
    print('Munch munch');
  }

  @override
  void move() {
    print('Glide glide');
  }

  void layEggs() {
    print('Plop plop');
  }
}

// Creating an interface (code against interfaces, not implementations)

// There’s no interface keyword in Dart. Instead, you can use any class as an interface
// repository is a common term to call an interface
abstract class DataRepository {
  // neat trick: FakeWebServer is a subclass of DataRepository
  // factory constructor can return values
  // Alternatives: service locators (e.g. get_it package), dependency injection
  factory DataRepository() => FakeWebServer();
  double? fetchTemperature(String city); // is nullable bc city could be invalid
}

// Implementing the interface
class FakeWebServer implements DataRepository {
  @override
  double? fetchTemperature(String city) {
    return 42.0;
  }
}

// What is the difference between extending and implementing?
// class SomeClass extends AnotherClass {}
// class SomeClass implements AnotherClass {}
// When you extend AnotherClass, SomeClass has access to any logic or variables in AnotherClass.
// When SomeClass implements AnotherClass, SomeClass must provide its own version of all methods and variables in AnotherClass.

// The implements keyword tells Dart that you only want the
// field types and method signatures. You’ll provide the
// concrete implementation details for everything yourself.
// How you implement it is up to you.

// A class can implement several interfaces.
// class MyClass implements OneClass, AnotherClass {} // OK

// Mixins

// A mixin is a class containing methods that can be used by other classes without a need to inherit from it.

// The mixin keyword indicates that these classes can only be used as mixins.
mixin EggLayer {
  void layEggs() {
    print('Plop plop');
  }
}
mixin Flyer {
  void fly() {
    print('Swoosh swoosh');
  }
}

abstract class Bird {
  void fly();
  void layEggs();
}

// with keyword identifies the mixins
class Robin extends Bird with EggLayer, Flyer {}

// mixins can be used in different classes
class Platypus1 extends Animal with EggLayer {
  @override
  void eat() {
    print('Munch munch');
  }

  @override
  void move() {
    print('Glide glide');
  }
}

// Extension methods (add functionality to existing classes)

// you could give the extension a name: extension ExtensionName on String ...
// we use an adjective bc extension won't mutate the original string
extension on String {
  String get encoded {
    return _code(1);
  }

  String get decoded {
    return _code(-1);
  }

  String _code(int step) {
    final output = StringBuffer();
    for (final codePoint in runes) {
      output.writeCharCode(codePoint + step);
    }
    return output.toString();
  }
}

extension on int {
  int get cubed => this * this * this;
}

enum ProgrammingLanguage { dart, swift, javaScript }

extension on ProgrammingLanguage {
  bool get isStronglyTyped {
    switch (this) {
      case ProgrammingLanguage.dart:
      case ProgrammingLanguage.swift:
        return true;
      case ProgrammingLanguage.javaScript:
        return false;
      default:
        throw Exception('Unknown Programming Language $this');
    }
  }
}

// ------------------------------ Main ------------------------------
void main() {
  // Checking at runtime
  num myNumber = 3.14;
  print(myNumber is double); // true
  print(myNumber is int); // false
  print(myNumber.runtimeType); // double

  dynamic myVariable = 42;
  myVariable = 'hello'; // OK
  print(myVariable);

  // Dart is also optionally-typed
  var myVariable1; // uninitialized var defaults to dynamic
  myVariable1 = 42; // OK
  myVariable1 = 'hello'; // OK
  print(myVariable1);

  Object? myVar; // makes your intent obvious
  myVar = 234.42;
  myVar = 'Hi there!';
  print(myVar);

  // type conversion (using 'to' methods)
  var decimal = 12.5;
  var integer = decimal.toInt();
  print(integer); // 12

  // casting down
  num someNumber = 3;
  final someInt = someNumber as int;
  print(someInt.isEven); // false

  // Strings

  // Dart doesn't have char type
  const letter = 'a'; // 'letter' is a String
  print(letter);
  const dart = '🎯 ';
  print(dart.codeUnits); // [55356, 57263, 32]
  const family = ' ';
  print(family.characters.length); // 1

  // you can use single or double quotes - they are equal
  print('I like cats');
  print("I like cats");
  print("my cat's food"); // easier than ,,,
  print('my cat\'s food'); // escaping

  // concatenation
  var fst = 'Hans';
  var lst = 'Schmid';
  print(fst + ' ' + lst);
  print('Hello'
      ' again'
      ' my name is Hans.'); // for string literals use adjacent strings

  const bigString = '''
This is
a very
big string!
''';
  print(bigString);

  // const = compile-time constant
  // final = run-time constant
  const oneThird = 1 / 3;
  // string interpolation
  final sentence = 'One third is ${oneThird.toStringAsFixed(5)}';
  print(sentence);
  const rawString = r'My name is \n $hans.';
  print(rawString);
  print('I \u2764 Dart\u0021');
  print('I love \u{1F3AF}');

  // StringBuffers are mutable, Strings are immutable
  final message = StringBuffer();
  message.writeln("Hi");
  message.writeln("there!");
  message.writeln("My name is Hans.");
  print(message.toString());

  // Comparisons & Control Flow

  // comparison and logical operators same as in C

  // operator precedence same as in C
  // !
  // >= > <= <
  // == !=
  // &&
  // ||

  print(3 > 4 && 1 < 2 || 1 < 4);
  print(1 < 4 || 3 > 4 && 1 < 2);
  print("dog == cat ?");
  const guess = 'dog';
  const dogEqualsCat = guess == 'cat';
  print(dogEqualsCat);
  const animal = 'Fox';
  if (animal == 'Cat' || animal == 'Dog') {
    print('Animal is a house pet.');
  } else {
    print('Animal is not a house pet.');
  }

  const trafficLight = 'yellow';
  String command = '';
  if (trafficLight == 'red') {
    command = 'Stop';
  } else if (trafficLight == 'yellow') {
    command = 'Slow down';
  } else if (trafficLight == 'green') {
    command = 'Go';
  } else {
    command = 'INVALID COLOR!';
  }
  print(command);

  const global = 'Hello, world';
  const local = 'Hello, main';
  if (2 > 1) {
    const insideIf = 'Hello, anybody?';
    print(global);
    print(local);
    print(insideIf);
  }
  print(global);
  print(local);
  // print(insideIf); // Not allowed!

  // ternary conditional operator same as in C
  const score = 83;
  const scoreMessage = (score >= 60) ? 'You passed' : 'You failed';
  print(scoreMessage);

  // switch statement mostly same as in C
  const number = 3;
  // can be int, String or compile-time constant
  switch (number) {
    // Only equality (==) checking is allowed
    case 0:
      print('zero');
      break;
    case 1:
      print('one');
      break;
    case 2:
      print('two');
      break;
    case 3:
      print('three');
      break;
    case 4:
      print('four');
      break;
    default:
      print('something else');
  }

  // switching on strings
  const weather = 'cloudy';
  switch (weather) {
    case 'sunny':
      print('Put on sunscreen.');
      break;
    case 'snowy':
      print('Get your skis.');
      break;
    case 'cloudy':
    case 'rainy':
      print('Bring an umbrella.');
      break;
    default:
      print("I'm not familiar with that weather.");
  }

  // switching on enums (compile-time constants)
  const weatherToday = Weather.cloudy;
  switch (weatherToday) {
    case Weather.sunny:
      print('Put on sunscreen.');
      break;
    case Weather.snowy:
      print('Get your skis.');
      break;
    case Weather.cloudy:
    case Weather.rainy:
      print('Bring an umbrella.');
      break;
  }
  print(weatherToday);
  print(weatherToday.index);

  print("---------- sums ----------");

  // While & Do-while loops

  // same as in C
  var sum = 1;
  while (sum < 10) {
    sum += 4;
    print(sum);
  }

  sum = 1;
  do {
    sum += 4;
    print(sum);
  } while (sum < 10);

  sum = 1;
  while (true) {
    sum += 4;
    print(sum);
    if (sum > 10) {
      break;
    }
  }

  final random = Random();
  while (random.nextInt(6) + 1 != 6) {
    print('Not a six!');
  }
  print('Finally, you got a six!');

  for (var i = 0; i < 5; i++) {
    print(i);
  }

  // For loops (come in three flavors)

  // C-style for loop
  for (var i = 0; i < 5; i++) {
    if (i == 2) {
      continue;
    }
    print(i);
  }

  // for-in loops
  const myString = 'I ❤ Dart';
  for (var codePoint in myString.runes) {
    print(String.fromCharCode(codePoint));
  }

  const myNumbers = [1, 2, 3];
  for (var number in myNumbers) {
    print(number);
  }

  // for-each loops (for side effects)
  myNumbers.forEach(print);

  // Functions

  // syntax same as in C
  String fullName(String first, String last, [String? title]) {
    if (title != null) {
      return '$title $first $last';
    } else {
      return '$first $last';
    }
  }

  print(fullName('Hans', 'Schmid'));
  print(fullName('Albert', 'Einstein', 'Professor'));

  // arrow functions for one-liners
  int add(int a, int b) {
    return a + b;
  }

  // same as
  int add_(int a, int b) => a + b;

  print(add(1, 2));
  print(add_(1, 2));

  // Using multiple parameters

  // 'standard' function
  bool withinTolerance0(int value, int min, int max) =>
      min <= value && value <= max;

  // optional & defaulted args
  bool withinTolerance(int value, [int min = 0, int max = 10]) =>
      min <= value && value <= max;

  // optional & named & defaulted args
  bool withinTolerance1(int value, {int min = 0, int max = 10}) =>
      min <= value && value <= max;

  // forcing optional arg to be required
  // 'value' is required and must be named
  bool withinTolerance2({required int value, int min = 0, int max = 10}) =>
      min <= value && value <= max;

  print(withinTolerance0(5, 7, 9)); // true

  print(withinTolerance(5)); // true
  print(withinTolerance(15)); // false
  print(withinTolerance(9, 7, 11)); // true

  print(withinTolerance1(9, min: 7, max: 11));
  print(withinTolerance1(9, max: 11, min: 7));
  print(withinTolerance1(5));
  print(withinTolerance1(15));
  print(withinTolerance1(5, min: 7));
  print(withinTolerance1(15, max: 20));

  // print(withinTolerance2());
  print(withinTolerance2(value: 5)); // true

  // type inference for functions (return value and params)
  // you can, but you shouldn't
  compliment(number) {
    return '$number is a very nice number.';
  }

  // same as
  String compliment_(dynamic number) {
    return '$number is a very nice number.';
  }

  print(compliment(555));
  print(compliment_(555));

  // Anonymous functions (Dart is a functional programming language)

  // anonymous function (RHS)
  Function multiply = (int a, int b) => a * b;
  print(multiply(2, 3));

  Function namedFunction() => () => print('hello');

  Function myPrinter = namedFunction();
  myPrinter();

  Function applyMultiplier(num multiplier) {
    return (num value) {
      // works with double and int
      return value * multiplier;
    };
  }

  final triple = applyMultiplier(3);

  print(triple(6));
  print(triple(14.0));

  // closures
  Function countingFunction() {
    int counter = 0;
    int incrementCounter() {
      counter += 1;
      return counter;
    }

    return incrementCounter;
  }

  final counter1 = countingFunction();
  final counter2 = countingFunction();
  print(counter1()); // 1
  print(counter2()); // 1
  print(counter1()); // 2
  print(counter1()); // 3
  print(counter2()); // 2

  // Object-Orientation

  // everything is an Object, no primitive types
  'abc'.runes.forEach(print);
  'abc'.codeUnits.forEach(print);
  3.isOdd;

  //  cascade operator (..) allows chaining multiple assignments on the same object
  final user1 = User3()
    ..name = 'Hans'
    ..id = 48;
  print(user1);

  final user = User(42, 'Hans');
  print(user.id);

  final anonymousUser = User.anonymous();
  print(anonymousUser.name);

  final vicki = User4(id: 24, name: 'Vicki');
  // if we had Class4 definition in this file, this would be possible:
  // vicki._name = 'Nefarious Hacker';
  print(vicki);

  final jb = User4(id: -1, name: 'JB Lorenzo');
  print(jb);

  // user5 is a compile-time const!
  const user5 = User5(id: 42, name: 'Hans');
  // you could call User.anonymous() a thousand times but it will be created only once!!!
  // Flutter uses this pattern frequently with its const widget classes in the user interface
  // of your app. Since Flutter knows that the const widgets are immutable, it doesn’t have
  // to waste time recalculating and drawing the layout when it finds these widgets.
  const anonymousUser5 = User5.anonymous();
  print(user5);
  print(anonymousUser5);

  final map = {'id': 10, 'name': 'Manda'};
  User6 manda = User6.fromJson(map); // using factory constructor
  print(manda);
  manda = User6.fromJson1(map); // using class method
  print(manda);
  const hans1 = User7(id: 4200, name: 'Hans');
  print(hans1.id);
  print(hans1.name);
  print(hans1.isBigId);

  final email = Email();
  email.value = 'hans@example.com'; // using setter
  final emailString = email.value; // using getter
  print(emailString);

  final value = SomeClass.myProperty;
  SomeClass.myMethod();
  print(value);

  final mySingleton = MySingleton.instance;
  mySingleton.printMe();

  // singleton looks like a normal object
  final myFactorySingleton = MyFactorySingleton();
  myFactorySingleton.printMe();

  // Nullability

  // A value of type 'Null' can't be assigned to a variable of type 'int'.
  // int postalCode = null;

  // object null is the sole instance of the Null class
  // Nullable types end with a question mark (?)
  int? myInt1;
  double? myDouble1;
  bool? myBool1;
  String? myString1;
  User? myUser1;

  print(myInt1); // null
  print(myDouble1); // null
  print(myBool1); // null
  print(myString1); // null
  print(myUser1); // null

  // The non-nullable type is a subtype of its nullable
  // form. For example, String is a subtype of String?
  // since String? can be a String.

  // Dart now makes it impossible to forget about null values
  String? name;
  // Error: Property 'length' cannot be accessed on 'String?'
  // because it is potentially null. Try accessing using ?. instead.
  // print(name.length);
  print(name);

  // Dart (actually the Dart analyzer) knows name1 is not null; no error
  // Type Promotion: String? -> String
  String? name1 = 'Hans';
  print(name1.length);

  // works also for more complicated code
  // Dart performs so-called flow-analysis
  bool isPositive(int? anInteger) {
    if (anInteger == null) {
      return false;
    }
    return !anInteger.isNegative; // anInteger will not be null
  }

  print(isPositive(5));
  print(isPositive(null)); // no error

  // Null-aware operators

  // 1.) ??   | if-null operator
  // 2.) ??=  | null-aware assignment operator
  // 3.) ?.   | null-aware access operator
  // 4.) ?.   | null-aware method invocation operator
  // 5.) !    | null assertion operator (bang operator)
  // 6.) ?..  | null-aware cascade operator
  // 7.) ?[]  | null-aware index operator
  // 8.) ...? | null-aware spread operator

  // 1.) if-null operator
  String? message1; // message1 = null
  final text = message1 ?? 'Error';
  print(text); // 'Error'

  // 2.) null-aware assignment operator
  double? fontSize;
  fontSize ??= 20.0;
  print(fontSize); // 20.0

  // 3.) null-aware access operator
  int? age;
  print(age?.isNegative); // null

  // 4.) null-aware method invocation operator
  print(age?.toDouble()); // null

  // 5.) null assertion operator (bang operator)
  bool? isBeautiful(String? item) {
    if (item == 'flower') {
      return true;
    } else if (item == 'garbage') {
      return false;
    }
    return null;
  }
  // Error: A value of type 'bool?' can't be assigned to a variable
  // of type 'bool' because 'bool?' is nullable and 'bool' isn't.
  // bool flowerIsBeautiful = isBeautiful('flower');

  // But we know FOR A FACT (otherwise program will crash) that 'flower' is beautiful
  bool flowerIsBeautiful = isBeautiful('flower')!;
  print(flowerIsBeautiful); // true

  // downcast would also work as bool is a subtype of bool?
  flowerIsBeautiful = isBeautiful('flower') as bool;
  print(flowerIsBeautiful); // true

  // this is safer
  flowerIsBeautiful = isBeautiful('flower') ?? true;

  // 6.) null-aware cascade operator
  User? user2;
  user2
    ?..name = 'Ray'
    ..id = 42;

  // 7.) null-aware index operator
  List<int>? myList = [1, 2, 3];
  myList = null;
  int? myItem = myList?[2];
  print(myItem); // null

  // 8.) null-aware spread operator
  // for later (Ch. 8)

  // Look at bin/text_widget.dart regarding type promotion for non-local variables

  // Look at bin/late.dart

  // Collections

  // list literals
  var desserts = ['cookies', 'cupcakes', 'donuts', 'pie'];
  print(desserts); // [cookies, cupcakes, donuts, pie]
  var snacks = []; // loses type safety; snacks = List<dynamic>
  List<String> snacks1 = []; // keep type safety
  var snacks2 = <String>[]; // alternative
  print(snacks); // []
  print(snacks1); // []
  print(snacks2); // []

  // Accessing elements
  final secondElement = desserts[1];
  print(secondElement); // zero-based: cupcakes
  final index = desserts.indexOf('pie');
  final value1 = desserts[index];
  print(index); // 3
  print(value1); // pie

  // Assigning values to list elements
  desserts[1] = 'cake';
  print(desserts); // [cookies, cake, donuts, pie]

  // Adding elements to a list
  desserts.add('brownies');
  print(desserts); // [cookies, cake, donuts, pie, brownies]

  // Removing elements from a list
  desserts.remove('cake');
  print(desserts); // [cookies, donuts, pie, brownies]

  // content of desserts1 can be changed; still pointing to same list
  final desserts1 = ['cookies', 'cupcakes', 'donuts', 'pie'];
  desserts1.remove('cookies'); // OK
  desserts1.remove('cupcakes'); // OK
  desserts1.add('ice cream'); // OK

  final desserts2 = ['cookies', 'cupcakes', 'donuts', 'pie'];
  // desserts2 = []; // not allowed; final desserts2 can only be set once
  // desserts2 = ['cake', 'ice cream']; // not allowed
  // desserts2 = dessert1; // not allowed
  print(desserts2);

  // Creating deeply immutable lists
  const desserts3 = ['cookies', 'cupcakes', 'donuts', 'pie'];
  // Runtime errors! Unsupported operation: Cannot add to an unmodifiable list
  // desserts3.add('brownie'); // not allowed
  // desserts3.remove('pie'); // not allowed
  // desserts3[0] = 'fudge'; // not allowed
  print(desserts3);

  // in case you aren’t able to use const for the variable itself, you can
  // still make the value deeply immutable by adding the optional
  // const keyword before the value
  final desserts4 = const ['cookies', 'cupcakes', 'donuts', 'pie'];
  print(desserts4);

  // if you want an immutable list but you won’t know
  // the element values until runtime, then you can create one
  // with the List.unmodifiable named constructor
  final modifiableList = [DateTime.now(), DateTime.now()];
  final unmodifiableList = List.unmodifiable(modifiableList);
  print(unmodifiableList);

  // List properties
  const drinks = ['water', 'milk', 'juice', 'soda'];
  print(drinks.first); // water
  print(drinks.last); // soda
  print(drinks.isEmpty); // false
  print(drinks.isNotEmpty); // true

  // Looping over the elements of a list
  for (var dessert in desserts) {
    print(dessert);
  }
  desserts.forEach(print); // same as we are dealing with side-effects only

  // spread operator, collection-if and collection-for
  // They make it easier for Flutter developers to compose user
  // interface layouts completely in code, without the need for a
  // separate markup language

  // Spread operator
  const pastries = ['cookies', 'croissants'];
  const candy = ['Junior Mints', 'Twizzlers', 'M&Ms'];
  const desserts5 = ['donuts', ...pastries, ...candy];
  // [donuts, cookies, croissants, Junior Mints, Twizzlers, M&Ms]
  print(desserts5);

  // null spread operator (...?)
  List<String>? coffees;
  final hotDrinks = ['milk tea', ...?coffees];
  print(hotDrinks); // [milk tea]

  // Collection-if
  const noPeanutAllergy = true;
  const candy1 = [
    'Junior Mints',
    'Twizzlers',
    if (noPeanutAllergy) 'Reeses',
  ];
  print(candy1); // [Junior Mints, Twizzlers, Reeses]

  // collection-for
  const deserts6 = ['gobi', 'sahara', 'arctic'];
  var bigDeserts = [
    'ARABIAN',
    for (var desert in deserts6)
      desert.toUpperCase(), // no braces as in a 'standard' for-in loop
  ];
  print(bigDeserts); // [ARABIAN, GOBI, SAHARA, ARCTIC]

  // Sets

  // Creating a set
  final Set<int> someSet = {};
  final someSet_ = <int>{}; // same, but shorter
  print(someSet); // {}
  print(someSet_); // {}

  // set literal
  final anotherSet = {1, 2, 3}; // anotherSet = Set<int>
  print(anotherSet); // {1, 2, 3}
  anotherSet.add(1);
  print(anotherSet); // {1, 2, 3}
  print(anotherSet.contains(1)); // true
  print(anotherSet.contains(99)); // false
  anotherSet.remove(1);
  print(anotherSet); // {2, 3}
  anotherSet.addAll([1, 2, 3, 4, 5]);
  print(anotherSet); // {2, 3, 1, 4, 5}

  // Intersections
  final setA = {8, 2, 3, 1, 4};
  final setB = {1, 6, 5, 4};
  final intersection = setA.intersection(setB);
  print(intersection); // {1, 4}

  // Unions
  final union = setA.union(setB);
  print(union); // {8, 2, 3, 1, 4, 6, 5}

  // works also with sets: collection if, collection for, for-in loops, forEach loops, spread operators

  // Maps

  // Creating an empty map
  final Map<String, int> emptyMap = {};
  final emptyMap_ = <String, int>{}; // same, but shorter
  print(emptyMap); // {}
  print(emptyMap_); // {}

  // sets and maps use curly braces
  // what is the type of emptySomething? -> Map<dynamic, dynamic>, maps came before sets in Dart
  final emptySomething = {};
  print(emptySomething); // {}
  print(emptySomething.length); // 0

  // Initializing a Map with values
  final inventory = {
    'cakes': 20,
    'pies': 14,
    'donuts': 37,
    'cookies': 141,
  };
  print(inventory); // {cakes: 20, pies: 14, donuts: 37, cookies: 141}

  final digitToWord = {
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
  };
  print(digitToWord); // {1: one, 2: two, 3: three, 4: four}

  // keys must be unique; two keys named gold
  // final treasureMap = {
  //   'garbage': 'in the dumpster',
  //   'glasses': 'on your head',
  //   'gold': 'in the cave',
  //   'gold': 'under your mattress',
  // };
  final treasureMap = {
    'garbage': ['in the dumpster'],
    'glasses': ['on your head'],
    'gold': ['in the cave', 'under your mattress'],
  };
  print(
      treasureMap); // {garbage: [in the dumpster], glasses: [on your head], gold: [in the cave, under your mattress]}

  // Accessing elements from a map
  final numberOfCakes =
      inventory['cakes']; // numberOfCakes = int? (it's a nullable)
  print(numberOfCakes?.isEven); // true

  // Adding elements to a map
  inventory['brownies'] = 3;
  print(
      inventory); // {cakes: 20, pies: 14, donuts: 37, cookies: 141, brownies: 3}

  // Updating an element
  inventory['cakes'] = 1;
  print(
      inventory); // {cakes: 1, pies: 14, donuts: 37, cookies: 141, brownies: 3}

  // Removing elements from a map
  inventory.remove('cookies');
  print(inventory); // {cakes: 1, pies: 14, donuts: 37, brownies: 3}

  // Map properties
  print(inventory.isEmpty); // false
  print(inventory.isNotEmpty); // true
  print(inventory.length); // 4
  final keys = inventory.keys; // keys = Iterable<String>
  final values = inventory.values; // values = Iterable<String>
  print(keys); // (cakes, pies, donuts, brownies)
  print(values); // (1, 14, 37, 3)

  // Checking for key or value existence
  print(inventory.containsKey('pies')); // true
  print(inventory.containsValue(42)); // false

  // Looping over elements of a map
  for (var key in inventory.keys) {
    print(inventory[key]);
  }

  inventory.forEach((key, value) => print('$key -> $value'));
  // the same
  for (final entry in inventory.entries) {
    // entry = MapEntry<String, int>
    print('${entry.key} -> ${entry.value}');
  }

  // Higher order methods: map, where, reduce, fold, sort, ...

  // map
  const numbers = [1, 2, 3, 4];
  final squares = numbers.map((number) => number * number);
  print(squares); // Iterable: (1, 4, 9, 16)
  print(squares.toList()); // List: [1, 4, 9, 16]
  print(squares.toSet()); // Set: {1, 4, 9, 16}

  // where
  final evens = squares.where((square) => square.isEven);
  print(evens); // Iterable: (4, 16)

  // reduce
  const amounts = [199, 299, 299, 199, 499];
  var total = amounts.reduce((sum, element) => sum + element);
  print(total); // 1495

  // fold (also would work on empty list)
  total = amounts.fold(
    0,
    (int sum, element) => sum + element,
  );
  print(total); // 1495

  // sort (in-place); is a verb -> produces a side effect
  print(desserts); // [cookies, donuts, pie, brownies]
  desserts.sort();
  print(desserts); // [brownies, cookies, donuts, pie]

  // Reversing a list: reversed; is an adjective -> no side effects
  var dessertsReversed = desserts.reversed;
  print(dessertsReversed); // Iterable<String>: (pie, donuts, cookies, brownies)
  print(desserts); // still the same: [brownies, cookies, donuts, pie]

  // iterables are lazy

  // Performing a custom sort
  desserts.sort((d1, d2) => d1.length.compareTo(d2.length));
  print(desserts); // [pie, donuts, cookies, brownies]

  // Chaining higher order methods
  final bigTallDesserts = desserts
      .where((dessert) => dessert.length > 5)
      .map((dessert) => dessert.toUpperCase());
  print(bigTallDesserts); // (DONUTS, COOKIES, BROWNIES)

  final jon = Person('Jon', 'Snow');
  final jane = Student('Jane', 'Snow');
  print(jon.fullName); // Jon Snow
  print(jane.fullName); // Jane Snow

  // jon.grades.add(Grade.B);  // only student has grades
  jane.grades.add(Grade.B);

  final jane1 = Student('Jane', 'Snow');
  print(jane1.fullName); // Snow, Jane

  final child = SomeChild(1.2);
  child.doSomeWork();

  final jessie = SchoolBandMember('Jessie', 'Jones');
  final marty = StudentAthlete('Marty', 'McFly');
  jessie.grades.add(Grade.A);
  print(jessie.grades); // [Grade.a]
  print(marty.isEligible); // true

  // Type inference in a mixed list (chooses most specific common ancestor)
  final students = [jane, jessie, marty]; // students = List<Student>
  print(students); // [Snow, Jane, Jones, Jessie, McFly, Marty]

  // Checking an object’s type at runtime
  print(jessie is Object); // true
  print(jessie is Person); // true
  print(jessie is Student); // true
  print(jessie is SchoolBandMember); // true
  print(jessie is! StudentAthlete); // true

  // Can’t instantiate abstract classes
  // Error: The class 'Animal' is abstract and can't be instantiated.
  // final animal = Animal();

  final platypus = Platypus();
  print(platypus.isAlive);
  platypus.eat();
  platypus.move();
  platypus.layEggs();
  print(platypus);

  Animal platypus1 = Platypus();
  // Error: The method 'layEggs' isn't defined for the class 'Animal'.
  // platypus1.layEggs();
  platypus1.move();
  // platypus1 is an Animal at compile time, a Platypus at run time
  print(platypus1); // I'm a Platypus

  // Using the interface
  // your code has no idea that that repository is actually a FakeWebServer
  final repository = DataRepository();
  final temperature = repository.fetchTemperature('Manila');
  print(temperature); // 42.0

  // mixed-in classes
  final platypusMixin = Platypus1();
  final robin = Robin();
  platypusMixin.layEggs();
  robin.layEggs();

  // Extensions
  final secret = 'abc'.encoded;
  print(secret); // bcd
  print('abc'.encoded.decoded); // abc

  print(3.cubed); // 27
  print(ProgrammingLanguage.javaScript.isStronglyTyped); // false
}
