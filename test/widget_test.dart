// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rider_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

// if (snap.value != null) {
// print('Signing ohh');
// Navigator.pushNamedAndRemoveUntil(
// context, MainScreen.idScreen, (route) => false);
// displayMessage(context, 'You are logged in');
// } else {
// _loginAuth.signOut();
// displayMessage(
// context, 'Record Does\'nt, Create a new account');
// }

// Positioned(
// top: 300.0,
// right: 14.0,
// child: Container(
// child: ClipOval(
// child: Material(
// color: Colors.grey, // button color
// child: InkWell(
// splashColor: Colors.white, // inkwell color
// child: SizedBox(
// width: 50,
// height: 50,
// child: Icon(Icons.my_location_outlined),
// ),
// onTap: () async {
// Position myNewPosition =
//     await determinePositionAgain();
//
// newGoogleMapController?.animateCamera(
// CameraUpdate.newCameraPosition(CameraPosition(
// target: LatLng(myNewPosition.latitude,
// myNewPosition.longitude),
// zoom: 14)));
//
// setState(() {});
// })),
// ),
// ),
//),
