import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ShopItemHorizontal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: FakeWhite,
        body: CustomScrollView(
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
                delegate: SliverChildBuilderDelegate((context, index) {
              return ShopItemHorizontal(
                  width: _width * 0.8, height: 120, code: [1, 1, 1, 0]);
            }, childCount: 10))
          ],
        ));
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
              height: 4,
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
