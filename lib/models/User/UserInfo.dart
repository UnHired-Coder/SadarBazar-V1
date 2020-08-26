// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserInfo {
  UserInfo({
    @required this.infoId,
    @required this.userId,
    @required this.gender,
    @required this.userAddressId,
  });

  final String infoId;
  final String userId;
  final String gender;
  final String userAddressId;

  factory UserInfo.fromRawJson(String str) => UserInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    infoId: json["infoID"],
    userId: json["userId"],
    gender: json["gender"],
    userAddressId: json["userAddressId"],
  );

  Map<String, dynamic> toJson() => {
    "infoID": infoId,
    "userId": userId,
    "gender": gender,
    "userAddressId": userAddressId,
  };
}
