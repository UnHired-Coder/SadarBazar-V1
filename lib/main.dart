import 'package:bazar/ui/screens/static/UndefinedScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RestartWidget(
      child: new MaterialApp(
    home: UndefinedScreen(),
    debugShowCheckedModeBanner: false,
  )));
}

onWillPopup() {
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

}
