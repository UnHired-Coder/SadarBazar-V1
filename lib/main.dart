import 'package:bazar/ui/screens/static/UndefinedScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RestartWidget(
      child: new MaterialApp(
    home: UndefinedScreen(),
    debugShowCheckedModeBanner: false,
  )));
}

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
  DateTime currentBackPressTime;

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      const SnackBar snackBar = SnackBar(
        content: Text('Tap back again to leave'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
