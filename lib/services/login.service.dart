import 'dart:convert';
import 'package:e_dnevnik/models/authResp.model.dart';
import 'package:e_dnevnik/models/response.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static var client = http.Client();
  static var _baseURL = "https://11c9d23dc67a.ngrok.io/api";

  // static Future<List> refreshToken({String token}) async {
  //   var response =
  //       await client.post('$_baseURL/auth/refresh', headers: <String, String>{
  //     'Authorization': 'Bearer $token',
  //   });

  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     //status is success but not excepted result
  //     if (json.contains("access_token") == false) {
  //       return ["", "Unknown Error"];
  //     }
  //     var loginRes = loginRespFromJson(json);
  //     if (loginRes != null) {
  //       return [loginRes.accessToken, ""];
  //     } else {
  //       return ["", "Unknown Error"];
  //     }
  //   } else {
  //     var json = response.body;
  //     var errorResp = errorRespFromJson(json);
  //     if (errorResp == null) {
  //       return ["", "Unknown Error"];
  //     } else {
  //       return ["", errorResp.error];
  //     }
  //   }
  // }
  static Future<AuthResp> login({required String email, required String password}) async {
    var response = await client.post(Uri.parse('$_baseURL/Auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{"email": email, "password": password}));

    if (response.statusCode == 200) {
      var json = response.body;
        debugPrint('response: ${response.body}');
      var loginRes = authRespFromJson(json);
      debugPrint('token: ${loginRes.user?.roles}');
      if (loginRes != null) {
        return loginRes;
      } else {
        return new AuthResp();
      }
    } 
    else{
      Get.snackbar(
            "Prijava neuspiješna!",
            "provjerite svoje podatke i pokušajte ponovno!",
          ); 
      return new AuthResp();
    }
  }
}
