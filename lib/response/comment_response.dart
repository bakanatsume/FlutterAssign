// To parse this JSON data, do
//
//     final commentResponse = commentResponseFromJson(jsonString);

import 'dart:convert';

CommentResponse commentResponseFromJson(String str) => CommentResponse.fromJson(json.decode(str));

String commentResponseToJson(CommentResponse data) => json.encode(data.toJson());

class CommentResponse {
  CommentResponse({
    this.msg,
  });

  String? msg;

  factory CommentResponse.fromJson(Map<String, dynamic> json) => CommentResponse(
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}
