part of 'models.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String password;
  User({
    this.id,
    this.name,
    this.password,
  });

  @override
  List<Object> get props => [id, name, password];

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['username'],
      password: json['password'],
    );
  }
}
