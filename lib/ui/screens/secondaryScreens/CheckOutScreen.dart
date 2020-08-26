import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:bazar/ui/screens/LaunchScreenWith/ProductView.dart';
import 'package:bazar/ui/screens/mainscreens/CartUtil/CartViewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'LocationScreen.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<String> unitType = ["Pcs", "Grm", "NA", "Unit", "Kg"];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        backgroundColor: Maroon,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: _width,
              height: _height * 0.8,
              child: Consumer<CartViewModel>(builder: (context, cart, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    if (index == 0)
                      return Container(
                        height: _height * 0.25,
                        width: _width,
                        alignment: Alignment.center,
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(4),
                                    child: Icon(
                                      FontAwesomeIcons.userAlt,
                                      color: LightBlack.withOpacity(0.4),
                                      size: 14,
                                    ),
                                    padding: EdgeInsets.all(2),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(4),
                                    child: Text(
                                      "Pratyush Tiwari",
                                      style: TextStyle(
                                          color: LightBlack.withOpacity(0.4),
                                          fontSize: 16),
                                    ),
                                    padding: EdgeInsets.all(2),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(4),
                                    child: Icon(
                                      FontAwesomeIcons.phoneAlt,
                                      color: LightBlack.withOpacity(0.4),
                                      size: 15,
                                    ),
                                    padding: EdgeInsets.all(2),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(4),
                                    child: Text(
                                      "+91 7982271840",
                                      style: TextStyle(
                                          color: LightBlack.withOpacity(0.4),
                                          fontSize: 16),
                                    ),
                                    padding: EdgeInsets.all(2),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: (){
                                  debugPrint("Change delivery address");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LocationScreen(),
                                      ));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(4),
                                      child: Icon(
                                        FontAwesomeIcons.mapPin,
                                        color: Maroon,
                                        size: 15,
                                      ),
                                      padding: EdgeInsets.all(2),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(4),
                                      width: _width*0.8,
                                      child: Text(
                                        " New Delhi : Kabul Lines, Delhi Cantonment, Kabul Lines, Delhi Cantonment, New Delhi, Delhi 110010, India",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: LightBlack, fontSize: 16),
                                      ),
                                      padding: EdgeInsets.all(2),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(2),
                                      child: Icon(FontAwesomeIcons.pen, color: Maroon,size: 14,),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        color: FakeWhite,
                      );
                    return ordersTile(
                        _width,
                        _height,
                        cart.getUserCart(index - 1),
                        cart.getItemCount(cart.getUserCart(index - 1)));
                  },
                  itemCount: cart.getLength() + 1,
                );
              }),
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          children: [
            Container(
              height: 50,
              width: _width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        debugPrint("Show payment Offers");
                      },
                      splashColor: Colors.transparent,
                      child: Container(
                          height: 50,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Consumer<CartViewModel>(
                                  builder: (context, cart, child) {
                                return Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Rs " +
                                        cart.getTotalAmount().toString() +
                                        " /-",
                                    style: TextStyle(
                                        color: LightBlack,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                );
                              }),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Offers",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 12),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      child: Card(
                        child: Container(
                            height: 40,
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              "Place Order",
                              style: TextStyle(color: White),
                            )),
                        color: Maroon,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget ordersTile(
      double _width, double _height, ProductItem productItem, int count) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            height: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "23/02/20",
                    style: TextStyle(
                        color: LightBlack.withOpacity(0.5), fontSize: 14),
                  ),
                ),
                SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
          Container(
            height: _height * 0.25,
            width: _width,
            color: White,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contexr) {
                      return ProductView(productItem: productItem);
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    width: _width * 0.25,
                    height: _height * 0.15,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage(productItem.productPictureUrl))),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: _width * 0.6,
                          child: Text(
                            productItem.productName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: LightBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Delivery Charges: ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: LightBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  width: _width * 0.4,
                                  child: Text(
                                    " Free",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Green,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Price: ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: LightBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  width: _width * 0.4,
                                  child: Text(
                                    "Rs " +
                                        productItem.productUnitPrice
                                            .toString() +
                                        "/-",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: LightBlack,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Quantity Ordered: ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: LightBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  width: _width * 0.4,
                                  child: Text(
                                    count.toString() +
                                        " " +
                                        unitType[
                                            productItem.productUnitType.index],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: LightBlack,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 2,
            width: _width,
            color: FakeWhite,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
              ),
              Container(
                child: Text(
                  "Sub Total Amount: ",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: LightBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                width: _width * 0.4,
                child: Text(
                  "Rs " +
                      (productItem.productUnitPrice * count).toString() +
                      "/- ",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: LightBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
