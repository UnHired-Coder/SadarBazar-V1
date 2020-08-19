import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/ui/screens/LaunchScreenWith/CategoryResultsView.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EasyFindHighlightedCategories extends StatefulWidget {
  final List<ProductCategory> categories;
  final bool flag;

  EasyFindHighlightedCategories({@required this.categories, this.flag});

  @override
  _EasyFindHighlightedCategoriesState createState() =>
      _EasyFindHighlightedCategoriesState();
}

class _EasyFindHighlightedCategoriesState
    extends State<EasyFindHighlightedCategories> {
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
    _flag = !(widget.categories.length == 0);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: _flag,
      child: CarouselSlider.builder(
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  debugPrint("Open Items in this category " +
                      widget.categories[0].categoryName);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryResultsView(
                          categories: widget.categories,
                          flag: widget.flag,
                        ),
                      ));
                },
                child: Container(
                  height: _height * 0.1,
                  width: _width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.categories[index].categoryPictureUrl),
                          fit: BoxFit.contain)),
                ),
              ),
            );
          },
          itemCount: widget.categories.length,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 1,
            height: _height * 0.2,
            viewportFraction: 1,
          )),
    );
  }
}
