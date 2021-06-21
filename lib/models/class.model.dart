// To parse this JSON data, do
//
//     final Class = ClassFromJson(jsonString);

import 'dart:convert';

import 'package:e_dnevnik/models/school.model.dart';
import 'package:e_dnevnik/models/user.model.dart';

Class ClassFromJson(String str) => Class.fromJson(json.decode(str));

String ClassToJson(Class data) => json.encode(data.toJson());

class Class {
    Class({
        this.id,
        this.code,
        this.active,
        this.classPresidentId,
        this.classTeacherId,
        this.schoolId,
        this.deleted,
        this.classPresident,
        this.classTeacher,
        this.school,
    });

    int? id;
    String? code;
    bool? active;
    int? classPresidentId;
    int? classTeacherId;
    int? schoolId;
    bool? deleted;
    User? classPresident;
    User? classTeacher;
    School? school;

    factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["Id"] == null ? null : json["Id"],
        code: json["Code"] == null ? null : json["Code"],
        active: json["Active"] == null ? null : json["Active"],
        classPresidentId: json["ClassPresidentId"] == null ? null : json["ClassPresidentId"],
        classTeacherId: json["ClassTeacherId"] == null ? null : json["ClassTeacherId"],
        schoolId: json["SchoolId"] == null ? null : json["SchoolId"],
        deleted: json["Deleted"] == null ? null : json["Deleted"],
        classPresident: json["ClassPresident"] == null ? null : User.fromJson(json["ClassPresident"]),
        classTeacher: json["ClassTeacher"] == null ? null : User.fromJson(json["ClassTeacher"]),
        school: json["School"] == null ? null : School.fromJson(json["School"]),
    );

    Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Code": code == null ? null : code,
        "Active": active == null ? null : active,
        "ClassPresidentId": classPresidentId == null ? null : classPresidentId,
        "ClassTeacherId": classTeacherId == null ? null : classTeacherId,
        "SchoolId": schoolId == null ? null : schoolId,
        "Deleted": deleted == null ? null : deleted,
    };
}
