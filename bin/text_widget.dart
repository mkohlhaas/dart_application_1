// No type promotion for non-local variables

// Dart can’t guarantee that other methods or subclasses
// won’t change the value of a non-local variable before it’s used.
// class TextWidget {
//   String? text;
//   bool isLong() {
//     if (text == null) {
//       return false;
//     }
// 	// Error: Property 'length' cannot be accessed on 'String?'
// 	// because it is potentially null. Try accessing using ?. instead
// 	// or adding a null check (!) to the target
//     return text.length > 100; // error
//   }
// }

// 1st Solution: adding a null check(!)
class TextWidget {
  String? text;
  bool isLong() {
    if (text == null) {
      return false;
    }
    return text!.length > 100; // this says: I'm sure text is not null
  }
}

// 2nd Solution: shadowing
class TextWidget1 {
  String? text;
  bool isLong() {
    final text = this.text; // shadowing
    if (text == null) {
      return false;
    }
    return text.length > 100;
  }
}

void main() {
  var tw = TextWidget();
  var tw1 = TextWidget1();
  print(tw.isLong()); // false
  print(tw1.isLong()); // false
}
