import 'dart:convert';

class UsersModel {
  final String id;
  final String name;
  final String password;
  final String confirm_passowrd;
  final String email;
  final String type_of_person;
  UsersModel({
    required this.id,
    required this.name,
    required this.password,
    required this.confirm_passowrd,
    required this.email,
    required this.type_of_person,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
      'confirm_passowrd': confirm_passowrd,
      'email': email,
      'type_of_person': type_of_person,
    };
  }

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      id: map['id'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      confirm_passowrd: map['confirm_passowrd'] as String,
      email: map['email'] as String,
      type_of_person: map['type_of_person'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersModel.fromJson(String source) =>
      UsersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
