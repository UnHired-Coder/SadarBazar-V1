// To parse this JSON data, do
//
//     final orderDetails = orderDetailsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class OrderDetails {
  OrderDetails({
    @required this.orderId,
    @required this.orderUserId,
    @required this.orderProducts,
    @required this.orderTotal,
    @required this.orderCount,
    @required this.orderSaved,
    @required this.paymentDetails,
  });

  final int orderId;
  final int orderUserId;
  final int orderProducts;
  final int orderTotal;
  final int orderCount;
  final int orderSaved;
  final int paymentDetails;

  factory OrderDetails.fromJson(String str) => OrderDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetails.fromMap(Map<String, dynamic> json) => OrderDetails(
    orderId: json["orderID"],
    orderUserId: json["orderUserId"],
    orderProducts: json["orderProducts"],
    orderTotal: json["orderTotal"],
    orderCount: json["orderCount"],
    orderSaved: json["orderSaved"],
    paymentDetails: json["paymentDetails"],
  );

  Map<String, dynamic> toMap() => {
    "orderID": orderId,
    "orderUserId": orderUserId,
    "orderProducts": orderProducts,
    "orderTotal": orderTotal,
    "orderCount": orderCount,
    "orderSaved": orderSaved,
    "paymentDetails": paymentDetails,
  };
}
