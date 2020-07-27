import 'dart:collection';

import 'package:bazar/models/Cart/UserCart.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:flutter/cupertino.dart';

class CartViewModel extends ChangeNotifier {
  List<ProductItem> _productsInCart = [];
  double subTotalAmount = 0;
  double totalAmount = 0;
  double totalDiscountAmount = 0;


  ProductItem getUserCart(int index) {
    return _productsInCart[index];
  }

  double getSubTotal(){
    return subTotalAmount;
  }
  double getDiscountAmount(){
    return totalDiscountAmount;
  }
  double getTotalAmount(){
    return subTotalAmount - totalDiscountAmount;
  }



  int getLength() {
    return _productsInCart.length;
  }



  addToCart(ProductItem product) {
    _productsInCart.add(product);
    subTotalAmount+=product.productUnitPrice;
    totalDiscountAmount+=product.productDiscount;
    notifyListeners();
  }

  removeFromCart(ProductItem product) {
    _productsInCart.remove(product);
    subTotalAmount-=product.productUnitPrice;
    totalDiscountAmount-=product.productDiscount;
    notifyListeners();
  }
}
