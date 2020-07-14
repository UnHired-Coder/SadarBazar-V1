import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SingleChildScrollView(
          child: Container(
              width: _width,
              height: _height,
              child: DefaultTabController(
                length: 4,
                child: new Scaffold(
                  body: TabBarView(
                    children: [
                      new Container(
                        color: White,
                      ),
                      new Container(
                        color: White,
                      ),
                      new Container(
                        color: White,
                      ),
                      new Container(
                        color: White,
                      ),
                    ],
                  ),
                  bottomNavigationBar: new TabBar(
                    tabs: [
                      Tab(
                        icon: new Icon(Icons.home),
                      ),
                      Tab(
                        icon: new Icon(Icons.rss_feed),
                      ),
                      Tab(
                        icon: new Icon(Icons.perm_identity),
                      ),
                      Tab(icon: new Icon(Icons.settings),)
                    ],
                    labelColor: Orange,
                    unselectedLabelColor: LightBlack,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.all(5.0),
                    indicatorColor: Orange,
                  ),
                ),
              )),
        ),
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

  DateTime currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 1)) {
      currentBackPressTime = now;
      FlutterToast(context).showToast(child: Text("Press back again to exit"));
      return Future.value(false);
    }
    return Future.value(true);
  }
}
