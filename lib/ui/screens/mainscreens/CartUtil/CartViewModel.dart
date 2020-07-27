import 'dart:collection';

import 'package:bazar/models/Cart/UserCart.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:flutter/cupertino.dart';

class CartViewModel extends ChangeNotifier {
  List<ProductItem> _productsInCart = [];
  double subTotalAmount = 0;
  double totalAmount = 0;
  double totalDiscountAmount = 0;
  Map _productCount = Map();


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

  int getItemCount(ProductItem item){
    if(!_productCount.containsKey(item.productId))
      return 0;
    return _productCount[item.productId];
  }


  addToCart(ProductItem product) {
    _productsInCart.add(product);
    subTotalAmount+=product.productUnitPrice;
    totalDiscountAmount+=product.productDiscount;

    if(!_productCount.containsKey(product.productId))
      _productCount[product.productId] = 1;
    else
    _productCount[product.productId]++;
    notifyListeners();
  }

  removeFromCart(ProductItem product) {
    _productsInCart.remove(product);
    subTotalAmount-=product.productUnitPrice;
    totalDiscountAmount-=product.productDiscount;

    if(!_productCount.containsKey(product.productId))
      _productCount[product.productId] = 0;
    else
      _productCount[product.productId]--;
    notifyListeners();
  }
}
