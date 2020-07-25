import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'file:///F:/Sadar/bazar/lib/ui/widgets/large/ProductWidgets/MultiListWidgets/ListProductsHorizontal.dart';
import 'file:///F:/Sadar/bazar/lib/ui/widgets/large/ProductWidgets/MultiListWidgets/OffersHighlightedProductsSlider.dart';
import 'package:bazar/util/loader/ProductLoader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: White,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
