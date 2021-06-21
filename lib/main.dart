import 'package:e_dnevnik/pages/login.page.dart';
import 'package:e_dnevnik/pages/welcome.page.dart';
import 'package:e_dnevnik/routes/app.pages.dart';
import 'package:e_dnevnik/routes/app.routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'pages/home.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.WELCOME,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      // themeMode: ThemeMode.system,
    );
  }
}