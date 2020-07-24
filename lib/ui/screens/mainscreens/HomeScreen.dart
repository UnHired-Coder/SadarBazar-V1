import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/widgets/animated/AnimatedCartButton.dart';
import 'package:bazar/ui/widgets/animated/AnimatedNotificationButton.dart';
import 'package:bazar/ui/widgets/large/CustomSilverAppBar.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ImageProductHighlight.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ListProductsHorizontal.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/OffersHighlightedProductsSlider.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/PromoteItem.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ShopItemGrid.dart';
import 'package:bazar/ui/widgets/small/CategoriesGrid.dart';
import 'package:bazar/ui/widgets/small/CategoriesListWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      // Key::PageStorageKey("HomeScreen"),
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          backgroundColor: Maroon,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logoWhite.png"))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedCartButton(),
                AnimatedNotificationButton(),
              ],
            )
          ]),
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            background: CustomSilverAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            CategoriesListWidget(
              productCategory: [],
            ),
            OffersHighlightedProductsSlider(
              highlightList: [],
            ),
            ShopItemGrid(
              gridOfProducts: [],
            ),
            PromoteItem(
              height: 100,
              productItem: null,
            ),
            OffersHighlightedProductsSlider(
              flag: true,
              highlightList: [],
            ),
            ShopItemGrid(
              gridOfProducts: [],
            ),
            ListProductHorizontal(
              productItemsHorizontal: [],
            ),
            CategoriesGrid(
              height: _height * 0.4,
              width: _width,
            ),
            ImageProductHighlight(
              productItem: null,
            ),
            PromoteItem(
              height: 100,
              productItem: null,
            ),
            ImageProductHighlight(
              flag: true,
              productItem: null,
            ),
          ]),
        )
      ],
    );
  }
}
