import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/ui/widgets/MultipleBuilders/HomeListItem.dart';
import 'package:bazar/ui/widgets/animated/AnimatedCartButton.dart';
import 'package:bazar/ui/widgets/animated/AnimatedNotificationButton.dart';
import 'package:bazar/ui/widgets/large/CustomSilverAppBar.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/MultiListWidgets/ShopItemGrid.dart';
import 'package:bazar/util/loader/ProductLoader.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductItem> _productItems;
  List<ProductCategory> _productCategories;
  List<HomeListItem> _homeItems;
  int _currentItemIndex, _lastItemFetch;
  int _currentCategoryIndex, _lastCategoryFetch;
  bool _loading;

  final List<int> _scheme = [7,3,1,0,2,6,1,5,0,2,1,4,0,6,1,0,5];

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
    await ProductLoader.getMoreProducts(context).then((value) async {
      _productItems.addAll(value);
    }).then((value) {
      _lastItemFetch = _productItems.length;
      debugPrint(_productItems.length.toString() + " Items Fetched");
       _loadMoreCategories();
    });
  }

  void _loadMoreCategories() async {
    await ProductLoader.getMoreCategories(context).then((value) async {
      _productCategories.addAll(value);
    }).then((value) async {
      _lastCategoryFetch = _productCategories.length;
      debugPrint(_productCategories.length.toString() + " Items Fetched");
      if (this.mounted) setState(() {
        _loading = false;
      });
      _fillList();
    });
  }

  Future<void> _fillList() async {
    for (int i = 0; i < _scheme.length; i++) {
//      debugPrint(_currentItemIndex.toString());
//      debugPrint(_currentCategoryIndex.toString());
      switch (_scheme[i]) {
        case 0:
          {
            _homeItems.add( PromoteItemTile(
                products: _productItems.sublist(
                    _currentItemIndex, _currentItemIndex + 1),
                flag: false));
            _currentItemIndex++;
            break;
          }
        case 1:
          {
            _homeItems.add( ShopItemGridTile(
                products: _productItems.sublist(
                    _currentItemIndex, _currentItemIndex + 4),
                flag: false));
            _currentItemIndex += 4;
            break;
          }
        case 2:
          {
            _homeItems.add( ProductsListHTile(
                products: _productItems.sublist(
                    _currentItemIndex, _currentItemIndex + 4),
                flag: false));
            _currentItemIndex += 4;
            break;
          }
        case 3:
          {
            _homeItems.add( OffersHighlightedTile(
                categories: _productCategories.sublist(
                    _currentCategoryIndex, _currentCategoryIndex + 4),flag: false));
            _currentCategoryIndex += 4;
            break;
          }
        case 4:
          {
            _homeItems.add( ImageProductTile(
                categories: _productCategories.sublist(
                    _currentCategoryIndex, _currentCategoryIndex + 1),flag: false));
            _currentCategoryIndex += 1;
            break;
          }
        case 5:
          {
            _homeItems.add( OffersHighlightedTile(
                categories: _productCategories.sublist(
                    _currentCategoryIndex, _currentCategoryIndex + 4),flag: true));
            _currentCategoryIndex += 4;
            break;
          }
        case 6:
          {
            _homeItems.add( ImageProductTile(
                categories: _productCategories.sublist(
                    _currentCategoryIndex, _currentCategoryIndex + 1),flag: true));
            _currentCategoryIndex += 1;
            break;
          }
        case 7:
          {
            _homeItems.add( CategoryTile(
                categories: _productCategories.sublist(
                    _currentCategoryIndex, _currentCategoryIndex + 8),flag: true));
            _currentCategoryIndex += 8;
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
                ? (_loading)?Container(color: FakeWhite,):_buildItem(index)
                : Container(
                    color: Maroon,
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
}
