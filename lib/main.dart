// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, unused_import

import 'package:compinfo/LoginPage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_shared_preferences/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(
    const MyApp(),
  );
}






































//

//
//
//
//// ignore_for_file: unnecessary_new, use_key_in_widget_constructors, prefer_const_constructors
//
//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//Future<SharedPreferences> localStorage =SharedPreferences.getInstance()
//
//TextEditingController emailController = new TextEditingController();
//TextEditingController pwdController = new TextEditingController();
//
//class MyApp extends StatelessWidget {
//  static Future init() async {
//    //localStorage = await SharedPreferences.getInstance();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // ignore: todo
//    // TODO: implement build
//    return MaterialApp(
//      home: MyHome(),
//    );
//  }
//}
//
//class MyHome extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // ignore: todo
//    // TODO: implement build
//    return Scaffold(
//      body: Padding(
//        padding: const EdgeInsets.all(30.0),
//        child: Center(
//          child: Column(
//            children: <Widget>[
//              const Padding(
//                padding: EdgeInsets.only(top: 200),
//              ),
//              Container(
//                margin: const EdgeInsets.symmetric(vertical: 10),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    const Text(
//                      "Email Id:",
//                      style:
//                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                    ),
//                    const SizedBox(
//                      height: 10,
//                    ),
//                    TextField(
//                        controller: emailController,
//                        obscureText: false,
//                        decoration: InputDecoration(
//                            border: InputBorder.none,
//                            fillColor: Color(0xfff3f3f4),
//                            filled: true))
//                  ],
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.symmetric(vertical: 10),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      "Password :",
//                      style:
//                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                    ),
//                    SizedBox(
//                      height: 10,
//                    ),
//                    TextField(
//                        controller: pwdController,
//                        obscureText: true,
//                        decoration: InputDecoration(
//                            border: InputBorder.none,
//                            fillColor: Color(0xfff3f3f4),
//                            filled: true))
//                  ],
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 50),
//              ),
//              ElevatedButton(
//                onPressed: save,
//                child: Text('Login'),
//              ),
//
//              Padding(
//                padding: EdgeInsets.only(top: 50),
//              ),
//              // if (localStorage != null)
//              Padding(
//                padding: const EdgeInsets.all(15.0),
//                child: Text(
//                  "User Logged in!!! ->  Email Id: ${localStorage.get('email')}  Password: ${localStorage.get('password')}",
//                  style: TextStyle(fontSize: 20),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//save() async {
//  await MyApp.init();
//  localStorage.setString('email', emailController.text.toString());
//  localStorage.setString('password', pwdController.text.toString());
//}
//
//
//
//





//import 'package:compinfo/screens/signin_screen.dart';
//////import 'package:firebase_core/firebase_core.dart';
////import 'package:flutter/material.dart';
////
//////void main() async {
//////  WidgetsFlutterBinding.ensureInitialized();
//////  await Firebase.initializeApp();
//////  runApp(const MyApp());
//////}
//////
////
////void main() {
////  runApp(const MyApp());
////}
////
////class MyApp extends StatelessWidget {
////  const MyApp({Key? key}) : super(key: key);
////
////  @override
////  Widget build(BuildContext context) {
////    return const MaterialApp(
////      title: 'WELCOME',
////      home: SignInScreen(),
////    );
////  }
////}
////