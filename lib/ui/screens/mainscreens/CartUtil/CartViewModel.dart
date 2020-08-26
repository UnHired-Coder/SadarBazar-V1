import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:flutter/cupertino.dart';

class CartViewModel extends ChangeNotifier {
  List<ProductItem> _productsInCart = [];
  double subTotalAmount = 0;
  double totalAmount = 0;
  double totalDiscountAmount = 0;
  int _count = 0;
  Map _productCount = Map();

  bool isEmpty() {
    return _productsInCart.length == 0;
  }

  ProductItem getUserCart(int index) {
    return _productsInCart[index];
  }

  double getSubTotal() {
    return subTotalAmount;
  }

  double getDiscountAmount() {
    return totalDiscountAmount;
  }

  double getTotalAmount() {
    return subTotalAmount - totalDiscountAmount;
  }

  int getLength() {
    return _productsInCart.length;
  }

  int getItemCount(ProductItem item) {
    if (!_productCount.containsKey(item.productId)) return 0;
    return _productCount[item.productId];
  }

  int getTotalItemCount() {
    return _count;
  }

  addToCart(ProductItem product) {
    if (!_productCount.containsKey(product.productId))
      _productsInCart.add(product);
    subTotalAmount += product.productUnitPrice;
    totalDiscountAmount += product.productDiscount;

    if (!_productCount.containsKey(product.productId)) {
      _productCount[product.productId] = 1;
    } else {
      _productCount[product.productId]++;
    }
    _count++;
    notifyListeners();
  }

  removeFromCart(ProductItem product) {
    if (_productCount[product.productId] == 0) _productsInCart.remove(product);
    subTotalAmount -= product.productUnitPrice;
    totalDiscountAmount -= product.productDiscount;

    if (!_productCount.containsKey(product.productId)) {
      _productCount[product.productId] = 0;
    } else {
      _productCount[product.productId]--;
    }
    _count--;

    if (_productCount[product.productId] <= 0) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        if(_productCount[product.productId]<=0) {
          _productsInCart.remove(product);
          _productCount.remove(product.productId);
          notifyListeners();
        }
      });
    }
    notifyListeners();
  }
}
