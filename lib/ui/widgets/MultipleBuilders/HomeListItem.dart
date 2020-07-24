import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ImageProductHighlight.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ListProductsHorizontal.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/OffersHighlightedProductsSlider.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/PromoteItem.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ShopItemGrid.dart';
import 'package:bazar/ui/widgets/small/CategoriesListWidget.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeListItem {
  Widget categoryTile(
      BuildContext context, List<ProductCategory> categories, bool flag);

  Widget offersHighlightedTile(
      BuildContext context, List<ProductCategory> categories, bool flag);

  Widget promoteItemTile(
      BuildContext context);

  Widget shopItemGrid(
      BuildContext context);

  Widget productsListHTile(
      BuildContext context, List<ProductItem> products, bool flag);

  Widget imageProductTile(
      BuildContext context, List<ProductCategory> categories, bool flag);
}

// CATEGORY
class CategoryTile implements HomeListItem {
  @override
  Widget categoryTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return CategoriesListWidget(productCategory: categories, flag: flag);
  }

  @override
  Widget imageProductTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }

  @override
  Widget productsListHTile(
      BuildContext context, List<ProductItem> products, bool flag) {
    return null;
  }

  @override
  Widget shopItemGrid(
      BuildContext context) {
    return null;
  }

  @override
  Widget promoteItemTile(
      BuildContext context) {
    return null;
  }

  @override
  Widget offersHighlightedTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }
}

//OFFERS HIGHLIGHTED
class OffersHighlightedTile implements HomeListItem {
  @override
  Widget offersHighlightedTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return OffersHighlightedProductsSlider(
      highlightList: categories,
      flag: flag,
    );
  }

  @override
  Widget categoryTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }

  @override
  Widget imageProductTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }

  @override
  Widget productsListHTile(
      BuildContext context, List<ProductItem> products, bool flag) {
    return null;
  }

  @override
  Widget shopItemGrid(
      BuildContext context) {
    return null;
  }

  @override
  Widget promoteItemTile(
      BuildContext context) {
    return null;
  }
}

// PROMOTE ITEM
class PromoteItemTile implements HomeListItem {
  List<ProductItem> products;
  bool flag;
  PromoteItemTile({@required this.products, this.flag});
  @override
  Widget promoteItemTile(BuildContext context) {
    return PromoteItem(
      products: products,
      flag: flag,
    );
  }

  @override
  Widget categoryTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }

  @override
  Widget imageProductTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }

  @override
  Widget productsListHTile(
      BuildContext context, List<ProductItem> products, bool flag) {
    return null;
  }

  @override
  Widget shopItemGrid(
      BuildContext context) {
    return null;
  }

  @override
  Widget offersHighlightedTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }
}

// SHOP ITEM GRID 4
class ShopItemGridTile implements HomeListItem {

  List<ProductItem> products;
  bool flag;
  ShopItemGridTile({this.products, this.flag});
  @override
  Widget shopItemGrid(
      BuildContext context) {
    return ShopItemGrid(
      gridOfProducts: products,
      flag: flag,
    );
  }

  @override
  Widget categoryTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }

  @override
  Widget imageProductTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }

  @override
  Widget productsListHTile(
      BuildContext context, List<ProductItem> products, bool flag) {
    return null;
  }

  @override
  Widget promoteItemTile(
      BuildContext context) {
    return null;
  }

  @override
  Widget offersHighlightedTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }
}

//PRODUCTS LIST TILE HORIZONTAL
class ProductsListHTile implements HomeListItem {
  @override
  Widget productsListHTile(
      BuildContext context, List<ProductItem> products, bool flag) {
    return ListProductHorizontal(
      productItemsHorizontal: products,
      flag: flag,
    );
  }

  @override
  Widget categoryTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }

  @override
  Widget imageProductTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }

  @override
  Widget shopItemGrid(
      BuildContext context) {
    return null;
  }

  @override
  Widget promoteItemTile(
      BuildContext context) {
    return null;
  }

  @override
  Widget offersHighlightedTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }
}

//IMAGE PRODUCT TILE
class ImageProductTile implements HomeListItem {
  @override
  Widget imageProductTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return ImageProductHighlight(
      products: categories,
      flag: flag,
    );
  }

  @override
  Widget categoryTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }

  @override
  Widget productsListHTile(
      BuildContext context, List<ProductItem> products, bool flag) {
    return null;
  }

  @override
  Widget shopItemGrid(
      BuildContext context) {
    return null;
  }

  @override
  Widget promoteItemTile(
      BuildContext context) {
    return null;
  }

  @override
  Widget offersHighlightedTile(
      BuildContext context, List<ProductCategory> categories, bool flag) {
    return null;
  }
}
