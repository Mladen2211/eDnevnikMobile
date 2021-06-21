import 'package:e_dnevnik/models/class.model.dart';
import 'package:e_dnevnik/models/user.model.dart';
import 'package:e_dnevnik/services/class.service.dart';
import 'package:e_dnevnik/services/user.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClassController extends GetxController {
  var loading = false.obs;
  var deleting = false.obs;
  var addingClass = false.obs;
  var classList = <Class>[].obs;
  var professorList = <User>[].obs;
  var studentList = <User>[].obs;
  Rx<String> currentProfessor = "Profesor...".obs;
  Rx<String> currentStudent = "Student...".obs;
  Rx<String> schoolId = "School".obs;

  void onProfessorSelected(String value) {
    currentProfessor(value);
    refresh();
    update();
  }

   void onStudentSelected(String value) {
    currentStudent(value);
    refresh();
    update();
  }

  @override
  void onInit() {
    getClasses();
    super.onInit();
  }

  void getProfessors() async {
    try {
      loading(true);
      professorList.assignAll([]);
      var users = await UserService.fetchProfessors();
      if (users.isNotEmpty) {
        currentProfessor(users[0].id.toString());
        professorList.assignAll(users);
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
  void getStudents() async {
    try {
      loading(true);
      studentList.assignAll([]);
      var users = await UserService.fetchStudents();
      debugPrint('studfenti: ${users.isEmpty}');
      if (users.isNotEmpty) {
        currentStudent(users[0].id.toString());
        studentList.assignAll(users);
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
  void getClasses() async {
    try {
      loading(true);
      var cls = await ClassService.fetchClasses();
      if (cls != null) {
        classList.assignAll(cls);
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

  void saveClass(String className) async{
    try {
        addingClass(true);
        await ClassService.createclass(className, currentProfessor.value, null);
    } catch (ex) {
      debugPrint('error: $ex');
      Get.snackbar(
        "Greška!",
        "Dogodila se greška, pokušajte ponovno za par trenutaka!",
      );
    } finally {
      addingClass(false);
      getClasses();
      Get.toNamed('/classes');
    }
  }

  
  void deleteClass(int? id) async{
    try {
        deleting(true);
        await ClassService.deleteClass(id);
    } catch (ex) {
      debugPrint('error: $ex');
      Get.snackbar(
        "Greška!",
        "Dogodila se greška, pokušajte ponovno za par trenutaka!",
      );
    } finally {
      deleting(false);
      getClasses();
    }
  }
}
