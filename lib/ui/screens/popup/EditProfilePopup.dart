import 'dart:convert';

import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/User/User.dart';
import 'package:bazar/models/User/UserAddress.dart';
import 'package:bazar/ui/screens/secondaryScreens/LocationScreen.dart';
import 'package:bazar/util/loader/UserDataLoadUtil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePopup extends StatefulWidget {
  final User user;

  EditProfilePopup({this.user});

  @override
  _EditProfilePopupState createState() => _EditProfilePopupState();
}

class _EditProfilePopupState extends State<EditProfilePopup> {
  ValueNotifier<String> selectedGender;
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;

  @override
  void initState() {
    selectedGender = new ValueNotifier(widget.user.gender);
    _firstNameController = new TextEditingController();
    _lastNameController = new TextEditingController();

    _firstNameController.text =
        widget.user.userName == "null" ? "" : widget.user.userName;
    _lastNameController.text =
        widget.user.userLastName == "null" ? "" : widget.user.userLastName;
    super.initState();
  }
  UserAddress address;
  Future<String> _setAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    address = UserAddress.fromJson(jsonDecode(prefs.getString("AddressPref")));
    return address.addressFull;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: White,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Edit Profile"),
            RaisedButton(
              color: Maroon,
              onPressed: () {
                _updateData();
              },
              child: Text(
                "Save",
                style: TextStyle(color: White),
              ),
            )
          ],
        ),
        backgroundColor: Maroon,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Card(
              child: Container(
                height: _height * 0.3,
                width: _width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      child: (widget.user.userProfileUrl == "null")
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FakeWhite,
                                    border:
                                        Border.all(color: LightBlack, width: 2),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.camera,
                                  color: LightBlack.withOpacity(0.5),
                                )
                              ],
                            )
                          : Container(),
                      decoration: BoxDecoration(
                        border: Border.all(color: FakeWhite, width: 2),
                        borderRadius: BorderRadius.circular(100),
                        image: (widget.user.userProfileUrl == "null")
                            ? null
                            : DecorationImage(
                                image:
                                    NetworkImage(widget.user.userProfileUrl)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: _width,
                      alignment: Alignment.center,
                      child: Text(
                        widget.user.userContact == "null"
                            ? "Not Found"
                            : widget.user.userContact,
                        style: TextStyle(
                            fontSize: 16,
                            color: LightBlack.withOpacity(0.5),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
//            SizedBox(
//              height: 10,
//            ),
            Card(
              child: Container(
                height: _height * 0.3,
                width: _width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text("First Name"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: _width * 0.8,
                          child: TextField(
                            controller: _firstNameController,
                            autofocus: false,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(width: 1, color: Orange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(width: 1, color: LightBlack),
                              ),
                              labelStyle:
                                  TextStyle(color: LightBlack.withOpacity(0.5)),
                            ),
                            cursorColor: LightBlack,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text("Last Name"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          width: _width * 0.8,
                          child: TextField(
                            controller: _lastNameController,
                            autofocus: false,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(width: 1, color: Orange),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(width: 1, color: LightBlack),
                              ),
                              labelStyle:
                                  TextStyle(color: LightBlack.withOpacity(0.5)),
                            ),
                            cursorColor: LightBlack,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
//            SizedBox(
//              height: 10,
//            ),
            Card(
              child: Container(
                height: _height * 0.2,
                width: _width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    ValueListenableBuilder(
                        valueListenable: selectedGender,
                        builder: (context, hasError, val) {
                          return InkWell(
                            child: Opacity(
                                opacity: (selectedGender.value == "0") ? 1 : 0.3,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Black,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Icon(
                                    FontAwesomeIcons.male,
                                    size: 30,
                                    color: Maroon,
                                  ),
                                )),
                            onTap: () {
                              selectedGender.value = "0";
                              debugPrint("Male");
                            },
                          );
                        }),
                    Text("Or"),
                    ValueListenableBuilder(
                        valueListenable: selectedGender,
                        builder: (context, hasError, val) {
                          return InkWell(
                            child: Opacity(
                                opacity: (selectedGender.value == "1") ? 1 : 0.3,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Black,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Icon(
                                    FontAwesomeIcons.female,
                                    size: 30,
                                    color: Maroon,
                                  ),
                                )),
                            onTap: () {
                              selectedGender.value = "1";
                              debugPrint("Female");
                            },
                          );
                        }),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
//            SizedBox(
//              height: 10,
//            ),
            Card(
              color: White,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocationScreen(),
                      ));
                },
                child: Container(
                  height: _height * 0.2,
                  width: _width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.mapPin,
                        color: Maroon,
                        size: 18,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: _width * 0.8,
                        height: 60,
                        alignment: Alignment.center,
                        child: FutureBuilder(
                            future: _setAddress(),
                            builder: (context, val) {
                              if (val.hasData &&
                                  (!val.hasError)) {
                                String res = val.data.toString();
                                return Text(
                                  res.substring(
                                      0,
                                      res.length > 60
                                          ? 60
                                          : res.length) +
                                      "..",
                                  style: TextStyle(
                                      color:
                                      Black.withOpacity(0.4)),
                                );
                              } else
                                return Container(child: Text("Enter Address",style: TextStyle(color: LightBlack.withOpacity(0.5)),),);
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
//            SizedBox(
//              height: 50,
//            ),
          ],
        ),
      ),
    );
  }

  void _updateData() {
    UserDataLoadUtil.updateData(
      widget.user.userId,
      new User(
          userId: widget.user.userId,
          userContact: widget.user.userContact,
          userInfoId: widget.user.userId,
          userProfileUrl: widget.user.userProfileUrl == "null"
              ? ""
              : widget.user.userProfileUrl,
          userName: _firstNameController.text == ""
              ? "null"
              : _firstNameController.text,
          userLastName: _lastNameController.text == ""
              ? "null"
              : _lastNameController.text,
          infoId: widget.user.userId,
          gender: selectedGender.value.toString(),
          userAddressId: widget.user.userId),
    );
  }
}
