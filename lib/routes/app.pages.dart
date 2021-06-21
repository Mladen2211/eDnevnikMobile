  
import 'package:e_dnevnik/bindings/dashboard.binding.dart';
import 'package:e_dnevnik/controllers/subject.controller.dart';
import 'package:e_dnevnik/middlewares/class_route.middleware.dart';
import 'package:e_dnevnik/middlewares/route.middleware.dart';
import 'package:e_dnevnik/pages/class_create.page.dart';
import 'package:e_dnevnik/pages/classes.page.dart';
import 'package:e_dnevnik/pages/dashboard.page.dart';
import 'package:e_dnevnik/pages/login.page.dart';
import 'package:e_dnevnik/pages/signup.page.dart';
import 'package:e_dnevnik/pages/students.page.dart';
import 'package:e_dnevnik/pages/students_create.page.dart';
import 'package:e_dnevnik/pages/subject_create.page.dart';
import 'package:e_dnevnik/pages/subjects.page.dart';
import 'package:e_dnevnik/pages/welcome.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'app.routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => WelcomPage(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => SignupPage(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.SUBJECTS,
      page: () => SubjectsPage(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.SUBJECTSADD,
      page: () => SubjectCreate(),
      middlewares: [RouteMiddleware()]
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.CLASSES,
      page: () => ClassesPage(),
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.CLASSADD,
      page: () => ClassCreate(),
      middlewares: [ClassMiddleware()]
      // binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.STUDENT,
      page: () => StudentsPage(),
    ),
     GetPage(
      name: AppRoutes.STUDENTADD,
      page: () => StudentCreate(),
    ),
    GetPage(
      name: AppRoutes.PROFESSORS,
      page: () => StudentsPage(),
    ),
     GetPage(
      name: AppRoutes.PROFESSORADD,
      page: () => StudentCreate(),
    ),
  ];
}

