// To parse this JSON data, do
//
//     final municipality = municipalityFromJson(jsonString);

import 'dart:convert';

import 'county.model.dart';

Municipality municipalityFromJson(String str) => Municipality.fromJson(json.decode(str));

String municipalityToJson(Municipality data) => json.encode(data.toJson());

class Municipality {
    Municipality({
        this.id,
        this.name,
        this.countyId,
        this.deleted,
        this.active,
        this.county,
    });

    int? id;
    String? name;
    int? countyId;
    bool? deleted;
    bool? active;
    County? county;

    factory Municipality.fromJson(Map<String, dynamic> json) => Municipality(
        id: json["Id"],
        name: json["Name"],
        countyId: json["countyId"],
        deleted: json["Deleted"],
        active: json["Active"],
        county: json["County"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "countyId": countyId,
        "Deleted": deleted,
        "Active": active,
        "County": county == null ? null : county!.toJson(),
    };
}
