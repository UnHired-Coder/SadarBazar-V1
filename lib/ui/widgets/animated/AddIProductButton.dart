import 'dart:ffi';

import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddProductButton extends StatefulWidget {
  final double width;
  final double height;

  AddProductButton({this.width, this.height});

  @override
  _AddProductButtonState createState() => _AddProductButtonState();
}

class _AddProductButtonState extends State<AddProductButton> {
  int _count;

  @override
  void initState() {
    _count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.2,
      width: widget.width,
      color: White,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: (_count == 0)?Orange:White, borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            margin: EdgeInsets.all(4),
            height: 30,
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: (_count == 0)
                      ? InkWell(
                          onTap: () {
                            debugPrint("Add Item");
                            setState(() {
                              if(_count!=5)_count++;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Orange,borderRadius: BorderRadius.circular(12)),
                            margin: EdgeInsets.only(left: 4),
                            child: Text(
                              "Add",
                              style: TextStyle(
                                  color: White, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            debugPrint("Remove More");
                            setState(() {
                              _count--;
                            });
                          },
                          child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(color: Orange,borderRadius: BorderRadius.circular(12)),
                              alignment: Alignment.center,
                              child: Icon(
                                FontAwesomeIcons.minus,
                                size: 10,
                                color: White,
                              )),
                        ),
                ),
//                SizedBox(
//                  width: 10,
//                ),
                Container(
                  child: (_count == 0)
                      ? Container()
                      : Container(
                          height: 30,
                          alignment: Alignment.center,
                          width: 20,
                          color: White,
                          child: Text(
                            _count.toString(),
                            style: TextStyle(color: LightBlack, fontSize: 10),
                          ),
                        ),
                ),
                Container(
                  width: 0.5,
                  color: White,
                ),
                InkWell(
                  onTap: () {
                    debugPrint("Add More");
                    setState(() {
                      if(_count!=5)_count++;
                    });
                  },
                  child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Orange,borderRadius: BorderRadius.circular(12)),
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
    );
  }
}
