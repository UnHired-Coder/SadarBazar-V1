import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:flutter/material.dart';

class EasyFindGridCategories extends StatefulWidget {
  final List<ProductCategory> categories;
  final List<ProductItem> products;
  final bool flag;

  EasyFindGridCategories(
      {@required this.categories, @required this.products, this.flag});

  @override
  _EasyFindGridCategoriesState createState() => _EasyFindGridCategoriesState();
}

class _EasyFindGridCategoriesState extends State<EasyFindGridCategories> {
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
        height: _height * 0.4,
        width: _width,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: FakeWhite),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
              child: Text(
                "Biggest Sale is Live! ",
                style: TextStyle(
                    color: Black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: _height * 0.3,
              width: _width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      debugPrint("Open Items in this category " +
                          widget.products[0].productCategoryName);
                    },
                    child: Container(
                      width: 150,
                      height: 130,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: White,
                          image: DecorationImage(fit: BoxFit.scaleDown,
                              image: NetworkImage(
                                  widget.products[index].productPictureUrl))),
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
