import 'package:e_dnevnik/common/app.colors.dart';
import 'package:e_dnevnik/custom-icons/CustomIcons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../animation/FadeAnimation.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.bgSideMenu,
      // appBar: AppBar(
      //   elevation: 0,
      //   brightness: Brightness.light,
      //   backgroundColor: Colors.transparent,
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
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          "Registracija",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColor.text,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        1.2,
                        Text(
                          "Kreirajte novi korisnički račun",
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
                                  ((MediaQuery.of(context).size.width / 8) * 5)
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
                                    IconButton(
                                        icon: Icon(Icons.person),
                                        onPressed: null),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 20, left: 10),
                                        child: TextField(
                                          decoration:
                                              InputDecoration(hintText: 'Ime'),
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
                                    IconButton(
                                        icon: Icon(Icons.person),
                                        onPressed: null),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 20, left: 10),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: 'Prezime'),
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
                                    IconButton(
                                        icon: Icon(Icons.person),
                                        onPressed: null),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 20, left: 10),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: 'e-mail'),
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
                                    IconButton(
                                        icon: Icon(Icons.lock),
                                        onPressed: null),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 20, left: 10),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: 'Šifra'),
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
                                  child: Container(
                                    height: 40,
                                    // width: kIsWeb ? 500 : double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
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
                            ],
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
    );
  }
}

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 120,
        height: 1.0,
        color: Colors.black26.withOpacity(.2),
      ),
    );
