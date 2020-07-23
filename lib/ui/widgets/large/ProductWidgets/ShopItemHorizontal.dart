import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopItemHorizontal extends StatefulWidget {
  final double width;
  final double height;
  final String price;
  final String name;
  final String qty;
  final String offer;
  final List<int> code;

  ShopItemHorizontal(
      {this.width,
      this.height,
      this.price,
      this.name,
      this.qty,
      this.offer,
      this.code});

  @override
  _ShopItemHorizontalState createState() => _ShopItemHorizontalState();
}

class _ShopItemHorizontalState extends State<ShopItemHorizontal> {
  List<int> code;

  @override
  void initState() {
    code = widget.code;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Maroon.withOpacity(0.2),
      padding: EdgeInsets.all(0.1),
      child: Container(
        width: widget.width,
        height: widget.height,
        color: White,
        margin: EdgeInsets.all(1),
        child: Row(
          children: [
            Visibility(
              visible: (code[0] == 1) ? true : false,
              child: Flexible(
                child: Container(
                  width: widget.width * 0.3,
                  height: widget.height,
                  color: FakeWhite,
                ),
                flex: 5,
              ),
            ),
            Visibility(
              visible: (code[1] == 1) ? true : false,
              child: Flexible(
                child: Container(
                  color: White,
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 10,top: 10),
                          child: Text(
                            "Rs 233/-",
                            style: TextStyle(
                                color: LightBlack.withOpacity(0.8), fontSize: 13),
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Tomato",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "3 Kg",
                            style: TextStyle(
                              color: LightBlack.withOpacity(0.6),
                            ),
                          )),
                    ],
                  ),
                ),
                flex: 4,
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.all(3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: (code[2] == 1) ? true : false,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 20,
                          color: Green,
                          padding: EdgeInsets.all(1),
                          child: Text(
                            "20%",
                            style: TextStyle(fontSize: 12, color: FakeWhite),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: (code[3] == 1) ? true : false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Orange,
                                borderRadius: BorderRadius.circular(5)),
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(4),
                            height: 30,
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    debugPrint("Add Item");
                                  },
                                  child: Container(
                                    width: 40,
                                    margin: EdgeInsets.only(left: 4),
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                          color: White,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 0.5,
                                  color: White,
                                ),
                                InkWell(
                                  onTap: () {
                                    debugPrint("Add More");
                                  },
                                  child: Container(
                                      width: 15,
                                      child: Icon(
                                        FontAwesomeIcons.plus,
                                        size: 10,
                                        color: White,
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }
}
