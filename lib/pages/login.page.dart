import 'package:e_dnevnik/animation/FadeAnimation.dart';
import 'package:e_dnevnik/controllers/auth.controller.dart';
import 'package:e_dnevnik/pages/signup.page.dart';
import 'package:e_dnevnik/pages/welcome.page.dart';
// import 'package:email_validator/email_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_dnevnik/common/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController controller = Get.put(AuthController());
  var _emailTextController = TextEditingController(text: "");
  var _passwordTextController = TextEditingController(text: "");
  var _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.bgSideMenu,
      // appBar: kIsWeb ? AppBar(
      //   elevation: 0,
      //   brightness: Brightness.light,
      //   backgroundColor: kIsWeb ? Colors.blue : Colors.transparent,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       size: 20,
      //       color: Colors.black,
      //     ),
      //   ),
      // ) : AppBar(elevation: 0,
      //   brightness: Brightness.light,
      //   backgroundColor: kIsWeb ? Colors.blue : Colors.transparent,),
      body: SingleChildScrollView(
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
                          FadeAnimation(
                              1,
                              Text(
                                "Prijava",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.text,
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            1.2,
                            Text(
                              "Dobro došli na eDnevnik",
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColor.text,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          FadeAnimation(
                            1.2,
                            Text(
                              "Prijavite se na svoj račun",
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColor.text,
                              ),
                            ),
                          ),
                        ],
                      ),
                      FadeAnimation(
                        1.3,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: kIsWeb
                                  ? MediaQuery.of(context).size.width -
                                      ((MediaQuery.of(context).size.width / 8) *
                                          5)
                                  : MediaQuery.of(context).size.width,
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: AppColor.bgSideMenu,
                              elevation: 15,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Material(
                                      shape: CircleBorder(),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child: SvgPicture.asset(
                                          "assets/icons/book.svg",
                                          width: 100.0,
                                          height: 100.0,
                                        ),
                                        radius: 50.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: <Widget>[
                                        // IconButton(
                                        //     icon: Icon(Icons.person),
                                        //     onPressed: null),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: 20, left: 10),
                                            child: TextFormField(
                                              controller: _emailTextController,
                                              enabled: !controller.loginProcess.value,
                                              decoration: InputDecoration(
                                                  icon: Icon(Icons.person),
                                                  labelText:'e-mail',
                                              ),
                                              // validator: (String value) =>
                                              //       EmailValidator.validate(value)
                                              //           ? null
                                              //           : "Please enter a valid email",
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: <Widget>[
                                        // IconButton(
                                        //     icon: Icon(Icons.lock),
                                        //     onPressed: null),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: 20, left: 10),
                                            child: TextFormField(
                                              enabled: !controller.loginProcess.value,
                                              controller: _passwordTextController,
                                              decoration: InputDecoration(
                                                  icon: Icon(Icons.lock),
                                                  labelText: 'Šifra',
                                                  suffixIcon: IconButton(
                                                    icon: Icon(
                                                      _passwordVisible
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                      color: Theme.of(context).primaryColorDark,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _passwordVisible = !_passwordVisible;
                                                      });
                                                    },
                                                  ),
                                              ),
                                              obscureText: !_passwordVisible,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FadeAnimation(
                                    1.4,
                                    Padding(
                                      padding: kIsWeb
                                          ? const EdgeInsets.only(
                                              top: 15.0,
                                              bottom: 15.0,
                                              right: 40.0,
                                              left: 35.0,
                                            )
                                          : const EdgeInsets.all(15.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                            // if (_formKey.currentState!.validate()) {
                                              String error = await controller.login(
                                                  email: _emailTextController.text,
                                                  password: _passwordTextController.text);
                                              // if (error != "") {
                                                // Get.defaultDialog(
                                                    // title: "Oop!", middleText: error);
                                              // } else {
                                                // Get.to(WelcomPage());
                                              // }
                                            // }
                                          },
                                        child: Container(
                                          height: 40,
                                          // width: kIsWeb ? 500 : double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: AppColor.button,
                                            boxShadow: [
                                              // BoxShadow(
                                              //   color: AppColor.shadow,
                                              //   blurRadius: 2.0,
                                              //   spreadRadius: 0.0,
                                              //   offset: Offset(
                                              //     2.0,
                                              //     2.0,
                                              //   ), // shadow direction: bottom right
                                              // )
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Prijavi me',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      FadeAnimation(
                          1.5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Nemate korisnički račun?",
                                style: TextStyle(
                                  color: AppColor.text,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(SignupPage());
                                },
                                child: Text(
                                  " Registrirajte se",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColor.text,
                                  ),
                                ),
                              ),
                            ],
                          ))
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
