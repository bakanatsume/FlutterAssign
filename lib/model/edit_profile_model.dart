// To parse this JSON data, do
//
//     final editProfile = editProfileFromJson(jsonString);

import 'dart:convert';

EditProfile editProfileFromJson(String str) => EditProfile.fromJson(json.decode(str));

String editProfileToJson(EditProfile data) => json.encode(data.toJson());

class EditProfile {
  EditProfile({
    this.username,
    this.password,
    this.v,
    this.token,
  });

  String? username;
  String? password;
  int? v;
  String ? token;

  factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
    username: json["username"],
    password: json["password"],
    token:json["token"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "token":token,
    "__v": v,
  };
}
