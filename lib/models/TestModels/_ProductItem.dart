// To parse this JSON data, do
//
//     final productItem = productItemFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ProductItem {
  ProductItem({
    @required this.productId,
    @required this.productName,
    @required this.productDesc,
    @required this.productQtyPerUnit,
    @required this.productUnitPrice,
    @required this.productUnitWeight,
    @required this.productUnitType,
    @required this.productUnitsInStock,
    @required this.productStockStatus,
    @required this.productDiscount,
    @required this.productPictureUrl,
    @required this.productSupplierId,
    @required this.productCategoryId,
    @required this.productTags,
    @required this.productRating,
    @required this.productMetaDataId,
  });

  final String productId;
  final String productName;
  final String productDesc;
  final int productQtyPerUnit;
  final int productUnitPrice;
  final int productUnitWeight;
  final ProductUnitType productUnitType;
  final int productUnitsInStock;
  final ProductStockStatus productStockStatus;
  final int productDiscount;
  final String productPictureUrl;
  final String productSupplierId;
  final String productCategoryId;
  final List<String> productTags;
  final double productRating;
  final String productMetaDataId;

  factory ProductItem.fromRawJson(String str) => ProductItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
    productId: json["productId"],
    productName: json["productName"],
    productDesc: json["productDesc"],
    productQtyPerUnit: json["productQtyPerUnit"],
    productUnitPrice: json["productUnitPrice"],
    productUnitWeight: json["productUnitWeight"],
    productUnitType: productUnitTypeValues.map[json["productUnitType"]],
    productUnitsInStock: json["productUnitsInStock"],
    productStockStatus: productStockStatusValues.map[json["productStockStatus"]],
    productDiscount: json["productDiscount"],
    productPictureUrl: json["productPictureUrl"],
    productSupplierId: json["productSupplierId"],
    productCategoryId: json["productCategoryId"],
    productTags: List<String>.from(json["productTags"].map((x) => x)),
    productRating: json["productRating"].toDouble(),
    productMetaDataId: json["productMetaDataId"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productName": productName,
    "productDesc": productDesc,
    "productQtyPerUnit": productQtyPerUnit,
    "productUnitPrice": productUnitPrice,
    "productUnitWeight": productUnitWeight,
    "productUnitType": productUnitTypeValues.reverse[productUnitType],
    "productUnitsInStock": productUnitsInStock,
    "productStockStatus": productStockStatusValues.reverse[productStockStatus],
    "productDiscount": productDiscount,
    "productPictureUrl": productPictureUrl,
    "productSupplierId": productSupplierId,
    "productCategoryId": productCategoryId,
    "productTags": List<dynamic>.from(productTags.map((x) => x)),
    "productRating": productRating,
    "productMetaDataId": productMetaDataId,
  };
}

enum ProductStockStatus { OUT_OF_STOCK, IN_STOCK }

final productStockStatusValues = EnumValues({
  "IN_STOCK": ProductStockStatus.IN_STOCK,
  "OUT_OF_STOCK": ProductStockStatus.OUT_OF_STOCK
});

enum ProductUnitType { PCS, GRM, NA, UNIT }

final productUnitTypeValues = EnumValues({
  "GRM": ProductUnitType.GRM,
  "NA": ProductUnitType.NA,
  "PCS": ProductUnitType.PCS,
  "UNIT": ProductUnitType.UNIT
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
