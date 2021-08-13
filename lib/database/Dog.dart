class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  Map<String, Object?> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'age': this.age
    };
  }

  @override
  String toString() {
    return 'id: $id, name: $name, age: $age';
  }
}