import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoryResultsView extends StatefulWidget {
  @override
  _CategoryResultsViewState createState() => _CategoryResultsViewState();
}

class _CategoryResultsViewState extends State<CategoryResultsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Men's Fashion",style: TextStyle(color: White,fontWeight: FontWeight.bold),)
        ],
      ),),
    );
  }
}
