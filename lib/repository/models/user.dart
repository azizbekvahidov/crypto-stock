import './models.dart';

class User {
  String id;
  String firstname;
  String surname;
  String username;

  User({
    required this.id,
    required this.firstname,
    required this.surname,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["uuid"],
      username: json["userName"],
      firstname: json["firstName"],
      surname: json["surname"],
    );
  }
}
