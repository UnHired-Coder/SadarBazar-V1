// To parse this JSON data, do
//
//     final productCategory = productCategoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ProductCategory {
  ProductCategory({
    @required this.categoryId,
    @required this.categoryName,
    @required this.categoryDesc,
    @required this.categoryPictureUrl,
    @required this.categoryTags,
  });

  final String categoryId;
  final String categoryName;
  final String categoryDesc;
  final String categoryPictureUrl;
  final List<String> categoryTags;

  factory ProductCategory.fromRawJson(String str) =>
      ProductCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        categoryId: json["categoryID"],
        categoryName: json["categoryName"],
        categoryDesc: json["categoryDesc"],
        categoryPictureUrl: json["categoryPictureUrl"],
        categoryTags: List<String>.from(json["categoryTags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "categoryID": categoryId,
        "categoryName": categoryName,
        "categoryDesc": categoryDesc,
        "categoryPictureUrl": categoryPictureUrl,
        "categoryTags": List<dynamic>.from(categoryTags.map((x) => x)),
      };
}
