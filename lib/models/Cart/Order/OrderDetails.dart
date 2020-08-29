

// To parse this JSON data, do
//
//     final order = orderFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class OrderDetails {
  OrderDetails({
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
  final OrderDetailsShipVia orderShipVia;
  final int orderShipperId;
  final OrderDetailsStatus orderStatus;
  final int orderDetailsId;
  final int orderNo;
  final OrderDetailsPaymentMode orderPaymentMode;

  factory OrderDetails.fromJson(String str) => OrderDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetails.fromMap(Map<String, dynamic> json) => OrderDetails(
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

enum OrderDetailsPaymentMode { CASH }

final orderPaymentModeValues = EnumValues({
  "CASH": OrderDetailsPaymentMode.CASH
});

enum OrderDetailsShipVia { BIKE }

final orderShipViaValues = EnumValues({
  "BIKE": OrderDetailsShipVia.BIKE
});

enum OrderDetailsStatus { DONE }

final orderStatusValues = EnumValues({
  "DONE": OrderDetailsStatus.DONE
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
