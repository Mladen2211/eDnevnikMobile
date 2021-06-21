import 'package:e_dnevnik/controllers/dashboard.controller.dart';
import 'package:e_dnevnik/controllers/home.controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut(() => HomeController());
    // Get.lazyPut<AccountController>(() => AccountController());
  }
}