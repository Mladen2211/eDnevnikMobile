import 'package:e_dnevnik/common/app.colors.dart';
import 'package:e_dnevnik/controllers/home.controller.dart';
import 'package:e_dnevnik/pages/classes.page.dart';
import 'package:e_dnevnik/pages/professors.page.dart';
import 'package:e_dnevnik/pages/students.page.dart';
import 'package:e_dnevnik/pages/subjects.page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.bgSideMenu,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
                    maxWidth: 1180,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(15),
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: AppColor.bgSideMenu,
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 28.0, bottom: 28.0),
                          child: ListTile(
                            leading: Icon(
                              FontAwesomeIcons.users,
                              color: AppColor.accent,
                              size: 45,
                            ),
                            title: Text(
                              'Razredi',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: AppColor.accent.withOpacity(0.6),
                              ),
                            ),
                            trailing: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Get.to(() => ClassesPage());
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColor.accent,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: AppColor.bgSideMenu,
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 28.0, bottom: 28.0),
                          child: ListTile(
                            leading: Icon(
                              FontAwesomeIcons.userGraduate,
                              color: AppColor.accent,
                              size: 45,
                            ),
                            title: Text(
                              'Učenici',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: AppColor.accent.withOpacity(0.6),
                              ),
                            ),
                            trailing: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Get.to(() => StudentsPage());
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColor.accent,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: AppColor.bgSideMenu,
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 28.0, bottom: 28.0),
                          child: ListTile(
                            leading: Icon(
                              FontAwesomeIcons.chalkboardTeacher,
                              color: AppColor.accent,
                              size: 45,
                            ),
                            title: Text(
                              'Nastavnici',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: AppColor.accent.withOpacity(0.6),
                              ),
                            ),
                            trailing: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                 Get.to(() => PreofessorsPage());
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColor.accent,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: AppColor.bgSideMenu,
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 28.0, bottom: 28.0),
                          child: ListTile(
                            leading: Icon(
                              FontAwesomeIcons.bookOpen,
                              color: AppColor.accent,
                              size: 45,
                            ),
                            title: Text(
                              'Predmeti',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: AppColor.accent.withOpacity(0.6),
                              ),
                            ),
                            trailing: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                 Get.to(SubjectsPage());
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColor.accent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
