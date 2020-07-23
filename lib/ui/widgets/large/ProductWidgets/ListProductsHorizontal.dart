import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ShopItemVertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListItemHorizontal extends StatefulWidget {
  @override
  _ListItemHorizontalState createState() => _ListItemHorizontalState();
}

class _ListItemHorizontalState extends State<ListItemHorizontal> {
  List<String> litems = ["1","2","Third","4"];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      height: 230,
      child:  new ListView.builder
        (
          itemCount: litems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) =>  ShopItemVertical(
              width: _width * 0.35,
              height: 230,
              code: [1, 1, 1, 1],
            ),
      ),
    );
  }
  Widget buildBody(BuildContext ctxt, int index) {
    return new Text(litems[index]);
  }
}
