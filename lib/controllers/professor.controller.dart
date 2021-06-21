import 'package:e_dnevnik/models/user.model.dart';
import 'package:e_dnevnik/services/user.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum Sex { m, f }

class ProfessorController extends GetxController {
  var loading = false.obs;
  var deleting = false.obs;
  var addingProfessor = false.obs;
  var professorList = <User>[].obs;
  Rx<String> sex = 'M'.obs;

  void setSex(value) {
    sex(value);
    refresh();
    update();
  }

  @override
  void onInit() {
    getProfessors();
    super.onInit();
  }

  void getProfessors() async {
    try {
      loading(true);
      var professors = await UserService.fetchProfessors();
      if (professors != null) {
        professorList.assignAll(professors);
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

  void saveProfessor(
      String firstName, String lastName, String email, String password) async {
    try {
      addingProfessor(true);
      await UserService.createProfessor(firstName, lastName, email, password);
    } catch (ex) {
      debugPrint('error: $ex');
      Get.snackbar(
        "Greška!",
        "Dogodila se greška, pokušajte ponovno za par trenutaka!",
      );
    } finally {
      addingProfessor(false);
      getProfessors();
      Get.toNamed('/professors');
    }
  }

  void deleteProfessor(int? id) async {
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
      getProfessors();
      // Get.toNamed('/Professors');
    }
  }
}
