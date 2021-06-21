import 'dart:convert';
import 'package:e_dnevnik/models/response.model.dart';
import 'package:e_dnevnik/models/class.model.dart';
import 'package:e_dnevnik/models/user.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ClassService {
  static var client = http.Client();
  static var _baseURL = "https://11c9d23dc67a.ngrok.io/api/Class";

  static Future<List<Class>> fetchClasses() async {
    var response =
        await client.get(Uri.parse('$_baseURL'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    var jsonResponse = EDResponseFromJson(response.body);
    if (response.statusCode == 200) {
      var classes = jsonResponse.result as List<dynamic>;
      var sbList = classes
          .map((x) => Class(
                id: x['Id'],
                code: x['Code'],
                active: x['Active'],
                classPresidentId: x['ClassPresidentId'],
                classTeacherId: x['ClassTeacherId'],
                schoolId: x['SchoolId'],
                deleted: x['Deleted'],
                // classPresident: x['ClassPresident'],
                // classTeacher: x['ClassTeacher'],
                // school: x['School']
              ))
          .toList();
      debugPrint('error: $classes');

      return sbList;
    } else {
      return [];
    }
  }

  static Future<EDResponse> deleteClass(id) async {
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
          "Razred je uspiješno izbrisan",
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

  static Future<EDResponse> createclass(
      String code, dynamic professoreId, int? schoolId) async {
        debugPrint("aha");
    final prefs = await SharedPreferences.getInstance();
    int? userSchoolId;
    if (schoolId == null) {
      userSchoolId = int.parse(prefs.getString('mySchoolId').toString());
      debugPrint('asdasd $userSchoolId');
    }
    var cls = Class(
      id: 0,
      code: code,
      active: true,
      // classPresidentId: null,
      classTeacherId: int.parse(professoreId),
      schoolId: schoolId != null
          ? schoolId
          : userSchoolId,
      deleted: false,
    );
    debugPrint('asdasd ${jsonEncode(cls)}');
    var response = await client.post(Uri.parse('$_baseURL/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cls));
    var jsonResponse = EDResponseFromJson(response.body);
    debugPrint('error: ${jsonResponse}');
    if (jsonResponse.responseCode == 201) {
      if (jsonResponse != null) {
        Get.snackbar(
          "Uspiješno",
          "razred je uspiješno kreiran",
        );
        return jsonResponse;
      } else {
        return new EDResponse();
      }
    } else {
      Get.snackbar(
        "Greška",
        "provjerite podatke i pokušajte ponovno!",
      );
      return new EDResponse();
    }
  }
}
