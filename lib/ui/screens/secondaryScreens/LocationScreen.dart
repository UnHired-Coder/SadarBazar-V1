import 'dart:async';
import 'dart:convert';
import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/User/User.dart';
import 'package:bazar/models/User/UserAddress.dart';
import 'package:bazar/util/loader/UserDataLoadUtil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationChooserState createState() => _LocationChooserState();
}

class _LocationChooserState extends State<LocationScreen> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _center;
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition;
  MapType _currentMapType = MapType.normal;
  String _title = "";
  String _detail = "";

  TextEditingController _lane1;
  TextEditingController _lane2;
  TextEditingController _lane3;

  @override
  void initState() {
    super.initState();
    _lane1 = new TextEditingController();
    _lane2 = new TextEditingController();
    _center = new LatLng(28.7391217409738, 77.18554090708494);
    _setAddress();
  }

  @override
  void dispose() {
    _lastMapPosition = _center;
    super.dispose();
  }

  _setAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserAddress address =
        UserAddress.fromJson(jsonDecode(prefs.getString("AddressPref")));
    setState(() {
      _lane1.text = address.addressFull;
      _lane2.text = address.addressPostCode;
      _center = new LatLng(
          double.parse(address.latitude), double.parse(address.longitude));
      _lastMapPosition = _center;
      debugPrint("Lat +" + address.latitude + " " + address.longitude);
    });

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(_center.latitude, _center.longitude), zoom: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: false,
              //              myLocationEnabled: true,
              //              myLocationButtonEnabled:true,
              zoomControlsEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition:
                  CameraPosition(target: _center, zoom: 11.0),
              markers: _markers,
              mapType: _currentMapType,
              onCameraMove: _onCameraMove,
              onTap: _handleTap,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    _customButton(
                        FontAwesomeIcons.map, _onMapTypeButtonPressed),
                    SizedBox(
                      height: 15,
                    ),
                    _customButton(
                        FontAwesomeIcons.mapMarker, _onAddMarkerButtonPressed),
                    SizedBox(
                      height: 5,
                    ),
                    _customButton(FontAwesomeIcons.mapPin, _getUserLocation),
                  ],
                ),
              ),
            ),
            SlidingUpPanel(
                minHeight: _height * 0.05,
                maxHeight: _height * 0.8,
                panel: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 4,
                            width: _width * 0.1,
                            color: Orange,
                            margin: EdgeInsets.all(1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            debugPrint("Save Address");
                            UserDataLoadUtil.getUser(context)
                                .then((value) async {
                              UserAddress address = new UserAddress(
                                  addressId: value.userId,
                                  addressFull: _lane1.text,
                                  addressPostCode: _lane2.text,
                                  addressCountry: "null",
                                  addressPhone: value.userContact,
                                  addressCity: "null",
                                  latitude: _center.latitude.toString(),
                                  longitude: _center.longitude.toString());
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs
                                  .setString("AddressPref",
                                      jsonEncode(address.toJson()))
                                  .then((value) {
                                debugPrint("Address Updated  Code " +
                                    value.toString());
                                if (value) {
                                  FlutterToast(context).showToast(
                                      child: Text("Address Updated"));
                                } else
                                  FlutterToast(context).showToast(
                                      child: Text(
                                          "Some Error Occurred while Updating,\nmake  sure to enable storage permission"));
                              });
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: _width * 0.15,
                            margin: EdgeInsets.only(right: 20),
                            height: 30,
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 6, bottom: 6),
                            decoration: BoxDecoration(
                                color: Orange,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: White,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        color: White,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: _height * 0.2,
                              width: _width * 0.8,
                              color: White,
                              child: TextField(
                                maxLines: 4,
                                controller: _lane1,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide:
                                          BorderSide(width: 1, color: Orange),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide:
                                          BorderSide(width: 1, color: Maroon),
                                    ),
                                    errorStyle: TextStyle(
                                        color: Orange.withOpacity(0.5)),
                                    labelStyle: TextStyle(
                                        color: Orange.withOpacity(0.5)),
                                    labelText: "Address "),
                                cursorColor: Orange,
                              ),
                            ),
                            Container(
                              height: 60,
                              width: _width * 0.8,
                              color: White,
                              child: TextField(
                                maxLines: 1,
                                controller: _lane2,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide:
                                          BorderSide(width: 1, color: Orange),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide:
                                          BorderSide(width: 1, color: Maroon),
                                    ),
                                    errorStyle: TextStyle(
                                        color: Orange.withOpacity(0.5)),
                                    labelStyle: TextStyle(
                                        color: Orange.withOpacity(0.5)),
                                    labelText: "Pin "),
                                cursorColor: Orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                body: null)
          ],
        ),
        //      floatingActionButton: FloatingActionButton.extended(
        //        onPressed: _goToTheLake,
        //        label: Text('To the lake!'),
        //        icon: Icon(Icons.directions_boat),
        //      ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _customButton(IconData icon, Function function) {
    return FloatingActionButton(
      heroTag: icon.codePoint,
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: White,
      child: Icon(
        icon,
        size: 16,
        color: Maroon,
      ),
    );
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    _markers.clear();
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(title: _title, snippet: _detail),
          icon: BitmapDescriptor.defaultMarker));
    });
  }

  _handleTap(LatLng point) {
    _markers.clear();
    _getLocation(point);
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(title: _title, snippet: _detail),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ));
    });
  }

  _getLocation(LatLng point) async {
    final coordinates = new Coordinates(point.latitude, point.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");

    setState(() {
      _title = first.featureName;
      _detail = first.addressLine;
      _lane1.text = _title + "   " + _detail;
      _lane2.text = first.postalCode;
      _center = new LatLng(point.latitude, point.longitude);
      _lastMapPosition = new LatLng(point.latitude, point.longitude);
    });
  }

  _getUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 16),
      ),
    );

    setState(() {
      _title = first.featureName;
      _detail = first.addressLine;
      _lane1.text = _title + "   " + _detail;
      _lane2.text = first.postalCode;
      _center = new LatLng(position.latitude, position.longitude);
      _lastMapPosition = new LatLng(position.latitude, position.longitude);
    });
  }
}
