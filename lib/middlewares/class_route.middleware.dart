import 'package:e_dnevnik/controllers/class.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClassMiddleware extends GetMiddleware {

  @override
  var priority = 1;

  @override
  GetPage? onPageCalled(GetPage? page) {
    debugPrint('called class add');
    final controller = Get.put(ClassController());
    controller.getProfessors();
    controller.getStudents();
    return page;
  }
}