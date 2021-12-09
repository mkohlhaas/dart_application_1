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

// ------------------------------ Main ------------------------------
void main() {
  Object? myVar;
  myVar = 234.42;
  myVar = 'Hi there!';
  print(myVar);

  const bigString = '''
This is
a very
big string!
''';

  // const = compile-time constant
  // final = run-time constant
  const oneThird = 1 / 3;
  // string interpolation
  final sentence = 'One third is ${oneThird.toStringAsFixed(5)}';
  print(sentence);
  print(bigString);
  const rawString = r'My name is \n Hans.';
  print(rawString);
  print('I \u2764 Dart\u0021');
  print('I love \u{1F3AF}');

  final message = StringBuffer();
  message.writeln("Hi");
  message.writeln("there!");
  message.writeln("My name is Hans.");
  print(message.toString());
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

  const score = 83;
  const scoreMessage = (score >= 60) ? 'You passed' : 'You failed';
  print(scoreMessage);

  const number = 3;
  switch (number) {
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

  for (var i = 0; i < 5; i++) {
    if (i == 2) {
      continue;
    }
    print(i);
  }

  const myString = 'I ❤ Dart';
  for (var codePoint in myString.runes) {
    print(String.fromCharCode(codePoint));
  }

  const myNumbers = [1, 2, 3];
  for (var number in myNumbers) {
    print(number);
  }

  for (var number in myNumbers) {
    print(number);
  }
  myNumbers.forEach(print);

  String fullName(String first, String last, [String? title]) {
    if (title != null) {
      return '$title $first $last';
    } else {
      return '$first $last';
    }
  }

  print(fullName('Ray', 'Wenderlich'));
  print(fullName('Albert', 'Einstein', 'Professor'));

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

  'abc'.runes.forEach(print);
  'abc'.codeUnits.forEach(print);

  //  cascade operator (..) allows chaining multiple assignments on the same object
  final user1 = User3()
    ..name = 'Ray'
    ..id = 48;
  print(user1);

  final user = User(42, 'Ray');
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
  const user5 = User5(id: 42, name: 'Ray');
  // you could call User.anonymous() a thousand times but it will be created only once!!!
  // Flutter uses this pattern frequently with its const widget classes in the user interface
  // of your app. Since Flutter knows that the const widgets are immutable, it doesn’t have
  // to waste time recalculating and drawing the layout when it finds these widgets.
  const anonymousUser5 = User5.anonymous();
  print(user5);
  print(anonymousUser5);

  final map = {'id': 10, 'name': 'Manda'};
  User6 manda = User6.fromJson(map);  // using factory constructor
  print(manda);
  manda = User6.fromJson1(map);  // using class method
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

  // Chapter 7: Nullability

  // ??   if-null operator
  // ??=  null-aware assignment operator
  // ?.   null-aware access operator
  // ?.   null-aware method invocation operator
  // !    null assertion operator (bang operator)
  // ?..  null-aware cascade operator
  // ?[]  null-aware index operator
  // ...? null-aware spread operator
}
