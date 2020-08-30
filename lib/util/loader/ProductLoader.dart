//import 'dart:convert';
//import 'package:bazar/models/Product/ProductCategory.dart';
//import 'package:bazar/models/Product/ProductItem.dart';
//import 'package:bazar/models/TestModels/_ProductItem.dart';
//import 'package:flutter/cupertino.dart';
//
//abstract class ProductLoader {
//  static List<ProductItem> productItems = [];
//  static List<ProductCategory> productCategory = [];
//
//  static Future<List<ProductItem>> getMoreProducts(BuildContext context) async {
//    List<ProductItem> products;
////    await DefaultAssetBundle.of(context)
////        .loadString("lib/Json/PRODUCT_ITEM.json")
////        .then((value) {
////      products = (json.decode(value) as List)
////          .map((i) => ProductItem.fromJson(i))
////          .toList();
////      productItems.addAll(products);
////      debugPrint("Loaded Products");
////     });
//    return products;
//  }
//
//  static Future<List<ProductCategory>> getMoreCategories(
//      BuildContext context) async {
//    List<ProductCategory> categories;
////    await DefaultAssetBundle.of(context)
////        .loadString("lib/Json/PRODUCT_CATEGORIES.json")
////        .then((value) {
////      categories = (json.decode(value) as List)
////          .map((i) => ProductCategory.fromJson(i))
////          .toList();
////      productCategory.addAll(categories);
////      debugPrint("Loaded Categories");
////    });
//    return categories;
//  }
//
//  static List<ProductItem> getFourProducts(BuildContext context) {
//    if (productItems.length == 0) getMoreProducts(context);
//    return productItems.sublist(0, 0 + 4);
//  }
//
//  static ProductItem getProduct(BuildContext context) {
//    if (productItems.length == 0) getMoreProducts(context);
//    return productItems[0];
//  }
//
//  ProductItem getProductById(String productId) {}
//
//  List<ProductItem> getProductsByCategory(String category) {}
//
//  List<ProductItem> getSimilarProducts(List<ProductItem> products) {}
//}
