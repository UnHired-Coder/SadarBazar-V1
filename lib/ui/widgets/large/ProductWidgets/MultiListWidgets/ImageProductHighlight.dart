import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageProductHighlight extends StatefulWidget {
  final bool flag;
  final List<ProductItem> products;

  ImageProductHighlight({this.flag, @required this.products});

  @override
  _ImageProductHighlightState createState() => _ImageProductHighlightState();
}

class _ImageProductHighlightState extends State<ImageProductHighlight> {
  bool _flag;

  @override
  void initState() {
    super.initState();

    _flag = widget.products != null ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: _flag,
//    visible: true,
      child: InkWell(
        onTap: () {
          debugPrint("Image Explore Category");
        },
        child: Container(
          width: _width,
          height: (widget.flag != null && widget.flag)
              ? _height * 0.2
              : _height * 0.3,
          decoration: BoxDecoration(
              color: White,
              border: Border.all(width: 0.1),
              image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: NetworkImage(widget.products[0].productPictureUrl))),
        ),
      ),
    );
  }
}
