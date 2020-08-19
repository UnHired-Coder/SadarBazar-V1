import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:bazar/ui/widgets/MultipleBuilders/HomeListItem.dart';
import 'package:bazar/ui/widgets/animated/AnimatedCartButton.dart';
import 'package:bazar/ui/widgets/animated/AnimatedNotificationButton.dart';
import 'package:bazar/ui/widgets/large/CustomSilverAppBar.dart';
import 'package:bazar/util/loader/ProductLoadUtil.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen>{


  List<ProductItem> _productItems;
  List<ProductCategory> _productCategories;
  List<HomeListItem> _homeItems;
  int _currentItemIndex, _lastItemFetch;
  int _currentCategoryIndex, _lastCategoryFetch;
  bool _loading;

//  final List<int> _scheme = [7,3,1,0,2,6,1,5,0,2,1,4,0,6,1,0,5];
  final List<int> _scheme = [
    3,
    1,
    0,
    2,
    6,
    1,
    5,
    0,
    2,
    1,
    4,
    0,
    6,
    1,
    0,
    5,
    3,
    1,
    0,
    2,
    6,
    1,
    5,
    0,
    2,
    1,
    4,
    0,
    2,
    6,
    1,
    0,
    2,
    0,
    5
  ];

  @override
  void initState() {
    super.initState();
    _currentItemIndex = 0;
    _lastItemFetch = 0;
    _currentCategoryIndex = 0;
    _lastCategoryFetch = 0;
    _productItems = new List();
    _homeItems = new List();
    _productCategories = new List();
    _loading = true;
    _loadMoreItems();
//    _loadMoreCategories();
  }

  void _loadMoreItems() async {
    await ProductLoaderUtil.getMoreProducts(context).then((value) {
//      debugPrint("1");
      _productItems.addAll(value);
      ProductLoaderUtil.cacheLoadedProducts(_productItems);
    }).then((value) {
//      debugPrint("2");
      _lastItemFetch = _productItems.length;
      debugPrint(_productItems.length.toString() + " Items Fetched");
      _loadMoreCategories();
    });

//    await ProductLoader.getMoreProducts(context).then((value) async {
//      _productItems.addAll(value);
//    }).then((value) {
//      _lastItemFetch = _productItems.length;
//      debugPrint(_productItems.length.toString() + " Items Fetched");
//       _loadMoreCategories();
//    });
  }

  void _loadMoreCategories() async {
//    debugPrint("3");
    await ProductLoaderUtil.getMoreCategories(context).then((value) {
      _productCategories.addAll(value);
      ProductLoaderUtil.cacheLoadedCategories(_productCategories);
//      debugPrint("4");
    }).then((value) {
      _lastCategoryFetch = _productCategories.length;
      debugPrint(_productCategories.length.toString() + " Items Fetched");
      if (this.mounted)
        setState(() {
          _loading = false;
//          debugPrint("5");
        });
      _fillList();
    });

//    await ProductLoader.getMoreCategories(context).then((value) async {
//      _productCategories.addAll(value);
//    }).then((value) async {
//      _lastCategoryFetch = _productCategories.length;
//      debugPrint(_productCategories.length.toString() + " Items Fetched");
//      if (this.mounted) setState(() {
//        _loading = false;
//      });
//      _fillList();
//    });
  }

  Future<void> _fillList() async {
//    debugPrint("6");
    for (int i = 0; i < _scheme.length; i++) {
//      debugPrint(_currentItemIndex.toString());
//      debugPrint(_currentCategoryIndex.toString());
      switch (_scheme[i]) {
        case 0:
          {
            _homeItems.add(PromoteItemTile(
                products: _productItems.sublist(
                    _currentItemIndex, _currentItemIndex + 1),
                flag: false));
            _currentItemIndex++;
            break;
          }
        case 1:
          {
            _homeItems.add(ShopItemGridTile(
                products: _productItems.sublist(
                    _currentItemIndex, _currentItemIndex + 4),
                flag: false));
            _currentItemIndex += 4;
            break;
          }
        case 2:
          {
            _homeItems.add(ProductsListHTile(
                products: _productItems.sublist(
                    _currentItemIndex, _currentItemIndex + 4),
                flag: false));
            _currentItemIndex += 4;
            break;
          }
        case 3:
          {
            _homeItems.add(OffersHighlightedTile(
                categories: _productCategories.sublist(
                    _currentCategoryIndex, _currentCategoryIndex + 4),
                flag: false));
            _currentCategoryIndex += 2;
            break;
          }
        case 4:
          {
            _homeItems.add(ImageProductTile(
                categories: _productItems.sublist(
                    _currentItemIndex, _currentItemIndex + 1),
                flag: false));
            _currentItemIndex += 1;
            break;
          }
        case 5:
          {
            _homeItems.add(OffersHighlightedTile(
                categories: _productCategories.sublist(
                    _currentCategoryIndex, _currentCategoryIndex + 4),
                flag: true));
//            _currentCategoryIndex += 4;
            break;
          }
        case 6:
          {
            _homeItems.add(ImageProductTile(
                categories: _productItems.sublist(
                    _currentItemIndex, _currentItemIndex + 1),
                flag: true));
            _currentItemIndex += 1;
            break;
          }
        case 7:
          {
            _homeItems.add(CategoryTile(
                categories: _productCategories.sublist(
                    _currentCategoryIndex, _currentCategoryIndex + 6),
                flag: true));
//            _currentCategoryIndex += 6;
            break;
          }
      }
    }
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
                AnimatedCartButton(
                  cartButtonCallback: () {},
                ),
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
                ? (_loading)
                    ? SizedBox(
                        width: _width,
                        height: 300.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.3),
                          highlightColor: FakeWhite,
                          child: Container(
                            width: _width,
                            height: 200,
                            color: LightBlack,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                      )
                    : _buildItem(index)
                : Container(
                    child: Container(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          backgroundColor: Maroon,
                          strokeWidth: 2,
                        )),
                  );
          }, childCount: _scheme.length),
//        delegate: SliverChildListDelegate([
//          ShopItemGrid(gridOfProducts: _productItems.sublist(0,4),flag: false,)
//        ]),
        )
      ],
    );
  }

  Widget _buildItem(int index) {
    Widget w;
    switch (_scheme[index]) {
      case 0:
        {
          w = _homeItems[index].promoteItemTile(context);
          break;
        }
      case 1:
        {
          w = _homeItems[index].shopItemGrid(context);
          break;
        }
      case 2:
        {
          w = _homeItems[index].productsListHTile(context);
          break;
        }
      case 3:
        {
          w = _homeItems[index].offersHighlightedTile(context);
          break;
        }
      case 4:
        {
          w = _homeItems[index].imageProductTile(context);
          break;
        }
      case 5:
        {
          w = _homeItems[index].offersHighlightedTile(context);
          break;
        }
      case 6:
        {
          w = _homeItems[index].imageProductTile(context);
          break;
        }
      case 7:
        {
          w = _homeItems[index].categoryTile(context);
          break;
        }
    }
    return w;
  }

  @override
  bool get wantKeepAlive {
    return true;
  }
}
