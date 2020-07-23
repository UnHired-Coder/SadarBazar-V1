import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/widgets/large/CustomSilverAppBar.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ImageProductHighlight.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ListProductsHorizontal.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/OffersHighlightedProductsSlider.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/PromoteItem.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ShopItemGrid.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ShopItemHorizontal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          backgroundColor: Maroon,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(height: 40,width: 40,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/logoWhite.png"))),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.shoppingCart,
                    size: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.solidBell,
                    size: 15,
                  ),
                )
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
            OffersHighlightedProductsSlider(),
            ShopItemGrid(),
            PromoteItem(
              height: 100,
            ),
            OffersHighlightedProductsSlider(flag: true,),
            ShopItemGrid(),
            ListItemHorizontal(),
            ImageProductHighlight(),
            PromoteItem(
              height: 100,
            ),
            ImageProductHighlight(flag: true,),
          ]),
        )
      ],
    );
  }
}
