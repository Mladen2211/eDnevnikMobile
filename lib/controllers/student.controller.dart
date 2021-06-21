import 'package:e_dnevnik/models/user.model.dart';
import 'package:e_dnevnik/services/user.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum Sex { m, f }

class StudentController extends GetxController {
  var loading = false.obs;
  var deleting = false.obs;
  var addingStudent = false.obs;
  var studentList = <User>[].obs;
  Rx<String> sex = 'M'.obs;

  void setSex(value) {
    sex(value);
    refresh();
    update();
  }

  @override
  void onInit() {
    getStudents();
    super.onInit();
  }

  void getStudents() async {
    try {
      loading(true);
      var Students = await UserService.fetchStudents();
      if (Students != null) {
        studentList.assignAll(Students);
      }
    } catch (ex) {
      debugPrint('error: $ex');
      Get.snackbar(
        "Greška!",
        "Dogodila se greška, pokušajte ponovno za par trenutaka!",
      );
    } finally {
      loading(false);
    }
  }

  void saveStudent(
      String firstName, String lastName, String email, String password) async {
    try {
      addingStudent(true);
      await UserService.createStudent(firstName, lastName, email, password);
    } catch (ex) {
      debugPrint('error: $ex');
      Get.snackbar(
        "Greška!",
        "Dogodila se greška, pokušajte ponovno za par trenutaka!",
      );
    } finally {
      addingStudent(false);
      getStudents();
      Get.toNamed('/students');
    }
  }

  void deleteStudent(int? id) async {
    try {
      deleting(true);
      await UserService.deleteUser(id);
    } catch (ex) {
      debugPrint('error: $ex');
      Get.snackbar(
        "Greška!",
        "Dogodila se greška, pokušajte ponovno za par trenutaka!",
      );
    } finally {
      deleting(false);
      getStudents();
      // Get.toNamed('/Students');
    }
  }
}
