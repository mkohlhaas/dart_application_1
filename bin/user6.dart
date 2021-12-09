class User6 {
  const User6({int id = 0, String name = 'anonymous'})
      : assert(id >= 0),
        _id = id,
        _name = name;

  final int _id;
  final String _name;

  // all constructors so far are generative constructors
  // factory constructor allow more functionality:
  factory User6.fromJson(Map<String, Object> json) {
    final userId = json['id'] as int;
    final userName = json['name'] as String;
    return User6(id: userId, name: userName);
  }

  // same could be accomplished with class method
  static User6 fromJson1(Map<String, Object> json) {
    final userId = json['id'] as int;
    final userName = json['name'] as String;
    return User6(id: userId, name: userName);
  }

  // Differences between factory constructors and class methods:
  // - A factory constructor can only return an instance of the class type or subtype, a static method can return anything.
  // - A factory constructor can be unnamed, a static method must have a name.
  // - A factory constructor can be const if it's a forwarding constructor, a static method can't.

  @override
  String toString() {
    return 'User(id: $_id, name: $_name)';
  }
}
