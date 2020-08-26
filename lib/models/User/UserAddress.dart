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
    @required this.longitude,
    @required this.latitude,
  });

  final String addressId;
  final String addressFull;
  final String addressPostCode;
  final String addressCountry;
  final String addressPhone;
  final String addressCity;
  final String latitude;
  final String longitude;
  factory UserAddress.fromRawJson(String str) => UserAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
    addressId: json["addressID"],
    addressFull: json["addressFULL"],
    addressPostCode: json["addressPostCode"],
    addressCountry: json["addressCountry"],
    addressPhone: json["addressPhone"],
    addressCity: json["addressCity"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "addressID": addressId,
    "addressFULL": addressFull,
    "addressPostCode": addressPostCode,
    "addressCountry": addressCountry,
    "addressPhone": addressPhone,
    "addressCity": addressCity,
    "latitude": latitude,
    "longitude": longitude,
  };
}
