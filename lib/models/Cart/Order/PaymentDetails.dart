// To parse this JSON data, do
//
//     final paymentDetails = paymentDetailsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class PaymentDetails {
  PaymentDetails({
    @required this.paymentId,
    @required this.paymentAddress,
    @required this.paymentMode,
    @required this.cardDetails,
  });

  final int paymentId;
  final String paymentAddress;
  final PaymentMode paymentMode;
  final String cardDetails;

  factory PaymentDetails.fromJson(String str) => PaymentDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentDetails.fromMap(Map<String, dynamic> json) => PaymentDetails(
    paymentId: json["paymentID"],
    paymentAddress: json["paymentAddress"],
    paymentMode: paymentModeValues.map[json["paymentMode"]],
    cardDetails: json["cardDetails"],
  );

  Map<String, dynamic> toMap() => {
    "paymentID": paymentId,
    "paymentAddress": paymentAddress,
    "paymentMode": paymentModeValues.reverse[paymentMode],
    "cardDetails": cardDetails,
  };
}

enum PaymentMode { CASH, ONLINE }

final paymentModeValues = EnumValues({
  "CASH": PaymentMode.CASH,
  "ONLINE": PaymentMode.ONLINE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
