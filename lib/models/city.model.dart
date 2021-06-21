// To parse this JSON data, do
//
//     final city = cityFromJson(jsonString);

import 'dart:convert';

import 'municipality.model.dart';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
    City({
        this.id,
        this.name,
        this.zipCode,
        this.municipalityId,
        this.deleted,
        this.active,
        this.municipality,
    });

    int? id;
    String? name;
    String? zipCode;
    int? municipalityId;
    bool? deleted;
    bool? active;
    Municipality? municipality;

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["Id"],
        name: json["Name"],
        zipCode: json["ZipCode"],
        municipalityId: json["MunicipalityId"],
        deleted: json["Deleted"],
        active: json["Active"],
        municipality: json["Municipality"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Name": name == null ? null : name,
        "ZipCode": zipCode == null ? null : zipCode,
        "MunicipalityId": municipalityId == null ? null : municipalityId,
        "Deleted": deleted == null ? null : deleted,
        "Active": active == null ? null : active,
        "Municipality": municipality == null ? null : municipality!.toJson(),
    };
}

