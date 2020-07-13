import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/util/Router/routeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phoneController;
  TextEditingController _passwordController;
  bool _loading, _validatePassword,_validatePhone;

  @override
  void initState() {
    _phoneController = new TextEditingController();
    _passwordController = new TextEditingController();
    _loading = false;
    _validatePassword = false;
    _validatePhone = false;
    _phoneController.addListener(() {setState(() {
      _validatePhone = false;
    });});
    _passwordController.addListener(() {setState(() {
      _validatePassword = false;
    });});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
         children: [
           SingleChildScrollView(
             child: Container(
                 color: White,
                 width: _width,
                 height: _height,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           width: 100,
                           height: 100,
                           decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: AssetImage('assets/images/logo.png'))),
                         ),
                         SizedBox(
                           height: 100,
                         ),
                         Container(
                           height: 50,
                           width: _width * 0.7,
                           child: TextField(
                             controller: _phoneController,
                             autofocus: true,
                             decoration: InputDecoration(
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(4)),
                                   borderSide: BorderSide(width: 1, color: Orange),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius:
                                   BorderRadius.all(Radius.circular(4)),
                                   borderSide:
                                   BorderSide(width: 1, color: LightBlack),
                                 ),
                                 labelStyle:
                                 TextStyle(color: LightBlack.withOpacity(0.5)),
                                 labelText:  _validatePhone ? 'No contact found !' :"Phone no"),
                             cursorColor: LightBlack,
                           ),
                         ),
                         SizedBox(
                           height: 40,
                         ),
                         Container(
                           height: 50,
                           width: _width * 0.7,
                           child: TextField(
                               controller: _passwordController,
                               decoration: InputDecoration(
                                   focusedBorder: OutlineInputBorder(
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(4)),
                                     borderSide: BorderSide(width: 1, color: Orange),
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(4)),
                                     borderSide:
                                     BorderSide(width: 1, color: LightBlack),
                                   ),
                                   errorBorder: OutlineInputBorder(
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(4)),
                                     borderSide:
                                     BorderSide(width: 1, color: Maroon),
                                   ),
                                   errorStyle: TextStyle(color: LightBlack.withOpacity(0.5)),
                                   labelStyle:
                                   TextStyle(color: LightBlack.withOpacity(0.5)),
                                   labelText: _validatePassword ? 'Invalid or Wrong password !' : "Password"),
                               cursorColor: LightBlack,
                               obscureText: true),
                         ),
                         SizedBox(
                           height: 15,
                         ),
                         InkWell(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("Not a member ?"),
                               Text(
                                 "  Register",
                                 style: TextStyle(color: Orange),
                               )
                             ],
                           ),
                           onTap: () {
                             debugPrint(" Register Requested");
                             Navigator.of(context).pushNamed(RegisterRoute);
                           },
                         ),
                         SizedBox(
                           height: 80,
                         ),
                         InkWell(
                           onTap: () {
                             setState(() {
                               _loading = true;
                             });
                             debugPrint(" Login Requested");
                             try {
                               String phone =
                               _phoneController.text.toString().trim();
                               String pass =
                               _passwordController.text.toString().trim();
                               if (phone != "" && pass != "")
                                   requestLogin(phone, pass);
                               else
                                 setState(() {
                                   _loading = false;
                                   if(phone == "")
                                     _validatePhone = true;
                                   if(pass == "")
                                     _validatePassword = true;
                                 });
                             } catch (e) {
                               debugPrint(e);
                             }
                           },
                           child: Container(
                             alignment: Alignment.center,
                             width: 80,
                             height: 40,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Orange,
                             ),
                             child: Text(
                               "Login",
                               style: TextStyle(color: Colors.white),
                             ),
                           ),
                         ),
                         SizedBox(
                           height: 20,
                         ),
                         Text("Or"),
                         SizedBox(
                           height: 20,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("Sign-In with E-mail"),
                             InkWell(
                               onTap: () {
                                 debugPrint("G-mail Sign In Requested");
                               },
                               child: Container(
                                 width: 30,
                                 height: 30,
                                 margin: EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                     image: DecorationImage(
                                         image: AssetImage(
                                             'assets/images/google.jpg'))),
                               ),
                             ),
                           ],
                         )
                       ],
                     )
                   ],
                 )),
           ),
           Visibility(
             visible: _loading,
             child: Container(
               alignment: Alignment.center,
               width: _width,
               height: _height,
               child: CircularProgressIndicator(backgroundColor: Orange,),
               color: FakeWhite.withOpacity(0.5),
             ),
           )
         ],
        ),
      ),
    );
  }

   requestLogin(String phone, String pass) {

  }
}
