part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String password;
  final String email;
  final String phoneNumber;
  final String picturePath;

  User(
      {this.id,
      this.name,
      this.password,
      this.email,
      this.phoneNumber,
      this.picturePath});

  @override
  List<Object> get props => [id, name, email, phoneNumber, picturePath];

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      // id: json['id'].toString(),
      name: json['username'],
      password: json['password'],
      // email: json['jam'],
      // phoneNumber: json['idlog'],
    );
  }
}
