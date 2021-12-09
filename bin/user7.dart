class User7 {
  const User7({int id = 0, String name = 'anonymous'})
      : assert(id >= 0),
        _id = id,
        _name = name;

  // getters
  int get id => _id;
  String get name => _name;
  // calculated getter
  bool get isBigId => _id > 1000;

  final int _id;
  final String _name;

  @override
  String toString() {
    return 'User(id: $_id, name: $_name)';
  }
}
