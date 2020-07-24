import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/product/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesGrid extends StatefulWidget {
  final double width;
  final double height;

  CategoriesGrid({this.width, this.height});

  @override
  _CategoriesGridState createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  List<Category> _list;

  @override
  void initState() {
    _list = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.8,
      width: widget.width * 0.8,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(border: Border.all(width: 0.4,color: Maroon)),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Container(
            height: widget.height * 0.8,
            width: widget.width * 0.8,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Icon(
                      _list[index].iconData,
                      color: Orange,
                    ),
                    flex: 8,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 4,
                    ),
                    flex: 2,
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        _list[index].title,
                        style: TextStyle(fontSize: 10, color: Orange),
                      ),
                    ),
                    flex: 2,
                  )
                ],
              ),
              color: White,
            ),
          );
        }),
      ),
    );
  }

  List<Category> getCategories() {
    return [
      Category("Tv Recharge", ["Milk", "Dairy"], FontAwesomeIcons.satellite),
      Category("Phone Recharge", ["Milk", "Dairy"], FontAwesomeIcons.phone),
      Category("Game Pad", ["Milk", "Dairy"], FontAwesomeIcons.gamepad),
      Category("Football", ["Milk", "Dairy"], FontAwesomeIcons.footballBall),
      Category("Dice", ["Milk", "Dairy"], FontAwesomeIcons.diceSix),
      Category("Laptop", ["Milk", "Dairy"], FontAwesomeIcons.laptopCode),
      Category("Cubes", ["Milk", "Dairy"], FontAwesomeIcons.cubes),
      Category("Coffee", ["Milk", "Dairy"], FontAwesomeIcons.coffee),
      Category("Cake", ["Milk", "Dairy"], FontAwesomeIcons.birthdayCake)
    ];
  }
}
