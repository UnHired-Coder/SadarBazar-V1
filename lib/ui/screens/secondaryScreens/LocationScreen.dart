import 'dart:async';
import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationChooserState createState() => _LocationChooserState();
}

class _LocationChooserState extends State<LocationScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.343434, -122.545454);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;
  String _title = "";
  String _detail = "";

  TextEditingController _lane1;
  TextEditingController _lane2;
  TextEditingController _lane3;

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
              myLocationEnabled: true,
//              myLocationButtonEnabled:true,
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
                maxHeight: _height * 0.4,
                panel: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 4,
                        width: _width * 0.2,
                        color: Orange,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: White,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: _height*0.2,
                              width: _width,
                              color: White,
                              child: TextField(
                                  maxLines: 4,
                                  controller: _lane1,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide:
                                            BorderSide(width: 1, color: Orange),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
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
//                            SizedBox(
//                              height: 10,
//                            ),
//                            Container(
//                              height: 40,
//                              width: _width,
//                              color: White,
//                              child: TextField(
//                                  controller: _lane2,
//                                  decoration: InputDecoration(
//                                      focusedBorder: OutlineInputBorder(
//                                        borderRadius:
//                                        BorderRadius.all(Radius.circular(4)),
//                                        borderSide:
//                                        BorderSide(width: 1, color: Orange),
//                                      ),
//                                      errorBorder: OutlineInputBorder(
//                                        borderRadius:
//                                        BorderRadius.all(Radius.circular(4)),
//                                        borderSide:
//                                        BorderSide(width: 1, color: Maroon),
//                                      ),
//                                      errorStyle: TextStyle(
//                                          color: Orange.withOpacity(0.5)),
//                                      labelStyle: TextStyle(
//                                          color: Orange.withOpacity(0.5)),
//                                      labelText: "Line 2"),
//                                  cursorColor: Orange,
//                                  obscureText: true),),
//                            SizedBox(
//                              height: 10,
//                            ),
//                            Container(
//                              height: 40,
//                              width: _width,
//                              child:TextField(
//                                  controller: _lane3,
//                                  decoration: InputDecoration(
//                                      focusedBorder: OutlineInputBorder(
//                                        borderRadius:
//                                        BorderRadius.all(Radius.circular(4)),
//                                        borderSide:
//                                        BorderSide(width: 1, color: Orange),
//                                      ),
//                                      errorBorder: OutlineInputBorder(
//                                        borderRadius:
//                                        BorderRadius.all(Radius.circular(4)),
//                                        borderSide:
//                                        BorderSide(width: 1, color: Maroon),
//                                      ),
//                                      errorStyle: TextStyle(
//                                          color: Orange.withOpacity(0.5)),
//                                      labelStyle: TextStyle(
//                                          color: Orange.withOpacity(0.5)),
//                                      labelText: "Line 3"),
//                                  cursorColor: Orange,
//                                  obscureText: true),
//                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            debugPrint("Save Address");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: _width * 0.3,
                            height: 40,
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 6, bottom: 6),
                            decoration: BoxDecoration(
                                color: Orange,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  color: White,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
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
    });
  }
}
