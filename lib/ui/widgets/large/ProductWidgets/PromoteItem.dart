import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/material.dart';

class PromoteItem extends StatefulWidget {
  final double width;
  final double height;

  PromoteItem({this.width, this.height});

  @override
  _PromoteItemState createState() => _PromoteItemState();
}

class _PromoteItemState extends State<PromoteItem> {
  @override
  void initState() {
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
        child: Row(children: [
          Flexible(
            child: Container(
              height: widget.height,
              color: FakeWhite,
            ),
            flex: 3,
          ),
          Flexible(
            child: Container(
              alignment: Alignment.centerRight,
              height: widget.height,
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
                      color: Orange, borderRadius: BorderRadius.circular(8 )),
                child: Text("Know More",style: TextStyle(color: White),),
                ),
              ),
            ),
            flex: 7,
          )
        ]),
      ),
    );
  }
}
