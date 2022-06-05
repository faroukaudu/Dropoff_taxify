// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ripple/flutter_ripple.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/AllWidget/divider.dart';
import 'package:rider_app/GeolocateServices.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = 'mainscreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  // ignore: unused_field, prefer_const_constructors

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: const LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  //UserPosition
  Position? currentPosition;
  Geolocator geolocator = Geolocator();
  double mapBottomPadding = 0;

  Future locatePosition() async {
    Position position = await GeolocateServices().determinePosition();
    currentPosition = position;
    print(' my latitude is: ${position.latitude}');

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        // ignore: unnecessary_new
        new CameraPosition(target: latLngPosition, zoom: 14);

    CameraUpdate update = CameraUpdate.newCameraPosition(cameraPosition);
    CameraUpdate zoom = CameraUpdate.zoomTo(16);
    newGoogleMapController?.moveCamera(update);

    // newGoogleMapController
    //     ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentLatLng;

  Future getLocation() async {
    await locatePosition();
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((currLocation) {
      setState(() {
        currentLatLng = LatLng(currLocation.latitude, currLocation.longitude);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //locatePosition();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text("Rider App"),
        ),
        drawer: Container(
          width: 255.0,
          color: Colors.white,
          child: ListView(
            children: [
              //Drawer Header
              Container(
                height: 165.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Image.asset('images/user_icon.png',
                          width: 74.0, height: 74.0),
                      SizedBox(width: 16.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Profile Name',
                            style: TextStyle(
                                fontSize: 16.0, fontFamily: "Brand-Bold"),
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            'Visit Profile',
                            style: TextStyle(
                                fontSize: 13.0, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              DividerWidget(),
              SizedBox(height: 12.0),

              //Drawer body controller
              ListTile(
                leading: Icon(Icons.history),
                title: Text(
                  'History',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Visit Profile',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
        body: currentLatLng == null
            ? Center(
                child: GestureDetector(
                  onTap: () {
                    getLocation();
                  },
                  child: FlutterRipple(
                    child: Text("Finding Location"),
                    rippleColor: Colors.blue,
                  ),
                ),
              )
            : Stack(
                children: [
                  GoogleMap(
                    padding: EdgeInsets.only(bottom: mapBottomPadding),
                    mapType: MapType.normal,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: currentLatLng != null
                        ? CameraPosition(target: currentLatLng!, zoom: 14.0)
                        : _kGooglePlex,

                    //FOR Location
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    //end
                    onMapCreated: (GoogleMapController controller) {
                      print('AM RUNNING HERE');
                      //locatePosition();
                      // print(_isLocationGranted);
                      //Location Call
                      // permissionGranted();

                      _controllerGoogleMap.complete(controller);
                      newGoogleMapController;

                      setState(() {
                        mapBottomPadding = 290.0;
                      });
                    },
                  ),

                  //HamburgerButton for Drawer
                  Positioned(
                    top: 10.0,
                    left: 12.0,
                    child: GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 6.0,
                                  spreadRadius: 0.5,
                                  offset: Offset(0.7, 0.7)),
                            ]),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.menu,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    right: 0.0,
                    left: 0.0,
                    bottom: 0.0,
                    child: Container(
                      height: 300,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 16.0,
                              spreadRadius: 0.5,
                              offset: Offset(0.7, 0.7),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 6.0),
                            const Text(
                              'Hi here',
                              style: TextStyle(fontSize: 12.0),
                            ),
                            const Text(
                              'Where to?',
                              style: TextStyle(fontSize: 15.0),
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 6.0,
                                      spreadRadius: 0.5,
                                      offset: Offset(0.7, 0.7),
                                    ),
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Row(
                                  children: const [
                                    Icon(Icons.search,
                                        color: Colors.blueAccent),
                                    SizedBox(width: 10.0),
                                    Text('Search Drop Off'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 24.0),
                            Row(
                              children: [
                                const Icon(Icons.home, color: Colors.grey),
                                const SizedBox(width: 12.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Add Home'),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      'Your Living Home Address',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[300]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10.0),
                            DividerWidget(),
                            SizedBox(height: 10.0),
                            Row(
                              children: [
                                const Icon(Icons.work, color: Colors.grey),
                                const SizedBox(width: 12.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Add Work'),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      'Your Office Address',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[300]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ));
  }
}
