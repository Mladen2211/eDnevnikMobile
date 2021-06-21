import 'package:e_dnevnik/common/app.colors.dart';
import 'package:e_dnevnik/controllers/class.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassCreate extends StatefulWidget {
  ClassCreate({Key? key}) : super(key: key);

  @override
  _ClassCreateState createState() => _ClassCreateState();
}

class _ClassCreateState extends State<ClassCreate> {
  var _classCodeController = TextEditingController(text: "");
  final controller = Get.put(ClassController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.bgSideMenu,
        body: Obx(() {
          if (controller.loading.value)
            return Center(child: CircularProgressIndicator());
          else {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 1180,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "Dodajte predmet",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.text,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: kIsWeb
                                          ? MediaQuery.of(context).size.width -
                                              ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      8) *
                                                  5)
                                          : MediaQuery.of(context).size.width,
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      color: AppColor.bgSideMenu,
                                      elevation: 20,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 20,
                                                            left: 10),
                                                        child: TextFormField(
                                                          controller:
                                                              _classCodeController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText:
                                                                'Šifra razreda (npr 1.A)',
                                                          ),
                                                          enabled: controller
                                                                  .loading
                                                                  .value ==
                                                              false,
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Text("Razrednik:"),
                                                      flex: 1,
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 20,
                                                            left: 10),
                                                        child:
                                                            DropdownButtonFormField(
                                                          decoration: InputDecoration(
                                                              fillColor:
                                                                  Colors.white,
                                                              border:
                                                                  OutlineInputBorder(),
                                                              hintText:
                                                                  'Profesor'),
                                                          value: controller
                                                              .currentProfessor
                                                              .value,
                                                          onChanged: (value) {
                                                            controller
                                                                .onProfessorSelected(
                                                                    value
                                                                        .toString());
                                                          },
                                                          isExpanded: true,
                                                          items: controller
                                                              .professorList
                                                              .map((item) =>
                                                                  DropdownMenuItem(
                                                                    value: item
                                                                        .id
                                                                        .toString(),
                                                                    child: Text(
                                                                        '${item.firstName} ${item.lastName}'),
                                                                  ))
                                                              .toList(),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        child: controller
                                                                .addingClass
                                                                .value
                                                            ? SizedBox(
                                                                height: 20,
                                                                width: 20,
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              )
                                                            : Text(
                                                                'Spremi',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      20.0,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: AppColor
                                                                    .button),
                                                        onPressed: () {
                                                          controller.saveClass(_classCodeController.text);
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          'Odustani',
                                                          style: TextStyle(
                                                            fontSize: 20.0,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }));
  }
}
