import 'package:bazar/ui/screens/auth/screens/login.dart';
import 'package:bazar/ui/screens/auth/screens/register.dart';
import 'package:bazar/ui/screens/static/UndefinedScreen.dart';
import 'package:bazar/util/Router/routeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginRoute:
      return CupertinoPageRoute(builder: (context) => Login());
    case RegisterRoute:
      return CupertinoPageRoute(builder: (context) => Register());
    case HomeRoute:
      return CupertinoPageRoute(builder: (context) => Home());
    default:
      return CupertinoPageRoute(
        builder: (context) => UndefinedScreen(),
      );
  }
}
