// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rider_app/AllScreen/Login_Screen.dart';
import 'package:rider_app/AllScreen/mainscreen.dart';
import 'package:rider_app/AllWidget/ProgressDailog.dart';
import 'package:rider_app/main.dart';

class RegistrationScreen extends StatelessWidget {
  static const String idScreen = 'registrationscreen';
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmpasswordTextEditingController =
      TextEditingController();
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 65.0),
              Hero(
                tag: 'imageLogo',
                child: const Image(
                  image: AssetImage("images/logo.png"),
                  width: 180.0,
                  height: 180.0,
                ),
              ),
              const SizedBox(height: 15.0),
              const Text(
                'Register as a Rider',
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
                      //Name TextField
                      TextField(
                        controller: nameTextEditingController,
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

                          labelText: 'Name',
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
                      //Email
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
                      //Phone
                      TextField(
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.phone,
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

                          labelText: 'Phone',
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
                      //Password
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
                      //confirm Password
                      TextField(
                        controller: confirmpasswordTextEditingController,
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

                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black12,
                          ),
                          suffixIcon: num == 0
                              ? Icon(Icons.visibility,
                                  color: Colors.grey, size: 18.0)
                              : Icon(Icons.visibility_off,
                                  color: Colors.grey, size: 18.0),
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
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                            ),
                            onPressed: () {
                              print('here');
                              if (nameTextEditingController.text.length < 3) {
                                displayMessage(
                                    context, 'Name should be more than 3');
                              } else if (!emailTextEditingController.text
                                  .contains('@')) {
                                displayMessage(
                                    context, 'Invalid Email Address');
                              } else if (phoneTextEditingController
                                      .text.length <
                                  5) {
                                displayMessage(
                                    context, 'Incorrect PhoneNumber');
                              } else if (passwordTextEditingController
                                      .text.length <
                                  5) {
                                displayMessage(context,
                                    'Password should be atleast 6 characters');
                              } else if (passwordTextEditingController.text !=
                                  confirmpasswordTextEditingController.text) {
                                displayMessage(
                                    context, 'Password does\'nt Match!!');
                              } else {
                                registerNewUser(context);
                              }
                            },
                            child: Text(
                              'Create Account',
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
                            Navigator.pushNamedAndRemoveUntil(context,
                                LoginScreen.idScreen, (route) => false);
                          },
                          child: Text(
                            'Already have an Account? Login Here',
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
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  registerNewUser(BuildContext context) async {
    //Progress Circulation
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            ProgressDialog(message: 'Registering user,  Please wait...'));

    final fireBaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((onError) {
      Navigator.pop(context);
      displayMessage(context, onError.toString());
    }))
        .user;
    print('seeing values');

    if (fireBaseUser != null) {
      //Save user details
      print('Not Null');
      usersRef.child(fireBaseUser.uid); //User Created

      //Getting user info
      Map userDataMap = {
        'name': nameTextEditingController.text,
        'email': emailTextEditingController.text,
        'phone': phoneTextEditingController.text,
      };

      usersRef.child(fireBaseUser.uid).set(userDataMap); //Data saved

      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.idScreen, (route) => false);
    } else {
      Navigator.pop(context);
      displayMessage(context, 'User Not Created');
    }
  }
}

displayMessage(BuildContext context, String message) {
  Fluttertoast.showToast(msg: message);
}
