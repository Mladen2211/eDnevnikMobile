import 'dart:convert';
import 'package:e_dnevnik/models/authResp.model.dart';
import 'package:e_dnevnik/models/response.model.dart';
import 'package:e_dnevnik/models/subject.model.dart';
import 'package:e_dnevnik/models/user.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserService {
  static var client = http.Client();
  static var _baseURL = "https://11c9d23dc67a.ngrok.io/api/User";

  static Future<List<User>> fetchProfessors() async {
    var response = await client
        .get(Uri.parse('$_baseURL/profesors'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    var jsonResponse = EDResponseFromJson(response.body);
    if (response.statusCode == 200) {
      var users = jsonResponse.result as List<dynamic>;
      debugPrint('users: $users');
      var userList = users
          .map((x) => User(
                id: x["Id"],
                firstName: x["FirstName"],
                lastName: x["LastName"],
                eMail: x["EMail"],
                mobileNumber: x["MobileNumber"],
                sex: x["Sex"],
                dateOfBirth: DateTime.parse(x["DateOfBirth"]),
                jmbg: x["Jmbg"],
                // birthPlace: x["BirthPlace"],
                address: x["Address"],
                // residence: x["Residence"],
                deleted: x["Deleted"],
                classId: x["ClassId"],
                active: x["Active"],
                // userClass: x["Class"]
              ))
          .toList();
      debugPrint('error: $userList');

      return userList;
    } else {
      return [];
    }
  }

  static Future<List<User>> fetchStudents() async {
    var response = await client
        .get(Uri.parse('$_baseURL/students'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    var jsonResponse = EDResponseFromJson(response.body);
    if (response.statusCode == 200) {
      var users = jsonResponse.result as List<dynamic>;
      debugPrint('users: $users');
      var userList = users
          .map((x) => User(
                id: x["Id"],
                firstName: x["FirstName"],
                lastName: x["LastName"],
                eMail: x["EMail"],
                mobileNumber: x["MobileNumber"],
                sex: x["Sex"],
                dateOfBirth: x["DateOfBirth"] != null ? DateTime.parse(x["DateOfBirth"]) : null,
                jmbg: x["Jmbg"],
                address: x["Address"],
                deleted: x["Deleted"],
                classId: x["ClassId"],
                active: x["Active"],
              ))
          .toList();
      debugPrint('error: $userList');

      return userList;
    } else {
      return [];
    }
  }

   static Future<EDResponse> deleteUser(id) async {
    var response = await client
        .delete(Uri.parse('$_baseURL/$id'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    var jsonResponse = EDResponseFromJson(response.body);
    debugPrint('error: ${jsonResponse}');
    // debugPrint('error: ${response.body}');
    if (jsonResponse.responseCode == 201) {
      if (jsonResponse != null) {
        Get.snackbar(
          "Uspiješno",
          "Predmet je uspiješno izbrisan",
        );
        return jsonResponse;
      } else {
        return new EDResponse();
      }
    } else {
      Get.snackbar(
        "Greška!",
        "dogodila se greška, pokušajte ponovno!",
      );
      return new EDResponse();
    }
  }

  static Future<EDResponse> createStudent(
      String firstName, String lastName, String email, String password) async {
    debugPrint('called');
        
    var response = await client.post(Uri.parse('$_baseURL/create/student'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "Id": 0,
          "FirstName": firstName,
          "LastName": lastName,
          "EMail": email,
          "Password": password,
          "MobileNumber": "",
          "Sex": "",
          "DateOfBirth": "",
          "Jmbg": "",
          "BirthPlace": null,
          "Address": "",
          "Residence": null,
          "Deleted": false,
          "ClassId": null,
          "Active": true
        }));
    var jsonResponse = EDResponseFromJson(response.body);
    debugPrint('error: ${response.body}');
    if (jsonResponse.responseCode == 201) {
      if (jsonResponse != null) {
        Get.snackbar(
          "Uspiješno",
          "Student je uspiješno kreiran",
        );
        return jsonResponse;
      } else {
        return new EDResponse();
      }
    } else {
      Get.snackbar(
        "Greška!",
        "provjerite svoje podatke i pokušajte ponovno!",
      );
      return new EDResponse();
    }
  }

    static Future<EDResponse> createProfessor(
      String firstName, String lastName, String email, String password) async {
    debugPrint('called');
        
    var response = await client.post(Uri.parse('$_baseURL/create/professor'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "Id": 0,
          "FirstName": firstName,
          "LastName": lastName,
          "EMail": email,
          "Password": password,
          "MobileNumber": "",
          "Sex": "",
          "DateOfBirth": "",
          "Jmbg": "",
          "BirthPlace": null,
          "Address": "",
          "Residence": null,
          "Deleted": false,
          "ClassId": null,
          "Active": true
        }));
    var jsonResponse = EDResponseFromJson(response.body);
    debugPrint('error: ${response.body}');
    if (jsonResponse.responseCode == 201) {
      if (jsonResponse != null) {
        Get.snackbar(
          "Uspiješno",
          "Profesor je uspiješno kreiran",
        );
        return jsonResponse;
      } else {
        return new EDResponse();
      }
    } else {
      Get.snackbar(
        "Greška!",
        "provjerite svoje podatke i pokušajte ponovno!",
      );
      return new EDResponse();
    }
  }
}
