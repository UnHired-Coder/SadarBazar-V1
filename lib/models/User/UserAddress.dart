// To parse this JSON data, do
//
//     final userAddress = userAddressFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserAddress {
  UserAddress({
    @required this.addressId,
    @required this.addressFull,
    @required this.addressPostCode,
    @required this.addressCountry,
    @required this.addressPhone,
    @required this.addressCity,
  });

  final String addressId;
  final String addressFull;
  final String addressPostCode;
  final String addressCountry;
  final String addressPhone;
  final String addressCity;

  factory UserAddress.fromRawJson(String str) => UserAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
    addressId: json["addressID"],
    addressFull: json["addressFULL"],
    addressPostCode: json["addressPostCode"],
    addressCountry: json["addressCountry"],
    addressPhone: json["addressPhone"],
    addressCity: json["addressCity"],
  );

  Map<String, dynamic> toJson() => {
    "addressID": addressId,
    "addressFULL": addressFull,
    "addressPostCode": addressPostCode,
    "addressCountry": addressCountry,
    "addressPhone": addressPhone,
    "addressCity": addressCity,
  };
}
