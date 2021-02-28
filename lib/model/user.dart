part of 'models.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String password;
  final String nik;
  final String telp;
  final String email;
  final String apiToken;
  User(
      {this.id,
      this.name,
      this.password,
      this.nik,
      this.telp,
      this.email,
      this.apiToken});

  @override
  List<Object> get props => [id, name, password];

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        id: json['id'].toString(),
        name: json['username'],
        password: json['password'],
        nik: json['nik'],
        telp: json['telp'],
        email: json['email'],
        apiToken: json['api_token']);
  }
}
