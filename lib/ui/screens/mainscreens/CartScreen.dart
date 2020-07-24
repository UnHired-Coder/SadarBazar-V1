import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ShopItemHorizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

enum ScrollState { EXPANDED, COLLAPSED, BUSY }

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  ScrollController _scrollController;
  ScrollState _scrollState;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
      lowerBound: 0.0,
      upperBound: 200.0,
    )..addListener(() {
        setState(() {});
      });

    _scrollState = ScrollState.EXPANDED;
    _scrollController = new ScrollController()
      ..addListener(() => !_isAppBarExpanded
          ? {
//              debugPrint(_scrollState.toString()),
              if (_scrollState != ScrollState.EXPANDED &&
                  _scrollState != ScrollState.BUSY)
                {
                  debugPrint("Show --"),
                  _scrollState = ScrollState.BUSY,
                  _animationController.reverse(),
                  Future.delayed(Duration(milliseconds: 200), () {
                    debugPrint("Done");
                    _scrollState = ScrollState.EXPANDED;
                  }),
                }
            }
          : {
//              debugPrint(_scrollState.toString()),
              if (_scrollState != ScrollState.COLLAPSED &&
                  _scrollState != ScrollState.BUSY)
                {
                  debugPrint("Hide --"),
                  _animationController.forward(),
                  _scrollState = ScrollState.BUSY,
                  Future.delayed(Duration(microseconds: 200), () {
                    debugPrint("Done");
                    _scrollState = ScrollState.COLLAPSED;
                  }),
                }
            });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  bool get _isAppBarExpanded {
    return (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: PageStorageKey("CartScreen"),
      backgroundColor: FakeWhite,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            backgroundColor: Maroon,
            expandedHeight: _height * 0.25,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "My Cart",
                    style: TextStyle(color: White, fontSize: 12),
                  ),
                ),
                Icon(
                  FontAwesomeIcons.shoppingCart,
                  size: 15,
                )
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  CustomSilverBarCart()
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ShopItemHorizontal(
                    width: _width , height: 120, code: [1, 1, 1, 1]);
              },
              childCount: 12,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Transform.translate(
        offset: Offset(0, _animationController.value),
        child: InkWell(
          onTap: () {
            debugPrint("Proceed to Checkout");
          },
          child: Container(
            alignment: Alignment.center,
            height: _height * 0.05,
            width: _width * 0.5,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Maroon,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Proceed to Checkout",
                  style: TextStyle(
                      color: White, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  FontAwesomeIcons.arrowRight,
                  color: White,
                  size: 14,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSilverBarCart extends StatefulWidget {
  @override
  _CustomSilverBarCartState createState() => _CustomSilverBarCartState();
}

class _CustomSilverBarCartState extends State<CustomSilverBarCart> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("Sub Total",
                        style: TextStyle(
                            color: Black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 80,
                    alignment: Alignment.center,
                    child: Text("Rs 234/-",
                        style: TextStyle(color: Black, fontSize: 16)),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("Delivery Charges",
                        style: TextStyle(
                            color: Black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 80,
                    alignment: Alignment.center,
                    child: Text(
                      "Free",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Green, fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 2,
              width: _width,
              color: Black,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("Total",
                        style: TextStyle(
                            color: Maroon,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 80,
                    alignment: Alignment.center,
                    child: Text(
                      "Rs 342/-",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Maroon,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
