
import 'dart:convert';

List<AllPostResponse> allPostResponseFromJson(String str) => List<AllPostResponse>.from(json.decode(str).map((x) => AllPostResponse.fromJson(x)));

String allPostResponseToJson(List<AllPostResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPostResponse {
  AllPostResponse({
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
  UserId? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory AllPostResponse.fromJson(Map<String, dynamic> json) => AllPostResponse(
    id: json["_id"],
    image: json["image"],
    caption: json["caption"],
    userId: UserId.fromJson(json["user_id"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "caption": caption,
    "user_id": userId?.toJson(),
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}

class UserId {
  UserId({
    this.id,
    this.username,
    this.profilePic,
  });

  String? id;
  String? username;
  String? profilePic;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"],
    username: json["username"],
    profilePic: json["profile_pic"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "profile_pic": profilePic,
  };
}
