import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

void openDrawer() {
      debugPrint('key: ${scaffoldKey.currentState}');
      scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
   }
}
