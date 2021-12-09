// Dart has both an Exception type and an Error type. The words exception and error are often used
// interchangeably, but an Exception is something that you should expect and handle in the catch block.
// However, an Error is the result of a programming mistake. You should let the error crash your app as a
// sign that you need to fix whatever caused the error.

Future<void> main() async {
  print('Before the future');
  try {
    final value = await Future<int>.delayed(
      Duration(seconds: 1),
      () => 42,
    );
	// throw Exception('There was an error');
    print('Value: $value');
  } catch (error) {
    print(error);
  } finally {
    print('Future is complete');
  }
  print('After the future');

  // Before the future
  // Value: 42
  // Future is complete
  // After the future
}
