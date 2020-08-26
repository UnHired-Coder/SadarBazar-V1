import 'package:bazar/models/User/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class UserDataLoadUtil {
  static User cachedUser;

  static Future<User> getUser(BuildContext context) async {
    if (cachedUser != null) return cachedUser;
    User _user;
    String _id;
    if (FirebaseAuth.instance.currentUser() == null) return null;
    await FirebaseAuth.instance.currentUser().then((value) {
      _id = value.uid;
    });
    await Firestore.instance
        .collection("USER")
        .document("Users")
        .collection(_id)
        .document("UserData")
        .get()
        .then((value) {
      _user = User.fromJson(value.data);
      debugPrint(value.data.toString());
    });
    return  cachedUser = _user;
  }

  static void updateData(String id,User user) {
    Firestore.instance
        .collection("USER")
        .document("Users")
        .collection(id)
        .document("UserData")
        .updateData(user.toJson());

  }
}
