// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rider_app/AllScreen/mainscreen.dart';
import 'package:rider_app/AllScreen/registration_Screen.dart';
import 'package:rider_app/AllWidget/ProgressDailog.dart';
import 'package:rider_app/main.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = 'loginscreen';
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 120.0),
                Hero(
                  tag: 'imageLogo',
                  child: const Image(
                    image: AssetImage("images/logo.png"),
                    width: 230.0,
                    height: 230.0,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Login as a Rider',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailTextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(30.0, 2.0, 20.0, 2.0),
                            focusColor: Colors.grey,
                            hoverColor: Colors.grey,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black45, width: 1.0),
                            ),
                            filled: true,
                            // fillColor: const Color(0x50E6E9F1),
                            fillColor: Colors.white,

                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.black12,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: passwordTextEditingController,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(30.0, 2.0, 20.0, 2.0),
                            focusColor: Colors.grey,
                            hoverColor: Colors.grey,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black45, width: 1.0),
                            ),
                            filled: true,
                            // fillColor: const Color(0x50E6E9F1),
                            fillColor: Colors.white,

                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.black12,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: 50.0,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.yellow.shade700),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                              ),
                              onPressed: () {
                                if (!emailTextEditingController.text
                                    .contains('@')) {
                                  displayMessage(
                                      context, 'Invalid email address');
                                } else if (passwordTextEditingController
                                    .text.isEmpty) {
                                  displayMessage(
                                      context, "Password is Mandatory");
                                } else {
                                  loginUser(context);
                                }

                                print('Logining in');
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ),
                        SizedBox(height: 20.0),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RegistrationScreen.idScreen,
                                  (route) => false);
                            },
                            child: Text(
                              'Do not have an Account? Register Here',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _loginAuth = FirebaseAuth.instance;
  void loginUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            ProgressDialog(message: 'Authenticating, Please wait...'));
    final firebaseuser = (await _loginAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((onError) {
      Navigator.pop(context);
      displayMessage(context, onError.toString());
    }))
        .user;

    //checking if data entered are not empty.
    if (firebaseuser != null) {
      usersRef.child(firebaseuser.uid).once().then((DatabaseEvent snap) {
        if (snap.snapshot.exists) {
          print('Signing ohh');
          Navigator.pushNamedAndRemoveUntil(
              context, MainScreen.idScreen, (route) => false);
          displayMessage(context, 'You are logged in');
        } else {
          Navigator.pop(context);
          _loginAuth.signOut();
          displayMessage(context, 'Record Does\'nt, Create a new account');
        }
      });

      //Navigator.pushNamedAndRemoveUntil(
      //     context, MainScreen.idScreen, (route) => false);
      // displayMessage(context, 'You are logged in');
    } else {
      Navigator.pop(context);
      displayMessage(context, 'Error, Can not loggin');
    }
  }
}
