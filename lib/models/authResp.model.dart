// To parse this JSON data, do
//
//     final authResp = authRespFromJson(jsonString);

import 'dart:convert';

import 'package:e_dnevnik/models/user.model.dart';

AuthResp authRespFromJson(String str) => AuthResp.fromJson(json.decode(str));

String authRespToJson(AuthResp data) => json.encode(data.toJson());

class AuthResp {
  AuthResp({
    this.token,
    this.user
  });

  String? token;
  User? user;

  factory AuthResp.fromJson(Map<String, dynamic> json) => AuthResp(
      token: json["Token"],
      user: User.fromJson(json["user"]),

  );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user
      };
}
