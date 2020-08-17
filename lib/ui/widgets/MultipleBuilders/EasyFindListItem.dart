import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:bazar/ui/widgets/large/EasyFindWidgets/EasyFindCategories.dart';
import 'package:bazar/ui/widgets/large/EasyFindWidgets/EasyFindGridCategories.dart';
import 'package:bazar/ui/widgets/large/EasyFindWidgets/EasyFindHighlightedCategories.dart';
import 'package:flutter/cupertino.dart';

abstract class EasyFindListItem{

  Widget easyFindHighlightedCategories(BuildContext context);
  Widget easyFindGridCategories(BuildContext context);
  Widget easyFindCategories(BuildContext context);
}

class EasyFindGridCategoriesTile implements EasyFindListItem{

  List<ProductCategory> categories;
  List<ProductItem> products;
  bool flag;

  EasyFindGridCategoriesTile({@required this.categories,@required this.products, this.flag});

  @override
  Widget easyFindGridCategories(BuildContext context) {
    return  EasyFindGridCategories(categories: categories,products: products,flag: flag,);
  }

  @override
  Widget easyFindCategories(BuildContext context) {
    return null;
  }

  @override
  Widget easyFindHighlightedCategories(BuildContext context) {
    return null;
  }
}


class EasyFindCategoriesTile implements EasyFindListItem{

  List<ProductCategory> categories;
  List<ProductItem> products;
  bool flag;

  EasyFindCategoriesTile({@required this.categories,@required this.products, this.flag});

  @override
  Widget easyFindCategories(BuildContext context) {
   return EasyFindCategories(categories: categories,products: products,flag: flag,);
  }

  @override
  Widget easyFindGridCategories(BuildContext context) {
    return null;
  }

  @override
  Widget easyFindHighlightedCategories(BuildContext context) {
    return null;
  }
}


class EasyFindHighlightedCategoriesTile implements EasyFindListItem{
  List<ProductCategory> categories;
  bool flag;

  EasyFindHighlightedCategoriesTile({this.categories, this.flag});

  @override
  Widget easyFindHighlightedCategories(BuildContext context) {
  return EasyFindHighlightedCategories(categories: categories,flag: flag);
  }

  @override
  Widget easyFindCategories(BuildContext context) {
    return null;
  }

  @override
  Widget easyFindGridCategories(BuildContext context) {
    return null;
  }
}