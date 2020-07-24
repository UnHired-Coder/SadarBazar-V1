import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/widgets/animated/AddIProductButton.dart';
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
    return InkWell(
      onTap: () {
        debugPrint("Open for this Item");
      },
      child: Container(
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
                    decoration: BoxDecoration(
                        color: White,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://www.bigbasket.com/media/uploads/p/mm/20000745_5-fresho-bottle-gourd.jpg"))),
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
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              "Rs 233/-",
                              style: TextStyle(
                                  color: LightBlack.withOpacity(0.8),
                                  fontSize: 13),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                              visible: (code[3] == 1) ? true : false,
                              child: AddProductButton(
                                width: widget.height,
                                height: widget.width,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                flex: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
