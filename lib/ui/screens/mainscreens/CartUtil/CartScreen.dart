import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/screens/mainscreens/CartUtil/CartViewModel.dart';
import 'package:bazar/ui/screens/secondaryScreens/CheckOutScreen.dart';
import 'package:bazar/ui/widgets/animated/AnimatedCartButton.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ShopItemHorizontal.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ShopItemVertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
//                  debugPrint("Show --"),
                  _scrollState = ScrollState.BUSY,
                  _animationController.reverse(),
                  Future.delayed(Duration(milliseconds: 200), () {
//                    debugPrint("Done");
                    _scrollState = ScrollState.EXPANDED;
                  }),
                }
            }
          : {
//              debugPrint(_scrollState.toString()),
              if (_scrollState != ScrollState.COLLAPSED &&
                  _scrollState != ScrollState.BUSY)
                {
//                  debugPrint("Hide --"),
                  _animationController.forward(),
                  _scrollState = ScrollState.BUSY,
                  Future.delayed(Duration(microseconds: 200), () {
//                    debugPrint("Done");
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
        // Key::PageStorageKey("CartScreen"),
        backgroundColor: FakeWhite,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              backgroundColor: Maroon,
              expandedHeight: _height * 0.30,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "My Cart",
                      style: TextStyle(
                          color: White,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  AnimatedCartButton(
                    cartButtonCallback: null,
                  )
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [CustomSilverBarCart()],
                ),
              ),
            ),
            Consumer<CartViewModel>(builder: (context, cart, child) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return Opacity(
                    opacity: (cart.getItemCount(cart.getUserCart(index)) == 0)
                        ? 0.2
                        : 1,
                    child: ShopItemHorizontal(
                      height: _height * 0.2,
                      width: _width,
                      productItem: cart.getUserCart(index),
                      code: [1, 1, 1, 1, 0],
                    ));
              }, childCount: cart.getLength()));
            })
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton:
            Consumer<CartViewModel>(builder: (context, cart, child) {
          return Transform.translate(
            offset: (cart.getLength() < 4)
                ? Offset(0, 0)
                : Offset(0, _animationController.value),
            child: Transform.scale(
              scale: (cart.getLength() < 4)
                  ? 1
                  : 1 - _animationController.value / 100,
              child: InkWell(
                onTap: () {
                  debugPrint("Proceed to Checkout");
                  if (!cart.isEmpty())
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CheckOutScreen();
                    }));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: _height * 0.05,
                  width: _width * 0.5,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Maroon, borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cart.isEmpty()
                            ? "Nothing Here!"
                            : "Proceed to Checkout",
                        style: TextStyle(
                            color: White,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      (cart.isEmpty())
                          ? Container()
                          : Icon(
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
        }));
  }
}

//
//child: SliverList(
//delegate: SliverChildBuilderDelegate(
//(context, index) {
//return Container(
//alignment: Alignment.center,
//margin:
//EdgeInsets.only(left: 4, right: 4, top: 5, bottom: 5),
//color: Green,
//height: 100,
//width: _width,
////                    child: ShopItemHorizontal(
////                        width: _width * 0.9, height: 120, code: [1, 1, 1, 1]),
//);
//},
//childCount: 12,
//),
//),

class CustomSilverBarCart extends StatefulWidget {
  @override
  _CustomSilverBarCartState createState() => _CustomSilverBarCartState();
}

class _CustomSilverBarCartState extends State<CustomSilverBarCart> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Consumer<CartViewModel>(
      builder: (context, cart, child) {
        return Container(
            margin: EdgeInsets.only(top: 12),
            child: Stack(
              children: [
                Visibility(
                    visible: cart.isEmpty(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(4),
                          child: Text(
                            "Your cart is empty!",
                            style: TextStyle(
                                color: White,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
                Visibility(
                  visible: !cart.isEmpty(),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text("Sub Total",
                                          style: TextStyle(
                                              color: White,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                          "Rs " +
                                              cart.getSubTotal().toString() +
                                              "/-",
                                          style: TextStyle(
                                              color: White, fontSize: 16)),
                                    )
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                      "Rs " +
                                          (cart.getDiscountAmount() +
                                                  cart.getSubTotal())
                                              .toString() +
                                          "/-",
                                      style: TextStyle(
                                          color: FakeWhite,
                                          fontSize: 10,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Green,
                                          decorationThickness: 3)),
                                )
                              ],
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text("Delivery Charges",
                                    style: TextStyle(
                                        color: White,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  "Free",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Green, fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          width: _width,
                          color: White,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text("Total",
                                    style: TextStyle(
                                        color: White,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Rs " +
                                      cart.getTotalAmount().toString() +
                                      "/-",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: White,
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
                ),
              ],
            ));
      },
    );
  }
}
