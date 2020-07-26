import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/ui/screens/LaunchScreenWith/CategoryResultsView.dart';
import 'package:bazar/ui/screens/LaunchScreenWith/ProductView.dart';
import 'package:flutter/material.dart';

class EasyFindCategories extends StatefulWidget {
  final List<ProductCategory> categories;
  final List<ProductItem> products;
  final bool flag;

  EasyFindCategories(
      {@required this.categories, @required this.products, this.flag});

  @override
  _EasyFindCategoriesState createState() => _EasyFindCategoriesState();
}

class _EasyFindCategoriesState extends State<EasyFindCategories> {
  bool _flag;

  @override
  void initState() {
    super.initState();
    _flag = !(widget.products.length < 4 || widget.categories.length < 1);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: _flag,
      child: Container(
        height: _height * 0.25,
        width: _width,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2),
                    child: Text(
                      widget.categories[0].categoryName,
                      style: TextStyle(
                          color: Black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                InkWell(
                    onTap: () {
                      debugPrint("See All form this categories " +
                          widget.categories[0].categoryName);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryResultsView(
                              categories: widget.categories,
                              flag: widget.flag,
                            ),
                          ));
                    },
                    child: Container(
                        child: Text(
                      "See All",
                      style: TextStyle(
                          color: Maroon,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))),
              ],
            ),
            Container(
              width: _width,
              height: _height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      debugPrint("Open Items in this category");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductView(
                              productItem: widget.products[index],
                              flag: false,
                            ),
                          ));
                    },
                    child: Container(
                      width: 150,
                      height: 130,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                                widget.products[index].productPictureUrl)),
                        borderRadius: BorderRadius.circular(10),
                        color: FakeWhite,
                      ),
                    ),
                  );
                },
                itemCount: widget.products.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
