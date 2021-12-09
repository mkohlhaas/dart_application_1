class User5 {
  // both fields (_id, _name) are constant
  // let's make the whole class const at compile-time
  const User5({int id = 0, String name = 'anonymous'})
      : assert(id >= 0),
        // this is a run-time check; not allowed
        // assert(name.isNotEmpty),
        _id = id,
        _name = name;
  // Const constructors can't have a body
  // {
  //   print('Created new user: $_name'); // initializer list executed before body
  // }

  const User5.anonymous() : this();

  final int _id;
  final String _name;

  @override
  String toString() {
    return 'User(id: $_id, name: $_name)';
  }
}
