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
    @required this.productCategoryName,
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
  final String productCategoryName;
  final List<String> productTags;
  final double productRating;
  final String productMetaDataId;

  factory ProductItem.fromRawJson(String str) =>
      ProductItem.fromJson(json.decode(str));

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
        productStockStatus:
            productStockStatusValues.map[json["productStockStatus"]],
        productDiscount: json["productDiscount"],
        productPictureUrl: json["productPictureUrl"],
        productSupplierId: json["productSupplierId"],
        productCategoryId: json["productCategoryId"],
        productCategoryName: json["productCategoryName"],
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
        "productStockStatus":
            productStockStatusValues.reverse[productStockStatus],
        "productDiscount": productDiscount,
        "productPictureUrl": productPictureUrl,
        "productSupplierId": productSupplierId,
        "productCategoryId": productCategoryId,
        "productCategoryName": productCategoryName,
        "productTags": List<dynamic>.from(productTags.map((x) => x)),
        "productRating": productRating,
        "productMetaDataId": productMetaDataId,
      };

  static Map<String, dynamic> toMap(ProductItem product) => {
        "productId": product.productId,
        "productName": product.productName,
        "productDesc": product.productDesc,
        "productQtyPerUnit": product.productQtyPerUnit,
        "productUnitPrice": product.productUnitPrice,
        "productUnitWeight": product.productUnitWeight,
        "productUnitType":
            productUnitTypeValues.reverse[product.productUnitType],
        "productUnitsInStock": product.productUnitsInStock,
        "productStockStatus":
            productStockStatusValues.reverse[product.productStockStatus],
        "productDiscount": product.productDiscount,
        "productPictureUrl": product.productPictureUrl,
        "productSupplierId": product.productSupplierId,
        "productCategoryId": product.productCategoryId,
        "productCategoryName": product.productCategoryName,
        "productTags": List<dynamic>.from(product.productTags.map((x) => x)),
        "productRating": product.productRating,
        "productMetaDataId": product.productMetaDataId,
      };

  static String encodeMusics(List<ProductItem> product) => json.encode(
        product
            .map<Map<String, dynamic>>((music) => ProductItem.toMap(music))
            .toList(),
      );

  static List<ProductItem> decodeProduct(String product) =>
      (json.decode(product) as List<dynamic>)
          .map<ProductItem>((item) => ProductItem.fromJson(item))
          .toList();
}

enum ProductStockStatus { OUT_OF_STOCK, IN_STOCK }

final productStockStatusValues = EnumValues({
  "IN_STOCK": ProductStockStatus.IN_STOCK,
  "OUT_OF_STOCK": ProductStockStatus.OUT_OF_STOCK
});

enum ProductUnitType { PCS, GRM, NA, UNIT, KG }

final productUnitTypeValues = EnumValues({
  "GRM": ProductUnitType.GRM,
  "NA": ProductUnitType.NA,
  "PCS": ProductUnitType.PCS,
  "UNIT": ProductUnitType.UNIT,
  "KG": ProductUnitType.KG
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

//class ProductList {
//  ProductList({this.productsList});
//  final List<ProductItem> productsList;
//  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
//        productsList:
//            List<ProductItem>.from(json["productsList"].map((x) => x)),
//      );
//  Map<String, dynamic> toJson() => {
//        "productsList": List<dynamic>.from(productsList.map((x) => x)),
//      };
//}
