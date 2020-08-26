import 'dart:async';

import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/User/User.dart';
import 'package:bazar/ui/screens/popup/EditProfilePopup.dart';
import 'package:bazar/ui/screens/secondaryScreens/CardDetailsScreen.dart';
import 'package:bazar/ui/screens/secondaryScreens/FavouritesScreen.dart';
import 'package:bazar/ui/screens/secondaryScreens/LocationScreen.dart';
import 'package:bazar/ui/screens/secondaryScreens/OrdersScreen.dart';
import 'package:bazar/ui/widgets/animated/AnimatedCartButton.dart';
import 'package:bazar/ui/widgets/animated/AnimatedNotificationButton.dart';
import 'package:bazar/util/loader/UserDataLoadUtil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<User> _user;
  User user;

  @override
  void initState() {
    _user = UserDataLoadUtil.getUser(context);
    _user.then((value) => user = value);
    
    
    Firestore.instance.collection("GlobalDataBase").getDocuments().then((value) => {
      debugPrint(value.toString())
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Maroon,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Account",
              style: TextStyle(
                  color: White, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedCartButton(cartButtonCallback: null),
                AnimatedNotificationButton()
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: _width,
              height: _height * 0.35,
              color: Maroon,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: FakeWhite,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: White, width: 6)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: _width,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: FutureBuilder(
                          builder: (context, val) {
                            if (val.hasData && (val.hasError == false))
                              return Text(
                                val.data.userName == "null"
                                    ? "No Name"
                                    : val.data.userName+" "+ val.data.userLastName,
                                style: TextStyle(
                                    color: White,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              );
                            else
                              return Text(
                                "Edit  Name",
                                style: TextStyle(
                                    color: White,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              );
                          },
                          future: _user,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                FontAwesomeIcons.phoneAlt,
                                color: FakeWhite,
                                size: 14,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "+ 7982271840",
                              style: TextStyle(
                                  color: White,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.pen,
                                color: White,
                                size: 14,
                              ),
                              onPressed: () {
                                debugPrint("Edit Profile");

                                if(user!=null)
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return EditProfilePopup(user: user,);
                                    }));
                              }),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  cardWidget("My Orders", FontAwesomeIcons.shoppingCart,
                      "View All Orders", () {
                        debugPrint("View All Orders");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrdersScreen(),
                            ));
                      }, _width, _height),
                  cardWidget("My Favourites", FontAwesomeIcons.solidHeart,
                      "View All Favourites", () {
                        debugPrint("View All Favourites");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FavouritesScreen(),
                            ));
                      }, _width, _height),
                  cardWidget("My Cards & Wallets", FontAwesomeIcons.wallet,
                      "View Details", () {
                        debugPrint("View Card Details");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CardDetailsScreen(),
                            ));
                      }, _width, _height),
                  cardWidget("Address ", FontAwesomeIcons.mapPin, "Edit/View",
                          () {
                        debugPrint("View  Address");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationScreen(),
                            ));
                      }, _width, _height,
                      widget: Container(
                          child: Text(
                            "G -45/4 Kabul lines ,Delhi Cant, 110010 ",
                            style: TextStyle(color: Black.withOpacity(0.4)),
                          ))),
                ],
              ),
            ),
            Container(
              width: _width,
              height: _height * 0.05,
              color: FakeWhite,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bottomTiles("Language Settings", Icons.translate, "", () {
                    debugPrint("Language Settings");
                  }, _width, _height),
                  bottomTiles("Profile Settings", Icons.settings, "", () {
                    debugPrint("Profile Settings");
                  }, _width, _height),
                  bottomTiles("Preferences", FontAwesomeIcons.objectGroup, "",
                          () {
                        debugPrint("Preferences Settings");
                      }, _width, _height),
                  bottomTiles("Logout", FontAwesomeIcons.signOutAlt, "", () {
                    debugPrint("Logout Device");
                  }, _width, _height),
                  SizedBox(
                    height: 20,
                  ),
                  bottomTiles("Report problem", FontAwesomeIcons.bug, "", () {
                    debugPrint("Report Problem");
                  }, _width, _height),
                  bottomTiles("Frequent Q&A", FontAwesomeIcons.question, "",
                          () {
                        debugPrint("Frequent Q&A ");
                      }, _width, _height),
                  bottomTiles("Contact Support", FontAwesomeIcons.comment, "",
                          () {
                        debugPrint("Contact Support");
                      }, _width, _height),
                  Container(
                    height: _height * 0.1,
                    width: _width,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            child: Text(
                              "Sadar Bazar INC",
                              style: TextStyle(
                                  color: LightBlack.withOpacity(0.5)),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            child: Text("RT - 121 -West delhi, Delhi -110013",
                                style: TextStyle(
                                    color: LightBlack.withOpacity(0.5))))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTiles(String label, IconData iconData, String subLabel,
      Function function, double W, double H,
      {Widget widget}) {
    return Container(
      height: H * 0.06,
      width: W,
      color: White,
      child: InkWell(
        onTap: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              iconData,
              color: LightBlack,
              size: 14,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: TextStyle(color: LightBlack),
            )
          ],
        ),
      ),
    );
  }

  Widget cardWidget(String label, IconData iconData, String subLabel,
      Function function, double W, double H,
      {Widget widget}) {
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 1,
      child: Container(
        height: H * 0.1,
        width: W * 0.9,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        iconData,
                        color: LightBlack,
                        size: 14,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        label,
                        style: TextStyle(color: LightBlack),
                      ),
                    ],
                  ),
                )),
            Expanded(
                child: Container(
                  child: InkWell(
                      onTap: function,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (widget != null) ? widget : Container(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                subLabel,
                                style: TextStyle(color: Maroon),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                FontAwesomeIcons.arrowRight,
                                color: LightBlack,
                                size: 14,
                              )
                            ],
                          ),
                        ],
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
