// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);
import 'package:meta/meta.dart';
import 'dart:convert';

class Order {
  Order({
    @required this.orderId,
    @required this.orderUserId,
    @required this.orderThumbUrl,
    @required this.timeStamp,
    @required this.dateStamp,
    @required this.orderedProducts,
    @required this.orderTotal,
    @required this.orderCount,
    @required this.orderSaved,
    @required this.paymentDetails,
    @required this.orderStatus,
  });

  final String orderId;
  final String orderUserId;
  final String orderThumbUrl;
  final String timeStamp;
  final String dateStamp;
  final List<String> orderedProducts;
  final String orderTotal;
  final String orderCount;
  final String orderSaved;
  final String paymentDetails;
  final String orderStatus;

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["orderId"],
    orderUserId: json["orderUserId"],
    timeStamp: json["timeStamp"],
    orderedProducts: List<String>.from(json["orderedProducts"].map((x) => x)),
    orderTotal: json["orderTotal"],
    orderCount: json["orderCount"],
    orderSaved: json["orderSaved"],
    paymentDetails: json["paymentDetails"],
    orderThumbUrl: json["orderThumbUrl"],
    dateStamp: json["dateStamp"],
    orderStatus: json["orderStatus"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "orderUserId": orderUserId,
    "timeStamp": timeStamp,
    "orderedProducts": List<dynamic>.from(orderedProducts.map((x) => x)),
    "orderTotal": orderTotal,
    "orderCount": orderCount,
    "orderSaved": orderSaved,
    "paymentDetails": paymentDetails,
    "orderThumbUrl": orderThumbUrl,
    "dateStamp": dateStamp,
    "orderStatus": orderStatus,
  };
}
