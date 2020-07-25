import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:flutter/material.dart';

class PromoteItem extends StatefulWidget {
  final bool flag;
  final List<ProductItem> products;

  PromoteItem({this.flag, @required this.products});

  @override
  _PromoteItemState createState() => _PromoteItemState();
}

class _PromoteItemState extends State<PromoteItem> {
  bool _flag;

  @override
  void initState() {
    super.initState();
    _flag = widget.products[0] != null ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 0.15;
    double _width = MediaQuery.of(context).size.width;
    return Visibility(
//      visible: true,
      visible: _flag,
      child: InkWell(
        onTap: () {
          debugPrint("Open for promote Item");
        },
        child: Container(
          color: Maroon.withOpacity(0.2),
          padding: EdgeInsets.all(0.1),
          margin: EdgeInsets.all(2),
          child: Container(
            width: _width,
            height: _height,
            color: White,
            margin: EdgeInsets.all(1),
            child: Row(children: [
              Flexible(
                child: Container(
                  height: _height,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.products[0].productPictureUrl))),
                ),
                flex: 3,
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.centerRight,
                  height: _height,
                  color: White,
                  child: InkWell(
                    onTap: () {
                      debugPrint("Explore Item");
                    },
                    child: Container(
                      width: 80,
                      height: 30,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Orange,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "Know More",
                        style: TextStyle(color: White),
                      ),
                    ),
                  ),
                ),
                flex: 7,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
