import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/ui/widgets/MultipleBuilders/HomeListItem.dart';
import 'package:bazar/ui/widgets/animated/AnimatedCartButton.dart';
import 'package:bazar/ui/widgets/animated/AnimatedNotificationButton.dart';
import 'package:bazar/ui/widgets/large/CustomSilverAppBar.dart';
import 'package:bazar/util/loader/ProductLoader.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductItem> _productItems;
  List<HomeListItem> _homeItems;
  int _currentIndex, _lastFetch;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _lastFetch = 0;
    _productItems = new List();
    _homeItems = new List();
    _loadMoreItems();
  }

  void _loadMoreItems() async {
    await ProductLoader().getMoreProducts(context).then((value) {
      _productItems.addAll(value);
      _homeItems.add(new PromoteItemTile(products: _productItems, flag: false));
      _currentIndex++;
      _homeItems.add(new ShopItemGridTile(
          products: _productItems.sublist(_currentIndex, _currentIndex + 4),
          flag: false));
      _currentIndex += 4;
    }).then((value) {
      _lastFetch = _productItems.length;
      debugPrint(_productItems.length.toString() + " Items Fetched");
      setState(() {});
    });
  }

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
          delegate: SliverChildBuilderDelegate((BuildContext context, index) {
            return (_homeItems != null)
                ? (index == 0)
                    ? _homeItems[index].promoteItemTile(context)
                    : (index == 1)
                        ? _homeItems[index].shopItemGrid(context)
                        : Container(
                            color: Maroon,
                          )
                : Container(
                    color: Maroon,
                  );
          }, childCount: _homeItems.length),
        )
      ],
    );
  }
}

//[
//
//OffersHighlightedProductsSlider(
//highlightList: [],
//),
//PromoteItem(
//height: 100,
//productItem: null,
//),
//OffersHighlightedProductsSlider(
//flag: true,
//highlightList: [],
//),
//ListProductHorizontal(
//productItemsHorizontal: [],
//),
//CategoriesGrid(
//height: _height * 0.4,
//width: _width,
//),
//ImageProductHighlight(
//productItem: null,
//),
//PromoteItem(
//height: 100,
//productItem: null,
//),
//ImageProductHighlight(
//flag: true,
//productItem: null,
//),
//]
