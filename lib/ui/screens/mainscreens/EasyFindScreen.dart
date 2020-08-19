import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:bazar/ui/screens/LaunchScreenWith/CategoryResultsView.dart';
import 'package:bazar/ui/widgets/MultipleBuilders/EasyFindListItem.dart';
import 'package:bazar/ui/widgets/large/EasyFindWidgets/EasyFindCategories.dart';
import 'package:bazar/ui/widgets/large/EasyFindWidgets/EasyFindGridCategories.dart';
import 'package:bazar/ui/widgets/large/EasyFindWidgets/EasyFindHighlightedCategories.dart';
import 'package:bazar/util/loader/ProductLoadUtil.dart';
import 'package:bazar/util/loader/ProductLoader.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EasyFindScreen extends StatefulWidget {
  @override
  _EasyFindScreenState createState() => _EasyFindScreenState();
}

class _EasyFindScreenState extends State<EasyFindScreen> {
  List<ProductItem> _productItems;
  List<ProductCategory> _productCategories;
  List<EasyFindListItem> _easyFindItems;
  int _currentItemIndex, _lastItemFetch;
  int _currentCategoryIndex, _lastCategoryFetch;
  bool _loading;

  final List<int> _scheme = [0, 1, 1, 1, 2,1,1,1];

  @override
  void initState() {
    super.initState();
    _currentItemIndex = 0;
    _lastItemFetch = 0;
    _currentCategoryIndex = 0;
    _lastCategoryFetch = 0;
    _productItems = new List();
    _easyFindItems = new List();
    _productCategories = new List();
    _loading = true;
    _loadMoreItems();
  }

  void _loadMoreItems() async {
    await ProductLoaderUtil.getMoreProducts(context).then((value) async {
      _productItems.addAll(value);
    }).then((value) {
      _lastItemFetch = _productItems.length;
      debugPrint(_productItems.length.toString() + " Items Fetched");
      _loadMoreCategories();
    });
  }

  void _loadMoreCategories() async {
    await ProductLoaderUtil.getMoreCategories(context).then((value) async {
      _productCategories.addAll(value);
    }).then((value) async {
      _lastCategoryFetch = _productCategories.length;
      debugPrint(_productCategories.length.toString() + " Items Fetched");
      if (this.mounted)
        setState(() {
          _loading = false;
        });
      _fillList();
    });
  }

  Future<void> _fillList() async {
    for (int i = 0; i < _scheme.length; i++) {
      switch (_scheme[i]) {
        case 0:
          {
            _easyFindItems.add(EasyFindHighlightedCategoriesTile(
                categories: _productCategories.sublist(
                    _currentItemIndex, _currentItemIndex + 4),
                flag: false));
            _currentItemIndex+=4;
            break;
          }
        case 1:
          {
            _easyFindItems.add(EasyFindCategoriesTile(
                categories: _productCategories.sublist(
                    _currentCategoryIndex, _currentCategoryIndex + 1),
                products: _productItems.sublist(
                    _currentItemIndex, _currentItemIndex + 4),
                flag: false));
            _currentItemIndex += 4;
            break;
          }
        case 2:
          {
            _easyFindItems.add(EasyFindGridCategoriesTile(
                categories: _productCategories.sublist(
                    _currentCategoryIndex, _currentCategoryIndex + 1),
                products: _productItems.sublist(
                    _currentItemIndex, _currentItemIndex + 4),
                flag: false));
            _currentItemIndex += 4;
            break;
          }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Maroon,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: TextStyle(color: White, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return (_easyFindItems != null)
              ? (_loading)
                  ? Container(
                      color: FakeWhite,
                    )
                  : _buildItem(index)
              : Container(
                  color: Maroon,
                );
        },
        itemCount: _easyFindItems.length,
      ),
    );
  }

  Widget _buildItem(int index) {
    Widget w;
    switch (_scheme[index]) {
      case 0:
        {
          w = _easyFindItems[index].easyFindHighlightedCategories(context);
          break;
        }
      case 1:
        {
          w = _easyFindItems[index].easyFindCategories(context);
          break;
        }
      case 2:
        {
          w = _easyFindItems[index].easyFindGridCategories(context);
          break;
        }
    }
    return w;
  }
}

//
//Column(
//mainAxisAlignment: MainAxisAlignment.center,
//children: [
//EasyFindHighlightedCategories(),
//EasyFindCategories(),
//EasyFindCategories(),
//EasyFindCategories(),
//EasyFindGridCategories(),
//EasyFindCategories(),
//EasyFindCategories(),
//],
//),
