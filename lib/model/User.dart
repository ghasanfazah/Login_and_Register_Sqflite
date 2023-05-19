
class UserFields{

  static const id = '_id';
  static const name = 'name';
  static const age = 'age';
  static const scannedName = 'family';
  static const password = 'password';
}

class User{

  static const table = 'user';
  final int? id;
  final String  name;
  final int age;
  final String scannedName;
  final String password;



  const User({
    this.id,
    required this.name,
    required this.age,
    required this.scannedName,
    required this.password,
  });

}