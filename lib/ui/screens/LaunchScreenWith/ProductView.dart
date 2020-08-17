import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:bazar/models/TestModels/_ProductMetaData.dart';
import 'package:bazar/ui/widgets/animated/AddIProductButton.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/HeaderImagesProductView.dart';
import 'package:bazar/util/loader/ProductLoadUtil.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductView extends StatefulWidget {
  final ProductItem productItem;
  final bool flag;

  ProductView({@required this.productItem, this.flag});

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ProductMetaData _productMetaData;
  bool _loading;

  List<String> unitType = ["Pcs", "Grm", "NA", "Unit", "Kg"];

  @override
  void initState() {
    _loading = true;
    _tabController = new TabController(length: 2, vsync: this);
    _getMetadata();
    super.initState();
  }

  _getMetadata() async {
    await ProductLoaderUtil.getProductMetadata(
            context, widget.productItem.productId)
        .then((value) {
      setState(() {
        _productMetaData = value;
      });
//      debugPrint(value.highlightsPoints.toString());
    }).then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      // Key::PageStorageKey("SearchScreen"),
      backgroundColor: White,
      body: SingleChildScrollView(
        child: (_loading)
            ? Container()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderImagesProductView(
                    products: _productMetaData.pictureUrls,
                    flag: false,
                  ),
                  Container(
                    height: 2,
                    width: _width,
                    color: FakeWhite,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          color: White,
                          width: _width,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    widget.productItem.productName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Rs " +
                                            widget.productItem.productUnitPrice
                                                .toString() +
                                            "/-",
                                        style: TextStyle(
                                            color: LightBlack, fontSize: 15),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 50,
                                            height: 20,
                                            color: Green,
                                            padding: EdgeInsets.all(1),
                                            child: Text(
                                              widget.productItem.productDiscount
                                                      .toString() +
                                                  "% Off",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: FakeWhite),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Rs " +
                                        ((widget.productItem.productUnitPrice *
                                                    100) /
                                                (100 -
                                                    widget.productItem
                                                        .productDiscount))
                                            .floor()
                                            .toString() +
                                        "/-",
                                    style: TextStyle(
                                        color: LightBlack.withOpacity(0.6),
                                        decoration: TextDecoration.lineThrough),
                                  )),
                            ],
                          ),
                        ),
                        flex: 4,
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.all(3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AddProductButton(
                                productItem: widget.productItem,
                                height: _height * 0.3,
                                width: _width * 0.5,
                              )
                            ],
                          ),
                        ),
                        flex: 4,
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    width: _width,
                    color: FakeWhite,
                  ),
                  Container(
                    width: _width,
                    height: _height * 0.1,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Unit"),
                        ),
                        Container(
                          width: _width,
                          height: _height * 0.05,
                          child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                List<String> _list = ["1", "3", "5"];
                                return InkWell(
                                  onTap: () {
                                    debugPrint("Unit Index " +
                                        _list[index] +
                                        unitType[widget.productItem
                                            .productUnitType.index]);
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 40,
                                    margin: EdgeInsets.only(left: 4, right: 4),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Orange, width: 0.4)),
                                    child: Text(
                                      _list[index] +" "+
                                          unitType[widget.productItem
                                              .productUnitType.index],
                                      style: TextStyle(
                                          fontSize: 14, color: Orange),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 4,
                    width: _width,
                    color: FakeWhite,
                  ),
                  Container(
                    height: 100,
                    width: _width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            _highlightsWidget(_productMetaData.highlights),
                      ),
                    ),
                  ),
                  Container(
                    height: 4,
                    width: _width,
                    color: FakeWhite,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: _width,
                      height: _height * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TabBar(
                              indicatorColor: Orange,
                              labelColor: Orange,
                              controller: _tabController,
                              indicator: UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Orange,
                                  ),
                                  insets: EdgeInsets.only(
                                      left: 0, right: 8, bottom: 4)),
                              isScrollable: true,
                              labelPadding: EdgeInsets.only(left: 0, right: 0),
                              tabs: [
                                Container(
                                  height: _height * 0.06,
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      "Highlights",
                                      style: TextStyle(
                                          fontSize: 14, color: Orange),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: _height * 0.06,
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      "Info",
                                      style: TextStyle(
                                          fontSize: 14, color: Orange),
                                    ),
                                  ),
                                ),
                              ]),
                          Container(
                            width: _width,
                            height: _height * 0.4,
                            child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                controller: _tabController,
                                children: [
                                  Container(
                                    width: _width,
                                    color: FakeWhite,
                                    child: _highlightPointsWidget(
                                        _productMetaData.highlightsPoints,
                                        _width),
                                  ),
                                  Container(
                                    width: _width,
                                    color: FakeWhite,
                                    child: _infoPointsWidget(
                                        _productMetaData.infoPoints, _width),
                                  ),
                                ]),
                          ),
                        ],
                      )),
                  Container(
                    height: 4,
                    width: _width,
                    color: FakeWhite,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: _height * 0.06,
                          child: Text(
                            "Similar Products",
                            style: TextStyle(fontSize: 20, color: Orange),
                          )),
//                ListProductHorizontal(
//                  productItemsHorizontal:
//                      ProductLoader.getFourProducts(context),
//                  flag: false,
//                ),
                      Container(
                        height: 4,
                        width: _width,
                        color: FakeWhite,
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: _height * 0.06,
                          child: Text(
                            "Popular Products",
                            style: TextStyle(fontSize: 20, color: Orange),
                          )),
//                ListProductHorizontal(
//                  productItemsHorizontal:
//                      ProductLoader.getFourProducts(context),
//                  flag: false,
//                ),
                    ],
                  )
                ],
              ),
      ),
    );
  }

//  enum Highlight { SAFE, TESTED, APPROVED, BEST_QUALITY, VERIFIED, INSTANT_DELIVERY, NO_COST_EMI, BANK_OFFER }

  Widget _getHighlightIcon(int index) {
    String url = "";
    switch (index) {
      case 0:
        {
          url = "assets/highlights/approve.png";
        }
        break;
      case 1:
        {
          url = "assets/highlights/best.png";
        }
        break;
      case 2:
        {
          url = "assets/highlights/delivery.png";
        }
        break;
      case 3:
        {
          url = "assets/highlights/emi.png";
        }
        break;
      case 4:
        {
          url = "assets/highlights/money.png";
        }
        break;
      case 5:
        {
          url = "assets/highlights/offer.png";
        }
        break;
      case 6:
        {
          url = "assets/highlights/safe.png";
        }
        break;
      case 7:
        {
          url = "assets/highlights/tested.png";
        }
        break;
      case 8:
        {
          url = "assets/highlights/verified.png";
        }
        break;
      case 9:
        {
          url = "assets/highlights/verified.png";
        }
        break;
    }

    return Container(
      height: 80,
      width: 80,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(url),
          Container(
            alignment: Alignment.bottomCenter,
            width: 80,
            height: 10,
            padding: EdgeInsets.all(2),
            child: Text(
              Highlight.values.elementAt(index).toString().substring(10).replaceAll("_", " "),
              style: TextStyle(fontSize: 6),
            ),
            decoration: BoxDecoration(color: FakeWhite),
          )
        ],
      ),
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(20),
    );
  }

  List<Widget> _highlightsWidget(List<Highlight> highlights) {
    List<Widget> _items = new List();
    for (int i = 0; i < highlights.length; i++) {
      _items.add(_getHighlightIcon(highlights[i].index));
    }
    return _items;
  }

  Widget _highlightPointsWidget(List<String> points, width) {
    List<Widget> _items = new List();
    for (int index = 0; index < points.length; index++) {
      _items.add(Container(
        height: 20,
        width: width,
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.only(top: 2, bottom: 4, left: 10),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.radio_button_checked,
              size: 10,
              color: Orange,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              points[index],
              style: TextStyle(color: LightBlack, fontSize: 16),
            )
          ],
        ),
      ));
    }

    return Container(
        color: White,
        child: Column(
          children: _items,
        ));
  }

  Widget _infoPointsWidget(List<String> points, width) {
    List<Widget> _items = new List();
    for (int index = 0; index < points.length; index++) {
      _items.add(Container(
        height: 20,
        width: width,
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.only(top: 2, bottom: 4, left: 10),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.radio_button_checked,
              size: 10,
              color: Orange,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              points[index],
              style: TextStyle(color: LightBlack, fontSize: 16),
            )
          ],
        ),
      ));
    }

    return Container(
        color: White,
        child: Column(
          children: _items,
        ));
  }
}
