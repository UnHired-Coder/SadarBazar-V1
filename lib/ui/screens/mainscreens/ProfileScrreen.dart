import 'dart:async';

import 'package:bazar/ui/screens/secondaryScreens/LocationScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: IconButton(
            icon: Icon(FontAwesomeIcons.arrowRight),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LocationScreen()));
            }),
      ),
    );
  }
}
