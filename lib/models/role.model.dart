// To parse this JSON data, do
//
//     final Role = RoleFromJson(jsonString);

import 'dart:convert';

Role RoleFromJson(String str) => Role.fromJson(json.decode(str));

String RoleToJson(Role data) => json.encode(data.toJson());

class Role {
    Role({
        this.id,
        this.name,
        this.deleted,
        this.active,
    });

    int? id;
    String? name;
    bool? deleted;
    bool? active;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["Id"] == null ? null : json["Id"],
        name: json["Name"] == null ? null : json["Name"],
        deleted: json["Deleted"] == null ? null : json["Deleted"],
        active: json["Active"] == null ? null : json["Active"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Name": name == null ? null : name,
        "Deleted": deleted == null ? null : deleted,
        "Active": active == null ? null : active,
    };
}
