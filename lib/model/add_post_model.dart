// To parse this JSON data, do
//
//     final addPostRequest = addPostRequestFromJson(jsonString);

import 'dart:convert';

List<AddPostRequest> addPostRequestFromJson(String str) => List<AddPostRequest>.from(json.decode(str).map((x) => AddPostRequest.fromJson(x)));

String addPostRequestToJson(List<AddPostRequest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddPostRequest {
  AddPostRequest({
    this.id,
    this.image,
    this.caption,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? image;
  String? caption;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory AddPostRequest.fromJson(Map<String, dynamic> json) => AddPostRequest(
    id: json["_id"],
    image: json["image"],
    caption: json["caption"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "caption": caption,
    "user_id": userId,
    // "createdAt": createdAt.toIso8601String(),
    // "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
