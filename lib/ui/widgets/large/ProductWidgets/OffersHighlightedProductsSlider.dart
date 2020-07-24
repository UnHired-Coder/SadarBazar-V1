import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OffersHighlightedProductsSlider extends StatefulWidget {
  final bool flag;
  final List<ProductCategory> highlightList;

  OffersHighlightedProductsSlider({this.flag, @required this.highlightList});

  @override
  _OffersHighlightedProductsSliderState createState() =>
      _OffersHighlightedProductsSliderState();
}

class _OffersHighlightedProductsSliderState
    extends State<OffersHighlightedProductsSlider> {
  List<String> _list = [
    "https://www.bigbasket.com/media/uploads/banner_images/All_PetStore_DT_3_1130x400_25thJune.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2555-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2547-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2544-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/All_Bakery_DT_2_1130x400_25thJune.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/2007067_icecreams-frozen_400.jpg",
  ];

  bool _flag;

  @override
  void initState() {
    super.initState();
    _flag = widget.highlightList != null && widget.highlightList.length >= 1
        ? true
        : false;
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
          itemCount: 6,
          itemBuilder: (BuildContext context, int itemIndex) => Container(
            height: (widget.flag != null && widget.flag)
                ? _height * 0.2
                : _height * 0.3,
            decoration: BoxDecoration(
                color: White,
                border: Border.all(width: 0.1),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage((widget.flag != null && widget.flag)
                        ? _list[itemIndex]
                        : _list[itemIndex]))),
          ),
        ),
      ),
    );
  }
}
