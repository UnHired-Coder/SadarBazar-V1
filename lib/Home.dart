import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/screens/mainscreens/CartUtil/CartScreen.dart';
import 'package:bazar/ui/screens/mainscreens/CartUtil/CartViewModel.dart';
import 'package:bazar/ui/screens/mainscreens/HomeScreen.dart';
import 'package:bazar/ui/screens/mainscreens/OrdersUtil/OrdersScreen.dart';
import 'package:bazar/ui/screens/mainscreens/ProfileScrreen.dart';
import 'package:bazar/ui/screens/mainscreens/EasyFindScreen.dart';
import 'package:bazar/ui/screens/secondaryScreens/CardDetailsScreen.dart';
import 'package:bazar/ui/screens/static/AboutScreen.dart';
import 'package:bazar/util/loader/ProductLoader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>with SingleTickerProviderStateMixin {
  double height;
  double width;
  TabController _tabsController;
 @override
  void initState() {
   _tabsController = new TabController(length: 4, vsync: this);
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    setState(() {
      width = _width;
      height = _height;
    });
    _currentUser();
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SingleChildScrollView(
          child: Container(
              width: _width,
              height: _height,
              child: DefaultTabController(
                length: 4,
                child: SafeArea(
                  child: new Scaffold(
                    body: _tabBarView(),
                    backgroundColor: White,
                    bottomNavigationBar: _tabBar(),
                    drawer: _drawer(),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  void _currentUser() async {
    await FirebaseAuth.instance.currentUser().then((_user) {
      if (_user == null) return null;

      debugPrint(_user.phoneNumber);
      debugPrint(_user.displayName);
      debugPrint(_user.uid);
      debugPrint(_user.isEmailVerified.toString());
    });
  }

  Drawer _drawer() {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: FakeWhite,
              ),
            ),
            _drawerItem("Home", FontAwesomeIcons.home, context, () {}),
            _drawerItem("My Orders", FontAwesomeIcons.stickyNote, context, () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return OrdersScreen();
              }));
            }),
            _drawerItem(
                "My cart", FontAwesomeIcons.shoppingCart, context, () {
              _tabsController.animateTo(2);
            }),
            _breaker(),
            _drawerItem("My Wallet", FontAwesomeIcons.wallet, context, () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return CardDetailsScreen();
              }));
            }),
            _breaker(),
            Container(
              height: 60,
              color: White,
            ),
            _drawerItem("Refer your friends", FontAwesomeIcons.userFriends,
                context, () {}),
            _drawerItem("Rate Us!", FontAwesomeIcons.star, context, () {}),
            _drawerItem("Share", FontAwesomeIcons.share, context, () {}),
            _drawerItem("About Us", FontAwesomeIcons.teamspeak, context, () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return AboutScreen();
              }));
            }),
            _drawerItem("Logout", FontAwesomeIcons.signOutAlt, context, () {},
                color: Maroon),
          ],
        ),
      ),
    );
  }

  Container _breaker() {
    return Container(
      alignment: Alignment.center,
      height: 50,
      color: White,
      child: Container(
        height: 2,
        color: LightBlack.withOpacity(0.1),
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  InkWell _drawerItem(
      String title, IconData iconData, context, Function function,
      {Color color}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        function.call();
      },
      child: Container(
          height: 50,
          color: White,
          margin: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Icon(
                iconData,
                size: 10,
                color: (color != null) ? color : LightBlack,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 20, color: LightBlack),
              )
            ],
          )),
    );
  }

  TabBarView _tabBarView() {
    return new TabBarView(
      controller: _tabsController,
//      key: new PageStorageKey("asasasas"),
      children: [HomeScreen(tabCallBack: (){_tabsController.animateTo(2);},), EasyFindScreen(), CartScreen(), ProfileScreen()],
    );
  }

//  TabBarView _tabBarView() {
//    return new TabBarView(
//      children: [
//        Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            ShopItemVertical(
//              width: width * 0.35,
//              height: 230,
//              code: [1, 1, 1, 1],
//            ),
//            ShopItemVertical(
//              width: width * 0.35,
//              height: 230,
//              code: [1, 1, 1, 1],
//            ),
//          ],
//        ),
//        Column(
//          children: [
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [
//                ShopItemHorizontal(
//                    width: width * 0.8, height: 120, code: [1, 1, 1, 1])
//              ],
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [
//                ShopItemHorizontal(
//                    width: width * 0.8, height: 120, code: [1, 1, 1, 1])
//              ],
//            )
//          ],
//        ),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            CategoriesGrid(
//              width: width,
//              height: height * 0.5,
//            )
//          ],
//        ),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            PromoteItem(
//              width: width * 0.8,
//              height: 120,
//            )
//          ],
//        )
//      ],
//    );
//  }

  TabBar _tabBar() {
    return new TabBar(
      tabs: [
        Tab(
          icon: new Icon(
            FontAwesomeIcons.home,
            size: 18,
          ),
        ),
        Tab(
          icon: new Icon(
            FontAwesomeIcons.magento,
            size: 18,
          ),
        ),
        Tab(
          icon: new Icon(
            FontAwesomeIcons.shoppingCart,
            size: 18,
          ),
        ),
        Tab(
          icon: new Icon(
            FontAwesomeIcons.user,
            size: 18,
          ),
        )
      ],
      labelColor: Orange,
      unselectedLabelColor: LightBlack,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: Black,
      controller: _tabsController,
    );
  }

  DateTime currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 1)) {
      currentBackPressTime = now;
      FlutterToast(context).showToast(child: Text("Press back again to exit"));
      return Future.value(false);
    }
    return Future.value(true);
  }
}
