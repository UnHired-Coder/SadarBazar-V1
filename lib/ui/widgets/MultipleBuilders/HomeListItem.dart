import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'file:///F:/Sadar/bazar/lib/ui/widgets/large/ProductWidgets/MultiListWidgets/ImageProductHighlight.dart';
import 'file:///F:/Sadar/bazar/lib/ui/widgets/large/ProductWidgets/MultiListWidgets/ListProductsHorizontal.dart';
import 'file:///F:/Sadar/bazar/lib/ui/widgets/large/ProductWidgets/MultiListWidgets/OffersHighlightedProductsSlider.dart';
import 'file:///F:/Sadar/bazar/lib/ui/widgets/large/ProductWidgets/MultiListWidgets/PromoteItem.dart';
import 'file:///F:/Sadar/bazar/lib/ui/widgets/large/ProductWidgets/MultiListWidgets/ShopItemGrid.dart';
import 'package:bazar/ui/widgets/small/CategoriesListWidget.dart';
import 'package:flutter/cupertino.dart';

abstract class HomeListItem {
  Widget categoryTile(BuildContext context);

  Widget offersHighlightedTile(BuildContext context);

  Widget promoteItemTile(BuildContext context);

  Widget shopItemGrid(BuildContext context);

  Widget productsListHTile(BuildContext context);

  Widget imageProductTile(BuildContext context);
}

// CATEGORY
class CategoryTile implements HomeListItem {
  List<ProductCategory> categories;
  bool flag;

  CategoryTile({this.categories, this.flag});

  @override
  Widget categoryTile(BuildContext context) {
    return CategoriesListWidget(productCategory: categories, flag: flag);
  }

  @override
  Widget imageProductTile(BuildContext context) {
    return null;
  }

  @override
  Widget productsListHTile(BuildContext context) {
    return null;
  }

  @override
  Widget shopItemGrid(BuildContext context) {
    return null;
  }

  @override
  Widget promoteItemTile(BuildContext context) {
    return null;
  }

  @override
  Widget offersHighlightedTile(BuildContext context) {
    return null;
  }
}

//OFFERS HIGHLIGHTED
class OffersHighlightedTile implements HomeListItem {
  List<ProductCategory> categories;
  bool flag;

  OffersHighlightedTile({this.categories, this.flag});

  @override
  Widget offersHighlightedTile(BuildContext context) {
    return OffersHighlightedProductsSlider(
      highlightList: categories,
      flag: flag,
    );
  }

  @override
  Widget categoryTile(BuildContext context) {
    return null;
  }

  @override
  Widget imageProductTile(BuildContext context) {
    return null;
  }

  @override
  Widget productsListHTile(BuildContext context) {
    return null;
  }

  @override
  Widget shopItemGrid(BuildContext context) {
    return null;
  }

  @override
  Widget promoteItemTile(BuildContext context) {
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
  Widget categoryTile(BuildContext context) {
    return null;
  }

  @override
  Widget imageProductTile(BuildContext context) {
    return null;
  }

  @override
  Widget productsListHTile(BuildContext context) {
    return null;
  }

  @override
  Widget shopItemGrid(BuildContext context) {
    return null;
  }

  @override
  Widget offersHighlightedTile(BuildContext context) {
    return null;
  }
}

// SHOP ITEM GRID 4
class ShopItemGridTile implements HomeListItem {
  List<ProductItem> products;
  bool flag;

  ShopItemGridTile({this.products, this.flag});

  @override
  Widget shopItemGrid(BuildContext context) {
    return ShopItemGrid(
      gridOfProducts: products,
      flag: flag,
    );
  }

  @override
  Widget categoryTile(BuildContext context) {
    return null;
  }

  @override
  Widget imageProductTile(BuildContext context) {
    return null;
  }

  @override
  Widget productsListHTile(BuildContext context) {
    return null;
  }

  @override
  Widget promoteItemTile(BuildContext context) {
    return null;
  }

  @override
  Widget offersHighlightedTile(BuildContext context) {
    return null;
  }
}

//PRODUCTS LIST TILE HORIZONTAL
class ProductsListHTile implements HomeListItem {
  List<ProductItem> products;
  bool flag;

  ProductsListHTile({this.products, this.flag});

  @override
  Widget productsListHTile(BuildContext context) {
    return ListProductHorizontal(
      productItemsHorizontal: products,
      flag: flag,
    );
  }

  @override
  Widget categoryTile(BuildContext context) {
    return null;
  }

  @override
  Widget imageProductTile(BuildContext context) {
    return null;
  }

  @override
  Widget shopItemGrid(BuildContext context) {
    return null;
  }

  @override
  Widget promoteItemTile(BuildContext context) {
    return null;
  }

  @override
  Widget offersHighlightedTile(BuildContext context) {
    return null;
  }
}

//IMAGE PRODUCT TILE
class ImageProductTile implements HomeListItem {
  List<ProductCategory> categories;
  bool flag;

  ImageProductTile({this.categories, this.flag});

  @override
  Widget imageProductTile(BuildContext context) {
    return ImageProductHighlight(
      products: categories,
      flag: flag,
    );
  }

  @override
  Widget categoryTile(BuildContext context) {
    return null;
  }

  @override
  Widget productsListHTile(BuildContext context) {
    return null;
  }

  @override
  Widget shopItemGrid(BuildContext context) {
    return null;
  }

  @override
  Widget promoteItemTile(BuildContext context) {
    return null;
  }

  @override
  Widget offersHighlightedTile(BuildContext context) {
    return null;
  }
}
