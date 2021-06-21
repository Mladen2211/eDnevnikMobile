import 'package:e_dnevnik/models/subject.model.dart';
import 'package:e_dnevnik/models/user.model.dart';
import 'package:e_dnevnik/services/subject.service.dart';
import 'package:e_dnevnik/services/user.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SubjectController extends GetxController {
  var loading = false.obs;
  var deleting = false.obs;
  var addingSubject = false.obs;
  var subjectList = <Subject>[].obs;
  var professorList = <User>[].obs;
  Rx<String> currentItem = "Profesor...".obs;

  void onSelected(String value) {
    currentItem(value);
    refresh();
    update();
  }

  @override
  void onInit() {
    getSubjects();
    super.onInit();
  }

  void getProfessors() async {
    try {
      loading(true);
      professorList.assignAll([]);
      var users = await UserService.fetchProfessors();
      if (users != null) {
        currentItem(users[0].id.toString());
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

  void getSubjects() async {
    try {
      loading(true);
      var subjects = await SubjectService.fetchSubjects();
      if (subjects != null) {
        subjectList.assignAll(subjects);
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

  void saveSubject(String subjectName) async{
    try {
        addingSubject(true);
        await SubjectService.createSubject(subjectName, currentItem.value);
    } catch (ex) {
      debugPrint('error: $ex');
      Get.snackbar(
        "Greška!",
        "Dogodila se greška, pokušajte ponovno za par trenutaka!",
      );
    } finally {
      addingSubject(false);
      getSubjects();
      Get.toNamed('/subjects');
    }
  }

  
  void deleteSubject(int? id) async{
    try {
        deleting(true);
        await SubjectService.deleteSubject(id);
    } catch (ex) {
      debugPrint('error: $ex');
      Get.snackbar(
        "Greška!",
        "Dogodila se greška, pokušajte ponovno za par trenutaka!",
      );
    } finally {
      deleting(false);
      getSubjects();
      // Get.toNamed('/subjects');
    }
  }
}
