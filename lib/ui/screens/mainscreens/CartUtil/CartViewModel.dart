import 'dart:convert';
import 'dart:math';

import 'package:bazar/models/Cart/Order/Order.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:bazar/ui/screens/mainscreens/CartUtil/CartScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartViewModel extends ChangeNotifier {
  List<ProductItem> _productsInCart = [];
  double subTotalAmount = 0;
  double totalAmount = 0;
  double totalDiscountAmount = 0;
  int _count = 0;
  Map _productCount = Map();

  void clearCart() {
    _productsInCart = [];
    subTotalAmount = 0;
    totalAmount = 0;
    totalDiscountAmount = 0;
    _count = 0;
    _productCount = Map();
    notifyListeners();
  }

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
    debugPrint("Adding " + product.productName);
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

    List<ProductItem> _list = [];
    if (_productsInCart != null && _productsInCart.length != 0) {
      for (int i = 0; i < _productsInCart.length; i++) {
        if (_productCount[_productsInCart.elementAt(i).productId] != null) {
          for (int j = 0;
              j < _productCount[_productsInCart.elementAt(i).productId];
              j++) _list.add(_productsInCart[i]);
        }
      }
    }

    storeCartItems(_list);
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
        if (_productCount[product.productId] <= 0) {
          _productsInCart.remove(product);
          _productCount.remove(product.productId);
          storeCartItems(_productsInCart);
          notifyListeners();
        }
      });
    }
    List<ProductItem> _list = [];
    if (_productsInCart != null && _productsInCart.length != 0) {
      for (int i = 0; i < _productsInCart.length; i++) {
        if (_productCount[_productsInCart.elementAt(i).productId] != null) {
          for (int j = 0;
              j < _productCount[_productsInCart.elementAt(i).productId];
              j++) _list.add(_productsInCart[i]);
        }
      }
    }

    storeCartItems(_list);
    notifyListeners();
  }

  Future<List<ProductItem>> getCartItems(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<ProductItem> productList = prefs.getString("cartPref") == null
        ? []
        : ProductItem.decodeProduct(prefs.getString("cartPref"));

    if (productList != null)
      for (int i = 0; i < productList.length; i++) {
        Provider.of<CartViewModel>(context, listen: false)
            .addToCart(productList.elementAt(i));
        debugPrint("Cart Item " + productList.elementAt(i).productName);
      }
    notifyListeners();
    return productList;
  }

  void storeCartItems(List<ProductItem> productList) async {
     if(productList.length==0)
       return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (productList.length == 0) prefs.clear();
    prefs.setString("cartPref", "");
    prefs.setString("cartPref", ProductItem.encodeMusics(productList));
  }

  Future<Order> toOrder(context) async {
    FirebaseUser user;
    await FirebaseAuth.instance.currentUser().then((value) => user = value);
    List<String> _ids = [];
    int _total = 0;
    String _thumb = "";

    for (int i = 0;
        i <
            Provider.of<CartViewModel>(context, listen: false)
                ._productsInCart
                .length;
        i++) {
      _thumb = Provider.of<CartViewModel>(context, listen: false)
          ._productsInCart
          .elementAt(0)
          .productPictureUrl;
      _ids.add(Provider.of<CartViewModel>(context, listen: false)
          ._productsInCart
          .elementAt(i)
          .productId);
      _total += Provider.of<CartViewModel>(context, listen: false)
          ._productsInCart
          .elementAt(i)
          .productUnitPrice;
    }

    String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    String dateStamp = DateTime.now().toString().substring(0, 19);
    return new Order(
        orderId: timeStamp,
        orderUserId: user.uid,
        timeStamp: timeStamp,
        orderedProducts: _ids,
        orderTotal: _total.toString(),
        orderCount: _ids.length.toString(),
        orderSaved: "unused",
        orderThumbUrl: _thumb,
        orderStatus: "Delivered",
        dateStamp: dateStamp,
        paymentDetails: timeStamp + user.uid);
  }
}
