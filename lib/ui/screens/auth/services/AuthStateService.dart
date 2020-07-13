import 'package:bazar/ui/screens/auth/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../Home.dart';

class AuthStateService {
  checkUserLogged() {
    bool loggedIn = false;
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        FirebaseAuth.instance.currentUser().then((value){
          if(value!=null && value.phoneNumber!=null)
          loggedIn = true;
      });
        if(loggedIn)
          return Home();
         else {
          return Login();
        }
      },
    );
  }

  logout(){
   FirebaseAuth.instance.signOut();
  }
  signIn(AuthCredential credential){
    FirebaseAuth.instance.signInWithCredential(credential);
  }

}
