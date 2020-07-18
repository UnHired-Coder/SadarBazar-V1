// To parse this JSON data, do
//
//     final order = orderFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Order {
  Order({
    @required this.orderId,
    @required this.orderUserId,
    @required this.orderDate,
    @required this.orderShippedDate,
    @required this.orderRequiredDate,
    @required this.orderShipVia,
    @required this.orderShipperId,
    @required this.orderStatus,
    @required this.orderDetailsId,
    @required this.orderNo,
    @required this.orderPaymentMode,
  });

  final int orderId;
  final int orderUserId;
  final String orderDate;
  final String orderShippedDate;
  final String orderRequiredDate;
  final OrderShipVia orderShipVia;
  final int orderShipperId;
  final OrderStatus orderStatus;
  final int orderDetailsId;
  final int orderNo;
  final OrderPaymentMode orderPaymentMode;

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
    orderId: json["orderID"],
    orderUserId: json["orderUserId"],
    orderDate: json["orderDate"],
    orderShippedDate: json["orderShippedDate"],
    orderRequiredDate: json["orderRequiredDate"],
    orderShipVia: orderShipViaValues.map[json["orderShipVia"]],
    orderShipperId: json["orderShipperId"],
    orderStatus: orderStatusValues.map[json["orderStatus"]],
    orderDetailsId: json["orderDetailsId"],
    orderNo: json["orderNo"],
    orderPaymentMode: orderPaymentModeValues.map[json["orderPaymentMode"]],
  );

  Map<String, dynamic> toMap() => {
    "orderID": orderId,
    "orderUserId": orderUserId,
    "orderDate": orderDate,
    "orderShippedDate": orderShippedDate,
    "orderRequiredDate": orderRequiredDate,
    "orderShipVia": orderShipViaValues.reverse[orderShipVia],
    "orderShipperId": orderShipperId,
    "orderStatus": orderStatusValues.reverse[orderStatus],
    "orderDetailsId": orderDetailsId,
    "orderNo": orderNo,
    "orderPaymentMode": orderPaymentModeValues.reverse[orderPaymentMode],
  };
}

enum OrderPaymentMode { CASH }

final orderPaymentModeValues = EnumValues({
  "CASH": OrderPaymentMode.CASH
});

enum OrderShipVia { BIKE }

final orderShipViaValues = EnumValues({
  "BIKE": OrderShipVia.BIKE
});

enum OrderStatus { DONE }

final orderStatusValues = EnumValues({
  "DONE": OrderStatus.DONE
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
