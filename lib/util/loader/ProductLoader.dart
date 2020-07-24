import 'dart:convert';
import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:flutter/cupertino.dart';

 class ProductLoader {
  List<ProductItem> productItems;
  List<ProductCategory> productCategory;

  Future<List<ProductItem>> getMoreProducts(BuildContext context) async {
    List<ProductItem> products;
    await DefaultAssetBundle.of(context)
        .loadString("lib/Json/PRODUCT_ITEM.json")
        .then((value) {
      products = (json.decode(value) as List)
          .map((i) => ProductItem.fromJson(i))
          .toList();
      debugPrint("Loaded Products");
     });
    return products;
  }

  List<ProductItem> getFourProducts() {}

  ProductItem getProduct() {}

  ProductItem getProductById(String productId) {}

  List<ProductItem> getProductsByCategory(String category) {}

  List<ProductItem> getSimilarProducts(List<ProductItem> products) {}
}
