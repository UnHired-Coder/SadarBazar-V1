import 'dart:math';
import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:bazar/ui/screens/LaunchScreenWith/CategoryResultsView.dart';
import 'package:bazar/ui/screens/LaunchScreenWith/ProductView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopItemGrid extends StatefulWidget {
  final bool flag;
  final List<ProductItem> gridOfProducts;

  ShopItemGrid({this.flag, @required this.gridOfProducts});

  @override
  _ShopItemGridState createState() => _ShopItemGridState();
}

class _ShopItemGridState extends State<ShopItemGrid> {
  bool _flag;
  List<Color> colors = [
    Colors.cyanAccent,
    Colors.greenAccent,
    Colors.pinkAccent
  ];
  Random rnd = new Random();
  Color color;

  @override
  void initState() {
    super.initState();
    color = colors[rnd.nextInt(2)];
    _flag = widget.gridOfProducts != null && widget.gridOfProducts.length == 4
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _flag,
//      visible: true,
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Container(),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: color,
                          border: Border.all(color: Black, width: 0.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: EdgeInsets.all(1),
                            child: Text(
                              "Checkout these Amazing products!!",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              debugPrint("See all");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryResultsView(
                                      category: widget.gridOfProducts[0]
                                          .productCategoryName,
                                      flag: false,
                                    ),
                                  ));
                            },
                            elevation: 0,
                            color: FakeWhite,
                            child: Text(
                              "See all",
                              style: TextStyle(color: Black),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  color: color,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProductGridItem(
                        gridOfProducts: widget.gridOfProducts,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProductGridItem extends StatefulWidget {
  final bool flag;
  final List<ProductItem> gridOfProducts;

  ProductGridItem({this.flag, this.gridOfProducts});

  @override
  _ProductGridItemState createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: White,
        border: Border.all(width: 0.1),
      ),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.4,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _item(0),
                _item(1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _item(2),
                _item(3),
              ],
            )
          ],
        ),

//        child: GridView.count(
//          physics: NeverScrollableScrollPhysics(),
//          shrinkWrap: false,
//          crossAxisCount: 2,
//          mainAxisSpacing: 0,
//          children: List.generate(4, (index) {
//            return Container(
//              alignment: Alignment.center,
//              child: _item(index),
//              decoration:
//                  BoxDecoration(border: Border.all(width: 0.02, color: Black)),
//            );
//          }),
//        ),
      ),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: [_item(), _item()],
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: [_item(), _item()],
//          )
//        ],
//      ),
    );
  }

  Widget _item(int index) {
    return InkWell(
      onTap: () {
        debugPrint("Explore this category item");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductView(
                productItem: widget.gridOfProducts.elementAt(index),
                flag: false,
              ),
            ));
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.height * 0.15,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: White,
                  image: DecorationImage(
                      image: NetworkImage(widget.gridOfProducts
                          .elementAt(index)
                          .productPictureUrl))),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _text(widget.gridOfProducts.elementAt(index).productName, true),
              Container(
                child: _text(
                    widget.gridOfProducts
                            .elementAt(index)
                            .productDiscount
                            .toString() +
                        "% Off",
                    false),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _text(String text, bool flag) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: FakeWhite),
      width: MediaQuery.of(context).size.width * 0.3,
      padding: EdgeInsets.all(2),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: flag ? Black : LightBlack, fontSize: flag ? 13 : 10),
      ),
    );
  }
}
