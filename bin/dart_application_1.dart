import 'dart:math';

class User {
  User(this.id, this.name);

  User.anonymous() {
    id = 0;
    name = 'anonymous';
  }

  int id = 0;
  String name = '';

  String toJson() {
    return '{"id":$id,"name":"$name"}';
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name)';
  }
}

enum Weather { sunny, snowy, cloudy, rainy }

String fullName(String first, String last, [String? title]) {
  if (title != null) {
    return '$title $first $last';
  } else {
    return '$first $last';
  }
}

bool withinTolerance(int value, [int min = 0, int max = 10]) =>
    min <= value && value <= max;

bool withinTolerance1(int value, {int min = 0, int max = 10}) =>
    min <= value && value <= max;

bool withinTolerance2({required int value, int min = 0, int max = 10}) =>
    min <= value && value <= max;

void printNumber(num number) => print(number);

void main() {
  Object? myVar;
  myVar = 234.42;
  myVar = 'Hi there!';
  print(myVar);

  const bigString = '''
This is
a very
big string!''';

  const oneThird = 1 / 3;
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
  myNumbers.forEach(printNumber);

  print(fullName('Ray', 'Wenderlich'));
  print(fullName('Albert', 'Einstein', 'Professor'));

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
  Function multiply = (int a, int b) => a * b;
  print(multiply(2, 3));

  final multiply1 = (int a, int b) => a * b;
  print(multiply1(2, 3));

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

//  final user = User();
//  user.name = 'Hans';
//  user.id = 42;
//  print(user.name);
//  print(user.id);
//  print(user);
//
//  print(user.toJson());
//
//  final user1 = User()
//    ..name = 'Ray'
//    ..id = 48;
//  print(user1);

  final user = User(42, 'Ray');
  print(user);

  final anonymousUser = User.anonymous();
  print(anonymousUser);

  // Forwarding constructors
}
