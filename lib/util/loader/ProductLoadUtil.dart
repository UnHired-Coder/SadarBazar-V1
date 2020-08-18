import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:bazar/models/TestModels/_ProductMetaData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductLoaderUtil {
  static Map<String, ProductItem> cachedProducts = new Map();

  static List<String> categories = [
    "DAIRY_PRODUCTS",
    "BEAUTY_PRODUCTS",
    "ELECTRONICS_PRODUCTS",
    "FASHION_PRODUCTS",
    "PHONE_PRODUCTS",
    "GROCERY_PRODUCTS"
  ];

  static Future<List<ProductItem>> getMoreProducts(BuildContext context) async {
    List<ProductItem> products = [];
    for (int i = 0; i < categories.length; i++)
      await Firestore.instance
          .collection("GlobalDataBase")
          .document(categories[i])
          .collection("ITEMS")
          .getDocuments()
          .then((value) {
        value.documents.forEach((element) {
//          debugPrint(element.data.toString());
          products.add(ProductItem.fromJson(element.data));
        });
      });
    return products;
  }

  static Future<List<ProductCategory>> getMoreCategories(
      BuildContext context) async {
    List<ProductCategory> categoriesFetched = [];
    for (int i = 0; i < categories.length; i++)
      await Firestore.instance
          .collection("GlobalDataBase")
          .document("Categories")
          .collection(categories[i])
          .getDocuments()
          .then((value) {
//        debugPrint(value.documents.toString());
        value.documents.forEach((element) {
//        debugPrint(element.data.toString());
          categoriesFetched.add(ProductCategory.fromJson(element.data));
          categoriesFetched.add(ProductCategory.fromJson(element.data));
        });
      });
    return categoriesFetched;
  }

  static Future<List<ProductItem>> getSimilarProducts(
      BuildContext context) async {
    List<ProductItem> products = [];
    for (int i = 0; i < categories.length; i++)
      await Firestore.instance
          .collection("GlobalDataBase")
          .document(categories[i])
          .collection("ITEMS")
          .getDocuments()
          .then((value) {
        value.documents.forEach((element) {
//          debugPrint(element.data.toString());
          products.add(ProductItem.fromJson(element.data));
        });
      });
    return products;
  }

  static Future<ProductMetaData> getProductMetadata(
      BuildContext context, String id) async {
    ProductMetaData productMetaData;
    for (int i = 0; i < categories.length; i++)
      await Firestore.instance
          .collection("GlobalDataBase")
          .document("ProductMetaData")
          .collection(id)
          .getDocuments()
          .then((value) {
        productMetaData = ProductMetaData.fromJson(value.documents[0].data);
//        debugPrint(productMetaData.highlightsPoints.toString());
      }).then((value) {});
    return productMetaData;
  }

  /////////////////////
  //  SEARCH PRODUCT
  /////////////////////

  static Future<List<ProductItem>> getSearchResults(
      BuildContext context, String query) async {
    List<ProductItem> products = [];
    for (int i = 0; i < categories.length; i++)
      await Firestore.instance
          .collection("GlobalDataBase")
          .document(categories[i])
          .collection("ITEMS")
          .limit(8)
          .where("SEARCH_KEYWORDS",
          arrayContains: query[0].toUpperCase() + query.substring(1))
          .getDocuments()
          .then((value) {
        value.documents.forEach((element) {
          products.add(ProductItem.fromJson(element.data));
        });
      });
    return products;
  }



  static Future<List<String>> searchProducts(
    BuildContext context, String query) async {
    List<String> products = [];
    for (int i = 0; i < categories.length; i++)
      await Firestore.instance
          .collection("GlobalDataBase")
          .document(categories[i])
          .collection("ITEMS")
          .limit(8)
          .where("SEARCH_KEYWORDS",
              arrayContains: query[0].toUpperCase() + query.substring(1))
          .getDocuments()
          .then((value) {
        value.documents.forEach((element) {
          products.add(ProductItem.fromJson(element.data).productName);
        });
      });
    return products;
  }
}
