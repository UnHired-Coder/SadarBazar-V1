import 'package:bazar/models/Cart/Order/Order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class OrderViewModel extends ChangeNotifier {
  List<Order> orders = [];
  int totalOrders = 0;
  int ordersDelivered = 0;



  void addNewOrder(Order order) async {
    orders.add(order);
    await FirebaseAuth.instance.currentUser().then((value) {
      Firestore.instance
          .collection("USER")
          .document("Users")
          .collection(value.uid)
          .document("Orders")
          .collection(totalOrders.toString())
          .add(order.toJson())
          .then((value) {
        totalOrders++;
//        notifyListeners();
      });
    });
  }

  getOrders() async {
    await FirebaseAuth.instance.currentUser().then((value) {
      Firestore.instance
          .collection("USER")
          .document("Users")
          .collection(value.uid)
          .document("Orders")
          .get()
          .then((value){
            if(value.data!=null){
              debugPrint(value.data.toString());
            }
      });
//      notifyListeners();
    });
  }
}
