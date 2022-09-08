// ignore_for_file: file_names, duplicate_import, use_key_in_widget_constructors, unnecessary_new, library_private_types_in_public_api, sort_child_properties_last, prefer_const_constructors, deprecated_member_use, unused_element, unnecessary_null_comparison, prefer_is_empty, avoid_print, use_build_context_synchronously

import 'package:compinfo/API/api_put.dart';


import 'package:flutter/material.dart';
//import 'package:flutter_shared_preferences/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool user = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('user') != null) {
      setState(() {
        user = prefs.getBool('user')!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xffF5F6F8),
        fontFamily: "Nunito",
      ),
      title: 'Shared Preference',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('WELCOME'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            const Text('You are a new user sign in first'),
            SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Signin()));
                },
                child: Text('Signin')),
            SizedBox(height: 30.0),
            Text('Alredy a user ,login'),
            SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: Text('Login')),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    )));
  }
}

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

TextEditingController _username = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _seqans = TextEditingController();
  bool isLoading = false;

class _SigninState extends State<Signin> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signin Page'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "WELCOME",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "sign in page",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        TextField(
                            controller: _username,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                size: 20,
                              ),
                              hintText: 'Username',
                              contentPadding:
                                  const EdgeInsets.only(bottom: 8.0, top: 8.0),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            )),
                        TextField(
                            controller: _phonenumber,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                size: 20,
                              ),
                              hintText: 'PhoneNumber',
                              contentPadding:
                                  const EdgeInsets.only(bottom: 8.0, top: 8.0),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            )),
                        TextField(
                            obscureText: true,
                            controller: _pass,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                size: 20,
                              ),
                              hintText: 'Password',
                              contentPadding:
                                  const EdgeInsets.only(bottom: 8.0, top: 8.0),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            )),
                        TextField(
                            controller: _email,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                size: 20,
                              ),
                              hintText: 'MailId',
                              contentPadding:
                                  const EdgeInsets.only(bottom: 8.0, top: 8.0),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            )),
                        TextField(
                            controller: _seqans,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                size: 20,
                              ),
                              hintText: 'Your Birth District(caps)',
                              contentPadding:
                                  const EdgeInsets.only(bottom: 8.0, top: 8.0),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffF3AB0D)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                      ),
                      onPressed: _signin,
                      child: Text(
                        "SIGNUP".toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: 80.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signin() async {
    if (_username.text.isNotEmpty && _pass.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      Future.delayed(Duration(seconds: 1), () {
        prefs.setBool('user', true);
        prefs.setString('username', _username.text);
        prefs.setString('password', _pass.text);
        prefs.setString('phonenumber', _phonenumber.text);
        prefs.setString('mail', _email.text);
        prefs.setString('seqans', _seqans.text);

        late String? sample = prefs.getString('username');
        print(sample);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      });
    }
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String? username;

  @override
  void initState() {
    super.initState();
    name();
  }

  void name() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
    });
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    //prefs.setString('username', username!);
    //prefs.setString('fullname', fullname!);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Signin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color(0xffF3AB0D),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.logout), onPressed: _logOut)
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Hai, welcome $username",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text('click here to start'),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyAppPut()));
                        },
                        child: Text('click me'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool isLoading = false;

  Future<void> _login() async {
    if (_username.text.isNotEmpty && _pass.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      Future.delayed(Duration(seconds: 1), () {
        prefs.setBool('user', true);
        // prefs.setString('username', _username.text);
        // prefs.setString('password', _pass.text);
        late String? user = prefs.getString('username');
        late String? pass = prefs.getString('password');
        if (_username.text == user && _pass.text == pass) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "welcome",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              // backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        TextField(
                            controller: _username,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                size: 20,
                              ),
                              hintText: 'Username',
                              contentPadding:
                                  const EdgeInsets.only(bottom: 8.0, top: 8.0),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            )),
                        TextField(
                            obscureText: true,
                            controller: _pass,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                size: 20,
                              ),
                              hintText: 'Password',
                              contentPadding:
                                  const EdgeInsets.only(bottom: 8.0, top: 8.0),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffF3AB0D)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                      ),
                      onPressed: _login,
                      child: Text(
                        "LOGIN".toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForPass()));
                      },
                      child: Text('Forgot password ?')),
                  SizedBox(height: 80.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForPass extends StatefulWidget {
  const ForPass({Key? key}) : super(key: key);

  @override
  State<ForPass> createState() => _ForPassState();
}

 TextEditingController _emailreset = TextEditingController();
  TextEditingController _seqansreset = TextEditingController();
  TextEditingController _passreset = TextEditingController();
  

class _ForPassState extends State<ForPass> {
 
bool isLoading = false;
  Future<void> _reset() async {
    if (_emailreset.text.isNotEmpty && _seqansreset.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      Future.delayed(Duration(seconds: 1), () {
        prefs.setBool('user', true);
        // prefs.setString('username', _username.text);
        // prefs.setString('password', _pass.text);
        late String? mailreset = prefs.getString('username');
        late String? dupseqansreset = prefs.getString('password');
        if (_emailreset.text == mailreset &&
            _seqansreset.text == dupseqansreset) {
          prefs.setString('password', _passreset.text);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Forgot Page'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(children: [
          TextField(
              controller: _emailreset,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  size: 20,
                ),
                hintText: 'MailId',
                contentPadding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              )),
          TextField(
              controller: _seqansreset,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  size: 20,
                ),
                hintText: 'Your Birth District(caps)',
                contentPadding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              )),
          TextField(
              controller: _passreset,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  size: 20,
                ),
                hintText: 'New Password',
                contentPadding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextButton(
              style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffF3AB0D)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
              ),
              onPressed: _reset,
              child: Text(
                "Reset".toUpperCase(),
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
