import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/ui/widgets/animated/AddIProductButton.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/HeaderImagesProductView.dart';
import 'file:///F:/Sadar/bazar/lib/ui/widgets/large/ProductWidgets/MultiListWidgets/ListProductsHorizontal.dart';
import 'package:bazar/util/loader/ProductLoader.dart';
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

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      // Key::PageStorageKey("SearchScreen"),
      backgroundColor: White,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderImagesProductView(
              products: [widget.productItem],
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
                                  fontWeight: FontWeight.bold, fontSize: 20),
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
                                            fontSize: 12, color: FakeWhite),
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
                                  ((widget.productItem.productUnitPrice * 100) /
                                          (100 -
                                              widget
                                                  .productItem.productDiscount))
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
                          List<String> _list = ["1Kg", "3Kg", "5Kg"];
                          return InkWell(
                            onTap: () {
                              debugPrint("Unit Index " + _list[index]);
                            },
                            child: Container(
                              width: 50,
                              height: 40,
                              margin: EdgeInsets.only(left: 4, right: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Orange, width: 0.4)),
                              child: Text(
                                _list[index],
                                style: TextStyle(fontSize: 14, color: Orange),
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
                            insets:
                                EdgeInsets.only(left: 0, right: 8, bottom: 4)),
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
                                style: TextStyle(fontSize: 14, color: Orange),
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
                                style: TextStyle(fontSize: 14, color: Orange),
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
                            ),
                            Container(
                              width: _width,
                              color: FakeWhite,
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
                ListProductHorizontal(
                  productItemsHorizontal:
                      ProductLoader.getFourProducts(context),
                  flag: false,
                ),
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
                ListProductHorizontal(
                  productItemsHorizontal:
                      ProductLoader.getFourProducts(context),
                  flag: false,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
