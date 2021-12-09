class User4 {
  // Named parameters can't start with an underscore.
  // User4({this._id = 0, this._name = 'anonymous'});

  // use initializer list instead
  User4({int id = 0, String name = 'anonymous'})
      // asserts are only checked when dart runs with  --enable-asserts flag
      : assert(id >= 0),
        assert(name.isNotEmpty),
        _id = id,
        _name = name {
    print('Created new user: $_name'); // initializer list executed before body
  }

  // private fields (_)
  // are LIBRARY private, not CLASS private!
  // you need separate files to make these members really private
  final int _id;
  final String _name;

  @override
  String toString() {
    return 'User(id: $_id, name: $_name)';
  }
}
