// To parse this JSON data, do
//
//     final auth = authFromJson(jsonString);

import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  Auth({
    this.userInfo,
    this.token,
  });

  UserInfo? userInfo;
  String? token;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    userInfo: UserInfo.fromJson(json["user_info"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user_info": userInfo!.toJson(),
    "token": token,
  };
}

class UserInfo {
  UserInfo({
    this.userId,
    this.owner,
    this.roles,
    this.email,
  });

  int ? userId;
  String ? owner;
  List<String>? roles;
  String? email;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    userId: json["user_id"],
    owner: json["owner"],
    roles: List<String>.from(json["roles"].map((x) => x)),
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "owner": owner,
    "roles": List<dynamic>.from(roles!.map((x) => x)),
    "email": email,
  };
}
