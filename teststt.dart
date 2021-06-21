// return Scaffold(
    //   backgroundColor: AppColor.bgSideMenu,
    //   body: SingleChildScrollView(
    //     child: Center(
    //       child: Container(
    //         constraints: BoxConstraints(
    //           maxWidth: 1180,
    //         ),
    //         width: MediaQuery.of(context).size.width,
    //         decoration: BoxDecoration(),
    //         child: Padding(
    //           padding: const EdgeInsets.all(5.0),
    //           child: Column(
    //             children: [
    //               FadeAnimation(
    //                 1,
    //                 Padding(
    //                   padding: const EdgeInsets.only(
    //                     top: 60.0,
    //                   ),
    //                   child: Image.asset(
    //                     'assets/logo.png',
    //                     height: 100,
    //                     width: 100,
    //                   ),
    //                 ),
    //               ),
    //               FadeAnimation(
    //                 1.1,
    //                 Text(
    //                   'eDnevnik',
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 20,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 30,
    //               ),
    //               Container(
    //                 height: MediaQuery.of(context).size.height,
    //                 width: double.infinity,
    //                 constraints: BoxConstraints(
    //                   maxWidth: kIsWeb ? MediaQuery.of(context).size.width - ((MediaQuery.of(context).size.width/8)*5) : MediaQuery.of(context).size.width,
    //                 ),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: <Widget>[
    //                     Expanded(
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                         children: <Widget>[
    //                           FadeAnimation(
    //                             1.2,
    //                             Padding(
    //                               padding: EdgeInsets.symmetric(horizontal: 5),
    //                               child: Card(
    //                                 shape: RoundedRectangleBorder(
    //                                   borderRadius: BorderRadius.circular(15.0),
    //                                 ),
    //                                 color: AppColor.bgSideMenu,
    //                                 elevation: 15,
    //                                 child: Column(
    //                                   mainAxisSize: MainAxisSize.min,
    //                                   children: <Widget>[
    //                                     Padding(
    //                                       padding: const EdgeInsets.all(20.0),
    //                                       child: Row(
    //                                         children: <Widget>[
    //                                           IconButton(
    //                                               icon: Icon(Icons.person),
    //                                               onPressed: null),
    //                                           Expanded(
    //                                             child: Container(
    //                                               margin: EdgeInsets.only(
    //                                                   right: 20, left: 10),
    //                                               child: TextField(
    //                                                 decoration: InputDecoration(
    //                                                     hintText: 'eMail'),
    //                                               ),
    //                                             ),
    //                                           )
    //                                         ],
    //                                       ),
    //                                     ),
    //                                     Padding(
    //                                       padding: const EdgeInsets.all(20.0),
    //                                       child: Row(
    //                                         children: <Widget>[
    //                                           IconButton(
    //                                               icon: Icon(Icons.lock),
    //                                               onPressed: null),
    //                                           Expanded(
    //                                             child: Container(
    //                                               margin: EdgeInsets.only(
    //                                                   right: 20, left: 10),
    //                                               child: TextField(
    //                                                 decoration: InputDecoration(
    //                                                     hintText: 'Šifra'),
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           FadeAnimation(
    //                             1.2,
    //                             Padding(
    //                               padding: const EdgeInsets.all(5.0),
    //                               child: Container(
    //                                 height: 45,
    //                                 width: 200,
    //                                 decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.circular(5.0),
    //                                   color: Colors.lightBlue,
    //                                   boxShadow: [
    //                                     BoxShadow(
    //                                       color: Colors.grey,
    //                                       blurRadius: 2.0,
    //                                       spreadRadius: 0.0,
    //                                       offset: Offset(2.0,
    //                                           2.0), // shadow direction: bottom right
    //                                     )
    //                                   ],
    //                                 ),
    //                                 child: Center(
    //                                   child: Text(
    //                                     'Prijavi me',
    //                                     style: TextStyle(
    //                                       fontSize: 20.0,
    //                                       fontWeight: FontWeight.bold,
    //                                       color: Colors.white,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           FadeAnimation(
    //                               1.3,
    //                               Row(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 children: <Widget>[
    //                                   Text("Nemate korisnički račun?"),
    //                                   GestureDetector(
    //                                     onTap: () {
    //                                       Navigator.pushNamed(context, 'SignUp');
    //                                     },
    //                                     child: Text(
    //                                       "Registrirajte se",
    //                                       style: TextStyle(
    //                                           fontWeight: FontWeight.w600,
    //                                           fontSize: 16),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ))
    //                         ],
    //                       ),
    //                     ),
                      
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );