import 'dart:convert';

import 'package:e_dnevnik/models/authResp.model.dart';
import 'package:e_dnevnik/pages/dashboard.page.dart';
import 'package:e_dnevnik/pages/home.page.dart';
import 'package:e_dnevnik/services/login.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController{
  var loginProcess = false.obs;
  var error = "";

  Future<String> login({required String email, required String password}) async {
    error = "";
    try {
      loginProcess(true);
      AuthResp loginResp = await LoginService.login(email: email, password: password);
      debugPrint('response: ${loginResp.user?.roles}');

      if (loginResp.token != null && loginResp.user != null) {
        //success
        debugPrint('${loginResp.user!.school!.id}');
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("token", loginResp.token.toString());
        prefs.setString("user", jsonEncode(loginResp.user));
        prefs.setString("mySchoolId", jsonEncode(loginResp.user!.school!.id));

        Get.to(() => DashboardPage());        
        // var loggedInRoles = loginResp.user?.roles!.map((e) => e.name);
        // if(loggedInRoles?.contains('Administrator') != null){
        // } else if(loggedInRoles?.contains('Koordinator') != null){
        //   Get.to(() => DashboardPage());        
        // } else if(loggedInRoles?.contains('Profesor') != null){
        //   Get.to(() => DashboardPage());        
        // } else{
        //   // return snackbar
        // }
      } else {
        // return snackbar
      }
    } finally {
      loginProcess(false);
    }
    return error;
  }
}