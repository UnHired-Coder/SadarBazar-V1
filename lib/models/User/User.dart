// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class User {
  User({
    @required this.userId,
    @required this.userName,
    @required this.userLastName,
    @required this.userContact,
    @required this.userInfoId,
    @required this.userProfileUrl,
    @required this.infoId,
    @required this.gender,
    @required this.userAddressId,
  });

  final String userId;
  final String userName;
  final String userLastName;
  final String userContact;
  final String userInfoId;
  final String userProfileUrl;
  final String infoId;
  final String gender;
  final String userAddressId;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userID"],
        userName: json["userName"],
        userLastName: json["userLastName"],
        userContact: json["userContact"],
        userInfoId: json["userInfoId"],
        userProfileUrl: json["userProfileUrl"],
        infoId: json["infoID"],
        gender: json["gender"],
        userAddressId: json["userAddressId"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "userName": userName,
        "userLastName": userLastName,
        "userContact": userContact,
        "userInfoId": userInfoId,
        "userProfileUrl": userProfileUrl,
        "infoID": infoId,
        "gender": gender,
        "userAddressId": userAddressId,
      };
}
