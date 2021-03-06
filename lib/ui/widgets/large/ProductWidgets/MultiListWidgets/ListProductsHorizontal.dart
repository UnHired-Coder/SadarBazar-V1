import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ShopItemVertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListProductHorizontal extends StatefulWidget {
  final bool flag;
  final List<ProductItem> productItemsHorizontal;

  ListProductHorizontal({this.flag, @required this.productItemsHorizontal});

  @override
  _ListProductHorizontalState createState() => _ListProductHorizontalState();
}

class _ListProductHorizontalState extends State<ListProductHorizontal> {
  List<String> _list = ["1", "2", "3", "4"];
  bool _flag;

  @override
  void initState() {
    super.initState();

    _flag = widget.productItemsHorizontal != null &&
            widget.productItemsHorizontal.length >= 4
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: _flag,
//    visible: true,
      child: Container(
        width: _width,
        height: 230,
        child: new ListView.builder(
            itemCount: _list.length + 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              if (index == _list.length)
                return Container(
                  width: _width * 0.35,
                  height: 230,
                  color: FakeWhite,
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () {
                        debugPrint("See all similar");
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        alignment: Alignment.center,
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(color: Maroon,borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "See All",
                          style: TextStyle(color: FakeWhite, fontSize: 12),
                        ),
                      )),
                );
              else
                return ShopItemVertical(
                  width: _width * 0.35,
                  height: 230,
                  code: [1, 1, 1, 1],
                  productItem: widget.productItemsHorizontal[index],
                );
            }),
      ),
    );
  }

  Widget buildBody(BuildContext context, int index) {
    return new Text(_list[index]);
  }
}
