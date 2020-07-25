import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HeaderImagesProductView extends StatefulWidget {
  final bool flag;
  final List<ProductItem> products;

  HeaderImagesProductView({this.flag, this.products});

  @override
  _HeaderImagesProductViewState createState() =>
      _HeaderImagesProductViewState();
}

class _HeaderImagesProductViewState extends State<HeaderImagesProductView> {
  bool _flag;

  @override
  void initState() {
    super.initState();
    _flag =
        widget.products != null && widget.products.length >= 1 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Visibility(
      visible: _flag,
//    visible: true,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        color: White,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 1.1,
            viewportFraction: 1,
            height: (widget.flag != null && widget.flag)
                ? _height * 0.2
                : _height * 0.3,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(milliseconds: 300),
          ),
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, int itemIndex) => Container(
            margin: EdgeInsets.all(2),
            height: (widget.flag != null && widget.flag)
                ? _height * 0.2
                : _height * 0.3,
            decoration: BoxDecoration(
                color: White,
                border: Border.all(width: 0.1),
                image: DecorationImage(
                    fit: (widget.flag != null && widget.flag)
                        ? BoxFit.scaleDown
                        : BoxFit.scaleDown,
                    image: NetworkImage((widget.flag != null && widget.flag)
                        ? widget.products[itemIndex].productPictureUrl
                        : widget.products[itemIndex].productPictureUrl))),
          ),
        ),
      ),
    );
  }
}
