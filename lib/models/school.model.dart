// To parse this JSON data, do
//
//     final School = SchoolFromJson(jsonString);

import 'dart:convert';

import 'package:e_dnevnik/models/user.model.dart';

School schoolFromJson(String str) => School.fromJson(json.decode(str));

String schoolToJson(School data) => json.encode(data.toJson());

class School {
    School({
        this.id,
        this.name,
        this.address,
        this.cityId,
        this.deleted,
        this.principalId,
        this.active,
        this.principal,
    });

    int? id;
    String? name;
    String? address;
    int? cityId;
    bool? deleted;
    int? principalId;
    bool? active;
    User? principal;

    factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["Id"] == null ? null : json["Id"],
        name: json["Name"] == null ? null : json["Name"],
        address: json["Address"] == null ? null : json["Address"],
        cityId: json["CityId"] == null ? null : json["CityId"],
        deleted: json["Deleted"] == null ? null : json["Deleted"],
        principalId: json["PrincipalId"] == null ? null : json["PrincipalId"],
        active: json["Active"] == null ? null : json["Active"],
        principal: json["Principal"] ,
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "cityId": cityId == null ? null : cityId,
        "deleted": deleted == null ? null : deleted,
        "principalId": principalId == null ? null : principalId,
        "active": active == null ? null : active,
    };
}
