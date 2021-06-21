import 'package:e_dnevnik/controllers/subject.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RouteMiddleware extends GetMiddleware {

  @override
  var priority = 20;

  @override
  GetPage? onPageCalled(GetPage? page) {
    debugPrint('called');
    final controller = Get.put(SubjectController());
    controller.getProfessors();
    return page;
  }
}