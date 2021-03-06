import 'dart:convert';

import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesListWidget extends StatefulWidget {
  final bool flag;
  final List<ProductCategory> productCategory;
  CategoriesListWidget({@required this.productCategory,this.flag});
  @override
  _CategoriesListWidgetState createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  List<String> _list;
  List<ProductCategory> _productCategory;

  @override
  void initState() {
    super.initState();
//    fetchCategories(context);
//    _list = [
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007214_under-rs-149-store_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007215_rs-150-299-store_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007216_stationery_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007217_monsoon-essentials_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007218_battery-led-bulbs_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007219_steel-storage-box_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ff15da39-2806-41f5-bfbf-c7676835ac10/2007040_mens-grooming_184.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ff15da39-2806-41f5-bfbf-c7676835ac10/2007038_deos-fragrances_184.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007214_under-rs-149-store_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007215_rs-150-299-store_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007216_stationery_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007217_monsoon-essentials_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007218_battery-led-bulbs_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ae1f038a-b1ba-4145-b00d-b20bd5127774/2007219_steel-storage-box_360.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ff15da39-2806-41f5-bfbf-c7676835ac10/2007040_mens-grooming_184.jpg",
//      "https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/ff15da39-2806-41f5-bfbf-c7676835ac10/2007038_deos-fragrances_184.jpg"
//    ];
  }

  void fetchCategories(BuildContext context) async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/Json/PRODUCT_CATEGORIES.json")
        .then((value) {
//      debugPrint(value);
      _productCategory = (json.decode(value) as List)
          .map((i) => ProductCategory.fromJson(i))
          .toList();
    }).then((value) {
//      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return (widget.productCategory == null)
        ? Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(4),
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              strokeWidth: 1,
              backgroundColor: Orange,
            ),
          )
        : Container(
            height: _height * 0.08,
            width: _width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: _width,
                  child: ListView.builder(
                      itemCount: widget.productCategory.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return (index == 0)
                            ? InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  debugPrint("All Categories");
                                  if (widget.productCategory != null)
                                    for (int i = 0;
                                        i < widget.productCategory.length;
                                        i++)
                                      debugPrint(widget.productCategory[i]
                                          .categoryId
                                          .toString());
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  height: 50,
                                  width: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: White),
                                  child: Text(
                                    "All",
                                    style:
                                        TextStyle(color: Orange, fontSize: 15),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  debugPrint("Explore This Category from list");
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, top: 2),
                                  height: 60,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              widget.productCategory[index]
                                                  .categoryPictureUrl))),
                                ),
                              );
                      }),
                )
              ],
            ),
          );
  }
}
