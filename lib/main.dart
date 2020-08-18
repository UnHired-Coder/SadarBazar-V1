import 'package:bazar/ui/screens/mainscreens/CartUtil/CartViewModel.dart';
import 'package:bazar/ui/screens/static/UndefinedScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'assets/colors/ThemeColors.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartViewModel(),
    child: RestartWidget(
        child: new MaterialApp(
      home: UndefinedScreen(),
      debugShowCheckedModeBanner: false,
    )),
  ));
}

onWillPopup() {}

class RestartWidget extends StatefulWidget {
  final Widget child;

  RestartWidget({this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Maroon));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
