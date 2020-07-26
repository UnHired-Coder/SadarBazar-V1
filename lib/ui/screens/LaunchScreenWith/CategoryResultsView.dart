import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryResultsView extends StatefulWidget {
  @override
  _CategoryResultsViewState createState() => _CategoryResultsViewState();
}

class _CategoryResultsViewState extends State<CategoryResultsView> {
  List<String> _list = [
    "https://www.bigbasket.com/media/uploads/banner_images/All_PetStore_DT_3_1130x400_25thJune.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2555-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2547-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2544-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/All_Bakery_DT_2_1130x400_25thJune.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/2007067_icecreams-frozen_400.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/All_PetStore_DT_3_1130x400_25thJune.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2555-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2547-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2544-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/All_Bakery_DT_2_1130x400_25thJune.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/2007067_icecreams-frozen_400.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/All_PetStore_DT_3_1130x400_25thJune.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2555-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2547-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2544-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/All_Bakery_DT_2_1130x400_25thJune.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/2007067_icecreams-frozen_400.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Maroon,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Men's Fashion",
              style: TextStyle(color: White, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
//            Container(height: 50,width: _width,decoration: BoxDecoration(color: Maroon),),
            Container(
                width: _width,
                height: _height*0.9,
                color: White,
                padding: EdgeInsets.only(left: 5, right: 5,top: 5),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(16, (index) {
                    return Container(
                      child: InkWell(
                        onTap: () {
                          debugPrint("Open this product from results");
                        },
                        child: Container(
                          color: White,
                          margin: EdgeInsets.all(1),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 6,
                                    child: Container(
                                      width: _width * 0.3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(_list[index]),
                                              fit: BoxFit.fill),
                                          color: White),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 4,
                                    child: Container(
                                      width: _width * 0.4,
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color: FakeWhite.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: EdgeInsets.all(4),
                                      child: Column(
                                        children: [
                                          Flexible(
                                            flex: 4,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Canvas leather Shoes 20x2 ",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      top: 5),
                                                  child: Text(
                                                    "Rs 231/-",
                                                    style: TextStyle(
                                                        color: Maroon),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5,
                                                      top: 5),
                                                  child: Text(
                                                    "Rs 454/-",
                                                    style: TextStyle(
                                                        color:
                                                            Black.withOpacity(
                                                                0.6)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                              flex: 1,
                                              child: SizedBox(
                                                height: 5,
                                              )),
                                          Flexible(
                                            flex: 2,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(2),
                                                  color: Green,
                                                  margin: EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                  ),
                                                  child: Text(
                                                    "56% Off",
                                                    style:
                                                        TextStyle(color: White),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                  right: 0,
                                  top: 5,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          debugPrint("Favourite this product ");
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: White,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(
                                            FontAwesomeIcons.solidHeart,
                                            color: LightBlack,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          debugPrint(
                                              "Add this product to cart ");
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(5),
                                          margin: EdgeInsets.only(top: 5),
                                          decoration: BoxDecoration(
                                              color: White,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(
                                            FontAwesomeIcons.cartPlus,
                                            color: LightBlack,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Maroon,
                          border: Border.all(width: 0.02, color: Black)),
                    );
                  }),
                ))
          ],
        ),
      ),
    );
  }
}
