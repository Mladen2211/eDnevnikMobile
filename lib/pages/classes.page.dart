import 'package:e_dnevnik/common/app.colors.dart';
import 'package:e_dnevnik/controllers/class.controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ClassesPage extends StatefulWidget {
  ClassesPage({Key? key}) : super(key: key);

  @override
  _ClassesPageState createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  final controller = Get.put(ClassController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.bgSideMenu,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: AppColor.accent,
          ),
        ),
        title: Text(
          'Razredi',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: AppColor.accent.withOpacity(0.6),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.toNamed('/class/add');
              },
              child: Icon(
                Icons.add,
                color: AppColor.accent,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.loading.value)
            return Center(child: CircularProgressIndicator());
          else if (controller.classList.length == 0)
            return Center(
              child: Text('Nemate dostupnih podataka!'),
            );
          else
            return ListView.builder(
              itemCount: controller.classList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: AppColor.bgSideMenu,
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.chalkboard,
                          color: AppColor.accent,
                          size: 35,
                        ),
                        title: Text(
                          controller.classList[index].code.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: AppColor.accent.withOpacity(0.6),
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            controller.deleteClass(
                                controller.classList[index].id);
                          },
                          child: controller.deleting.value
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                )
                              : Icon(
                                  FontAwesomeIcons.trash,
                                  color: Colors.red,
                                  size: 15,
                                ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
        },
      ),
    );
  }
}
