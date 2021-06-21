// To parse this JSON data, do
//
//     final county = countyFromJson(jsonString);

import 'dart:convert';

County countyFromJson(String str) => County.fromJson(json.decode(str));

String countyToJson(County data) => json.encode(data.toJson());

class County {
    County({
        this.id,
        this.name,
        this.code,
        this.deleted,
        this.active,
    });

    int? id;
    String? name;
    String? code;
    bool? deleted;
    bool? active;

    factory County.fromJson(Map<String, dynamic> json) => County(
        id: json["Id"] == null ? null : json["Id"],
        name: json["Name"] == null ? null : json["Name"],
        code: json["Code"] == null ? null : json["Code"],
        deleted: json["Deleted"],
        active: json["Active"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Name": name == null ? null : name,
        "Code": code == null ? null : code,
        "Deleted": deleted,
        "Active": active,
    };
}
