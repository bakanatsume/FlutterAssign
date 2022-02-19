// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

Comment commentuserFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
  Comment({
    this.comment,
    this.token,
  });

  String? comment;
  String? token;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    comment: json["comment"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "token": token,
  };
}
