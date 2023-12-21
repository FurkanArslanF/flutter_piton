import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  final String email;
  final String name;
  final String password;

  RegisterModel({
    required this.email,
    required this.name,
    required this.password,
  });

  RegisterModel copyWith({
    required String email,
    required String name,
    required String password,
  }) =>
      RegisterModel(
        email: email,
        name: name,
        password: password,
      );

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        email: json["email"],
        name: json["name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "password": password,
      };
}
