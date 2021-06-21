import 'dart:convert';
import 'package:e_dnevnik/models/response.model.dart';
import 'package:e_dnevnik/models/subject.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SubjectService {
  static var client = http.Client();
  static var _baseURL = "https://11c9d23dc67a.ngrok.io/api/Subject";

  static Future<List<Subject>> fetchSubjects() async {
    var response =
        await client.get(Uri.parse('$_baseURL'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    var jsonResponse = EDResponseFromJson(response.body);
    if (response.statusCode == 200) {
      var subjects = jsonResponse.result as List<dynamic>;
      var sbList = subjects
          .map((x) => Subject(
              id: x['Id'],
              name: x['Name'],
              teachingProfessor: x['TeachingProfessor'],
              deleted: x['Deleted'],
              active: x['Active']))
          .toList();
      debugPrint('error: $subjects');

      return sbList;
    } else {
      return [];
    }
  }

  static Future<EDResponse> deleteSubject(id) async {
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

  static Future<EDResponse> createSubject(
      String name, dynamic professoreId) async {
    var subject = Subject(
        id: 0,
        name: name,
        teachingProfessor: int.parse(professoreId),
        deleted: false,
        active: true);
    var response = await client.post(Uri.parse('$_baseURL/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(subject));
    var jsonResponse = EDResponseFromJson(response.body);
    debugPrint('error: ${jsonResponse}');
    // debugPrint('error: ${response.body}');
    if (jsonResponse.responseCode == 201) {
      if (jsonResponse != null) {
        Get.snackbar(
          "Uspiješno",
          "Predmet je uspiješno kreiran",
        );
        return jsonResponse;
      } else {
        return new EDResponse();
      }
    } else {
      Get.snackbar(
        "Prijava neuspiješna!",
        "provjerite svoje podatke i pokušajte ponovno!",
      );
      return new EDResponse();
    }
  }
}
