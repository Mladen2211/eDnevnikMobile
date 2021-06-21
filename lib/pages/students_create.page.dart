import 'package:e_dnevnik/common/app.colors.dart';
import 'package:e_dnevnik/controllers/student.controller.dart';
import 'package:e_dnevnik/controllers/subject.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentCreate extends StatefulWidget {
  StudentCreate({Key? key}) : super(key: key);

  @override
  _StudentCreateState createState() => _StudentCreateState();
}

class _StudentCreateState extends State<StudentCreate> {
  var _firstNameController = TextEditingController(text: "");
  var _lastNameController = TextEditingController(text: "");
  var _eMailController = TextEditingController(text: "");
  var _passwordController = TextEditingController(text: "");

  final controller = Get.put(StudentController());
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
                                  "Dodajte učenika",
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
                                                              _firstNameController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText: 'Ime',
                                                          ),
                                                          enabled: controller
                                                                  .loading
                                                                  .value ==
                                                              false,
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 20,
                                                            left: 10),
                                                        child: TextFormField(
                                                          controller:
                                                              _lastNameController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText: 'Prezime',
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
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 20,
                                                            left: 10),
                                                        child: TextFormField(
                                                          controller:
                                                              _eMailController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText: 'eMail',
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
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 20,
                                                            left: 10),
                                                        child: TextFormField(
                                                          controller:
                                                              _passwordController,
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText: 'Šifra',
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
                                              // Column(children: <Widget>[
                                              //   Padding(
                                              //     padding: const EdgeInsets.all(
                                              //         20.0),
                                              //     child: Column(
                                              //       children: <Widget>[
                                              //         ListTile(
                                              //           title: Text("Muško"),
                                              //           leading: Radio(
                                              //             value: "M",
                                              //             groupValue:
                                              //                 controller.sex.value,
                                              //             onChanged: (value) {
                                              //               controller.setSex("M");
                                              //             },
                                              //           ),
                                              //         ),
                                              //         ListTile(
                                              //            title: Text("Žensko"),
                                              //           leading: Radio(
                                              //             value: "F",
                                              //             groupValue:
                                              //                 controller.sex.value,
                                              //             onChanged: (value) {
                                              //               controller.setSex("F");
                                              //             },
                                              //           ),
                                              //         )
                                              //       ],
                                              //     ),
                                              //   ),
                                              // ]),
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
                                                                .addingStudent
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
                                                          controller.saveStudent(
                                                              _firstNameController
                                                                  .text,
                                                              _lastNameController
                                                                  .text,
                                                              _eMailController
                                                                  .text,
                                                              _passwordController
                                                                  .text);
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
