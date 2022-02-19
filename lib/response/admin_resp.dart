// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.token,
    this.message,
  });

  String? token;
  String? message;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    token: json["token"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "message": message,
  };
}
