import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class OffersHighlightedProductsSlider extends StatefulWidget {
  final bool flag;
  OffersHighlightedProductsSlider({this.flag});

  @override
  _OffersHighlightedProductsSliderState createState() => _OffersHighlightedProductsSliderState();
}

class _OffersHighlightedProductsSliderState extends State<OffersHighlightedProductsSlider> {


  List<String> _list = ["https://www.bigbasket.com/media/uploads/banner_images/All_PetStore_DT_3_1130x400_25thJune.jpg",
  "https://www.bigbasket.com/media/uploads/banner_images/NNP2555-1200X300-29thjuly.jpg",
  "https://www.bigbasket.com/media/uploads/banner_images/NNP2547-1200X300-29thjuly.jpg",
  "https://www.bigbasket.com/media/uploads/banner_images/NNP2544-1200X300-29thjuly.jpg",
  "https://www.bigbasket.com/media/uploads/banner_images/All_Bakery_DT_2_1130x400_25thJune.jpg",
  "https://www.bigbasket.com/media/uploads/banner_images/2007067_icecreams-frozen_400.jpg",];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 10,bottom: 10),
      color: FakeWhite,
      child: CarouselSlider.builder(
        options: CarouselOptions(height: (widget.flag!=null && widget.flag)?_height*0.2:_height*0.3,autoPlay: true,autoPlayAnimationDuration: Duration(milliseconds: 300),),
        itemCount: 6,
        itemBuilder: (BuildContext context, int itemIndex) =>
            Container(
              width: _width,
              height: (widget.flag!=null && widget.flag)?_height*0.2:_height*0.3,
              decoration: BoxDecoration(
                  color: White,
                  border: Border.all(width: 0.1),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          (widget.flag!=null && widget.flag)?_list[itemIndex]:_list[itemIndex]))),
            ),
      ),
    );
  }
}
