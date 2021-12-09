// Getting the result with async-await

// Once Dart sees await, the rest of the function won’t run until the future completes.
Future<void> main() async {
  print('Before the future');
  final value = await Future<int>.delayed(
    Duration(seconds: 1),
    () => 42,
  );
  print('Value: $value');
  print('After the future');

  // Gives the impression of synchronous code bc EVERYTHING after the await keyword is sent to the event queue:
  // Before the future
  // Value: 42
  // After the future
}
