import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Cart/Order/Order.dart';
import 'package:bazar/ui/screens/mainscreens/OrdersUtil/OrderViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();

    if (this.mounted) {}
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "My Orders",
                style: TextStyle(
                    color: White, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Maroon,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
              width: _width,
              height: _height * 0.9,
              color: FakeWhite,
              margin: EdgeInsets.only(bottom: 4),
              child: Consumer<OrderViewModel>(builder: (context, cart, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    if (index == 0)
                      return Container(
                        height: _height * 0.2,
                        width: _width,
                        alignment: Alignment.center,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cart.totalOrders.toString() + " Orders",style: TextStyle(fontSize: 16),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );

                    if (index == cart.orders.length + 1)
                      return SizedBox(
                        height: 100,
                      );
                    return ordersTile(
                        cart.orders.elementAt(index - 1), _width, _height);
                  },
                  itemCount: cart.orders.length + 2,
                );
              })),
        ),
      ),
    );
  }

  Widget ordersTile(Order order, double _width, double _height) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    order.dateStamp,
                    style: TextStyle(
                        color: LightBlack.withOpacity(0.5), fontSize: 14),
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          Container(
            height: _height * 0.2,
            width: _width,
            color: White,
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: _width * 0.25,
                      height: _height * 0.15,
                      child: Container(
                        width: _width * 0.25,
                        height: _height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  order.orderThumbUrl,
                                  scale: 0.2,
                                ),
                                fit: BoxFit.contain)),
                      ),
                    )
                  ],
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
                          width: _width * 0.4,
                          child: Text(
                            "Super Store - B45",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: LightBlack,
                                fontSize: 20,
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
                                    "Order ID: ",
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
                                    order.orderId,
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
            width: _width * 0.8,
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
                  "Total Amount: ",
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
                  "Rs " + order.orderTotal + "/- ",
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
            height: 5,
          ),
          Container(
            height: 2,
            width: _width,
            color: FakeWhite,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(
                  FontAwesomeIcons.check,
                  color: Green,
                  size: 10,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  order.orderStatus,
                  style: TextStyle(
                      color: LightBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      debugPrint("View Order Details");
                    },
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: White,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "View Details",
                        style: TextStyle(
                            color: Maroon,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
