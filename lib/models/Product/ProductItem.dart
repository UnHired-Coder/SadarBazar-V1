//// To parse this JSON data, do
////
////     final productItem = productItemFromJson(jsonString);
//
//import 'package:meta/meta.dart';
//import 'dart:convert';
//
//class ProductItem {
//  ProductItem({
//    @required this.productId,
//    @required this.productName,
//    @required this.productDesc,
//    @required this.productQtyPerUnit,
//    @required this.productUnitPrice,
//    @required this.productUnitWeight,
//    @required this.productUnitsInStock,
//    @required this.productDiscount,
//    @required this.productPictureUrl,
//    @required this.productSupplierId,
//    @required this.productCategoryId,
//    @required this.productTags,
//  });
//
//  final int productId;
//  final String productName;
//  final String productDesc;
//  final int productQtyPerUnit;
//  final int productUnitPrice;
//  final int productUnitWeight;
//  final int productUnitsInStock;
//  final int productDiscount;
//  final String productPictureUrl;
//  final int productSupplierId;
//  final int productCategoryId;
//  final String productTags;
//
//  factory ProductItem.fromRawJson(String str) => ProductItem.fromJson(json.decode(str));
//
//  String toRawJson() => json.encode(toJson());
//
//  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
//    productId: json["productID"],
//    productName: json["productName"],
//    productDesc: json["productDesc"],
//    productQtyPerUnit: json["productQtyPerUnit"],
//    productUnitPrice: json["productUnitPrice"],
//    productUnitWeight: json["productUnitWeight"],
//    productUnitsInStock: json["productUnitsInStock"],
//    productDiscount: json["productDiscount"],
//    productPictureUrl: json["productPictureUrl"],
//    productSupplierId: json["productSupplierId"],
//    productCategoryId: json["productCategoryId"],
//    productTags: json["productTags"],
//  );
//
//  Map<String, dynamic> toJson() => {
//    "productID": productId,
//    "productName": productName,
//    "productDesc": productDesc,
//    "productQtyPerUnit": productQtyPerUnit,
//    "productUnitPrice": productUnitPrice,
//    "productUnitWeight": productUnitWeight,
//    "productUnitsInStock": productUnitsInStock,
//    "productDiscount": productDiscount,
//    "productPictureUrl": productPictureUrl,
//    "productSupplierId": productSupplierId,
//    "productCategoryId": productCategoryId,
//    "productTags": productTags,
//  };
//}
