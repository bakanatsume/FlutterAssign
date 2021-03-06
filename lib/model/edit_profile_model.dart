// To parse this JSON data, do
//
//     final editProfile = editProfileFromJson(jsonString);

import 'dart:convert';

List<EditProfile> editProfileFromJson(String str) => List<EditProfile>.from(json.decode(str).map((x) => EditProfile.fromJson(x)));

String editProfileToJson(List<EditProfile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EditProfile {
  EditProfile({
    this.username,
    this.password,
    this.fname,
    this.lname,
    this.address,
    this.email,
    this.phoneNo,
    this.profilePic,
    this.v,
  });

  String? username;
  String? password;
  String? fname;
  String? lname;
  String? address;
  String? email;
  String? phoneNo;
  String? profilePic;
  int ? v;

  factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
    username: json["username"],
    password: json["password"],
    fname: json["fname"],
    lname: json["lname"],
    address: json["address"],
    email: json["email"],
    phoneNo: json["phone_no"],
    profilePic: json["profile_pic"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "fname": fname,
    "lname": lname,
    "address": address,
    "email": email,
    "phone_no": phoneNo,
    "profile_pic": profilePic,
    "__v": v,
  };
}
