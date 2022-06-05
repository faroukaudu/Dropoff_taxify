import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/AllScreen/Login_Screen.dart';
import 'package:rider_app/AllScreen/mainscreen.dart';
import 'package:rider_app/AllScreen/registration_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.ref().child('users');

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "bolt",
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: MainScreen.idScreen,
      routes: {
        LoginScreen.idScreen: (context) => LoginScreen(),
        RegistrationScreen.idScreen: (context) => RegistrationScreen(),
        MainScreen.idScreen: (context) => MainScreen()
      },
    );
  }
}
