import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    _currentUser();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: _width,
            height: _height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("HOME")
                  ],
                )
              ],
            )),
      ),
    );
  }

  void _currentUser() async{
    await FirebaseAuth.instance.currentUser().then((_user) {

      if(_user == null)
        return null;

      debugPrint(_user.phoneNumber);
      debugPrint(_user.displayName);
      debugPrint(_user.uid);
      debugPrint(_user.isEmailVerified.toString());
    });
  }
}
