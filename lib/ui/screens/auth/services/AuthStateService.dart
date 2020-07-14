import 'package:bazar/temp.dart';
import 'package:bazar/ui/screens/auth/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../Home.dart';

class AuthStateService {
  static const int STATE_LOGGED_IN = 2;
  static const int STATE_UNDEFINED = 0;
  static const int STATE_NOT_LOGGED_IN = 1;


  checkUserLogged() {
    int state = STATE_UNDEFINED;
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        FirebaseAuth.instance.currentUser().then((value){
          if(value!=null && value.phoneNumber!=null)
          state = STATE_LOGGED_IN;
          else
          state = STATE_NOT_LOGGED_IN;
      });
        if(state == STATE_LOGGED_IN)
          return Home();
         else if(state == STATE_NOT_LOGGED_IN){
          return Login();
        }else{
          return Temp();
        }
      },
    );
  }

  logout(){
   FirebaseAuth.instance.signOut();
  }

 Future<bool> signIn(AuthCredential credential) async{
   bool res= false;
   await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
     debugPrint("REGISTER SUCCESS "+value.user.phoneNumber);
     res = true;
     return value;
    }).catchError( (v){
     debugPrint("Error :OTP DID NOT MATCH"+v.message);
     res = false;
    }).then((value){
      debugPrint("RESULT "+value.toString());
    });
   return res;
  }

}
