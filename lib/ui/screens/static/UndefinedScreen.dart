import 'package:flutter/material.dart';

import '../auth/services/AuthStateService.dart';
import 'package:bazar/util/Router/routes.dart' as router;

class UndefinedScreen extends StatefulWidget {
  @override
  _UndefinedScreenState createState() => _UndefinedScreenState();
}

class _UndefinedScreenState extends State<UndefinedScreen> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: AuthStateService().checkUserLogged(),
      onGenerateRoute: router.generateRoute,
      debugShowCheckedModeBanner: false,
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => UndefinedScreen()),
    );
  }
}
