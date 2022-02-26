// To parse this JSON data, do
//
//     final getUserResponse = getUserResponseFromJson(jsonString);

import 'dart:convert';

List<GetUserResponse> getUserResponseFromJson(String str) => List<GetUserResponse>.from(json.decode(str).map((x) => GetUserResponse.fromJson(x)));

String getUserResponseToJson(List<GetUserResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetUserResponse {
  GetUserResponse({
    this.id,
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

  String? id;
  String? username;
  String? password;
  String? fname;
  String? lname;
  String? address;
  String? email;
  String? phoneNo;
  String? profilePic;
  int? v;

  factory GetUserResponse.fromJson(Map<String, dynamic> json) => GetUserResponse(
    id: json["_id"],
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
    "_id": id,
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
