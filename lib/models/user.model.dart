// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:e_dnevnik/models/city.model.dart';
import 'package:e_dnevnik/models/class.model.dart';
import 'package:e_dnevnik/models/role.model.dart';
import 'package:e_dnevnik/models/school.model.dart';
import 'package:flutter/cupertino.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.firstName,
        this.lastName,
        this.eMail,
        this.mobileNumber,
        this.sex,
        this.dateOfBirth,
        this.jmbg,
        this.birthPlace,
        this.address,
        this.residence,
        this.deleted,
        this.classId,
        this.active,
        this.userClass,
        this.appointmentCreatedBy,
        this.appointmentUpdatedBy,
        this.classClassPresident,
        this.classClassTeacher,
        this.schools,
        this.subjects,
        this.userRoles,
        this.userSchools,
        this.roles,
        this.school
    });

    int? id;
    String? firstName;
    String? lastName;
    String? eMail;
    String? mobileNumber;
    String? sex;
    DateTime? dateOfBirth;
    String? jmbg;
    City? birthPlace;
    String? address;
    City? residence;
    bool? deleted;
    int? classId;
    bool? active;
    Class? userClass;
    School? school;
    List<Role>? roles;
    List<dynamic>? appointmentCreatedBy;
    List<dynamic>? appointmentUpdatedBy;
    List<dynamic>? classClassPresident;
    List<dynamic>? classClassTeacher;
    List<dynamic>? schools;
    List<dynamic>? subjects;
    List<dynamic>? userRoles;
    List<dynamic>? userSchools;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["Id"] == null ? null : json["Id"],
        firstName: json["FirstName"] == null ? null : json["FirstName"],
        lastName: json["LastName"] == null ? null : json["LastName"],
        eMail: json["EMail"] == null ? null : json["EMail"],
        mobileNumber: json["MobileNumber"] == null ? null : json["MobileNumber"],
        sex: json["Sex"] == null ? null : json["Sex"],
        dateOfBirth: json["DateOfBirth"] == null ? null : DateTime.parse(json["DateOfBirth"]),
        jmbg: json["Jmbg"] == null ? null : json["Jmbg"],
        birthPlace: json["BirthPlace"],
        address: json["Address"] == null ? null : json["Address"],
        residence: json["Residence"],
        deleted: json["Deleted"] == null ? null : json["Deleted"],
        classId: json["ClassId"],
        active: json["Active"] == null ? null : json["Active"],
        userClass: json["Class"],
        // appointmentCreatedBy: json["AppointmentCreatedByNavigations"] == [] ? [] : List<dynamic>.from(json["AppointmentCreatedByNavigations"].map((x) => x)),
        // appointmentUpdatedBy: json["AppointmentUpdatedByNavigations"] == [] ? [] : List<dynamic>.from(json["AppointmentUpdatedByNavigations"].map((x) => x)),
        // classClassPresident: json["ClassClassPresidentNavigations"] == [] ? [] : List<dynamic>.from(json["ClassClassPresidentNavigations"].map((x) => x)),
        // classClassTeacher: json["ClassClassTeacherNavigations"] == [] ? [] : List<dynamic>.from(json["ClassClassTeacherNavigations"].map((x) => x)),
        // schools: json["Schools"] == [] ? [] : List<dynamic>.from(json["Schools"].map((x) => x)),
        // subjects: json["Subjects"] == [] ? [] : List<dynamic>.from(json["Subjects"].map((x) => x)),
        // userRoles: json["UserRoles"] == [] ? [] : List<dynamic>.from(json["UserRoles"].map((x) => x)),
        roles: json["Roles"] == [] ? [] : List<Role>.from(json["Roles"].map((x) => Role.fromJson(x))),
        school: School.fromJson(json["School"])
        // userSchools: json["UserSchools"] == [] ? [] : List<dynamic>.from(json["UserSchools"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "FirstName": firstName == null ? null : firstName,
        "LastName": lastName == null ? null : lastName,
        "EMail": eMail == null ? null : eMail,
        "MobileNumber": mobileNumber == null ? null : mobileNumber,
        "Sex": sex == null ? null : sex,
        "DateOfBirth": dateOfBirth == null ? null : dateOfBirth?.toIso8601String(),
        "Jmbg": jmbg == null ? null : jmbg,
        "BirthPlace": birthPlace == null ? null : birthPlace?.id,
        "Address": address == null ? null : address,
        "Residence": residence == null ? null : residence?.id,
        "Deleted": deleted == null ? null : deleted,
        "ClassId": classId == null ? null : classId,
        "Active": active == null ? null : active
    };
}
