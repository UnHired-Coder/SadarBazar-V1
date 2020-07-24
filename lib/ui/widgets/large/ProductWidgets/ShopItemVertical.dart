import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/widgets/animated/AddIProductButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopItemVertical extends StatefulWidget {
  final double width;
  final double height;
  final String price;
  final String name;
  final String qty;
  final String offer;
  final List<int> code;

  ShopItemVertical(
      {this.width,
      this.height,
      this.price,
      this.name,
      this.qty,
      this.offer,
      this.code});

  @override
  _ShopItemVerticalState createState() => _ShopItemVerticalState();
}

class _ShopItemVerticalState extends State<ShopItemVertical> {
  List<int> code;

  @override
  void initState() {
    code = widget.code;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Maroon,
      margin: EdgeInsets.all(1),
      child: Column(
        children: [
          Visibility(
            visible: (code[0] == 1) ? true : false,
            child: Flexible(
              child: Container(
                height: widget.height * 0.1,
                width: widget.width,
                color: White,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 20,
                      color: Green,
                      padding: EdgeInsets.all(1),
                      child: Text(
                        "20%",
                        style: TextStyle(fontSize: 12, color: FakeWhite),
                      ),
                    )
                  ],
                ),
              ),
              flex: 1,
            ),
          ),
          Visibility(
            visible: (code[1] == 1) ? true : false,
            child: Flexible(
              child: Container(
                height: widget.height * 0.5,
                width: widget.width,
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
            visible: (code[2] == 1) ? true : false,
            child: Flexible(
              child: Container(
                height: widget.height * 0.3,
                width: widget.width,
                color: White,
                padding: EdgeInsets.only(left: 10, top: 4),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Rs 233/-",
                          style: TextStyle(
                              color: LightBlack.withOpacity(0.8), fontSize: 13),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tomato",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
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
              flex: 3,
            ),
          ),
          Visibility(
            visible: (code[3] == 1) ? true : false,
            child: Flexible(
              child: AddProductButton(width:  widget.width,height:  widget.height,),
//              Container(
//                height: widget.height * 0.2,
//                width: widget.width,
//                color: White,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    Container(
//                      decoration: BoxDecoration(
//                          color: Orange,
//                          borderRadius: BorderRadius.circular(5)),
//                      alignment: Alignment.center,
//                      margin: EdgeInsets.all(4),
//                      height: 30,
//                      width: 100,
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceAround,
//                        children: [
//                          InkWell(
//                            onTap: () {
//                              debugPrint("Add Item");
//                            },
//                            child: Container(
//                              width: 40,
//                              margin: EdgeInsets.only(left: 4),
//                              child: Text(
//                                "Add",
//                                style: TextStyle(
//                                    color: White, fontWeight: FontWeight.bold),
//                              ),
//                            ),
//                          ),
//                          SizedBox(
//                            width: 10,
//                          ),
//                          Container(
//                            width: 0.5,
//                            color: White,
//                          ),
//                          InkWell(
//                            onTap: () {
//                              debugPrint("Add More");
//                            },
//                            child: Container(
//                                width: 15,
//                                child: Icon(
//                                  FontAwesomeIcons.plus,
//                                  size: 10,
//                                  color: White,
//                                )),
//                          )
//                        ],
//                      ),
//                    )
//                  ],
//                ),
//              ),
              flex: 2,
            ),
          )
        ],
      ),
    );
  }
}
