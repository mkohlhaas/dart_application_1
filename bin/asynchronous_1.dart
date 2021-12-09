// Three different states for a future:
// - Uncompleted
// - Completed with a value
// - Completed with an error

void main() {
  final myFuture = Future<int>.delayed(
    Duration(seconds: 1),
    () => 42,
  );
  print(myFuture); // Instance of 'Future<int>'

  // Two ways to get at the value after a future completes.
  // 1. Callbacks
  // 2. Async-Await syntax

  // 1. Getting the result with callbacks

  print('Before the future');
  Future<int>.delayed(
    Duration(seconds: 1),
    () => 42,
  )
      .then(
        (value) => print('Value: $value'),
      )
      .catchError(
        (error) => print('Error: $error'),
      )
      .whenComplete(
        () => print('Future is complete'),
      );
  print('After the future');

  // Note order:
  // Before the future
  // After the future
  // Value: 42
  // Future is complete

  // Getting the result with async-await
  // ref. bin/asynchronous_2.dart
}
