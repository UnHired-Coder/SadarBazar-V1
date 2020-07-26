import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/screens/LaunchScreenWith/CategoryResultsView.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EasyFindScreen extends StatefulWidget {
  @override
  _EasyFindScreenState createState() => _EasyFindScreenState();
}

class _EasyFindScreenState extends State<EasyFindScreen> {
  List<String> _list = [
    "https://www.bigbasket.com/media/uploads/banner_images/All_PetStore_DT_3_1130x400_25thJune.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2555-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2547-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/NNP2544-1200X300-29thjuly.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/All_Bakery_DT_2_1130x400_25thJune.jpg",
    "https://www.bigbasket.com/media/uploads/banner_images/2007067_icecreams-frozen_400.jpg",
  ];

  @override
  void initState() {
    super.initState();
  }

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
            Text("Explore",style: TextStyle(color: White,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: (){
                        debugPrint("Open Items in this category");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryResultsView(
                              ),
                            ));
                      },
                      child: Container(
                        height: _height * 0.1,
                        width: _width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(_list[index]),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  );
                },
                itemCount: _list.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1,
                  height: _height * 0.2,
                  viewportFraction: 1,
                )),
            EasyFindCategories(),
            EasyFindCategories(),
            EasyFindCategories(),
            EasyFindGridCategories(),
            EasyFindCategories(),
            EasyFindCategories(),
          ],
        ),
      ),
    );
  }
}

class EasyFindGridCategories extends StatefulWidget {
  @override
  _EasyFindGridCategoriesState createState() => _EasyFindGridCategoriesState();
}

class _EasyFindGridCategoriesState extends State<EasyFindGridCategories> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
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
              "Biggest Sale is Live!",
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
                    debugPrint("Open Items in this category");
                  },
                  child: Container(
                    width: 150,
                    height: 130,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: White),
                  ),
                );
              },
              itemCount: 4,
            ),
          )
        ],
      ),
    );
  }
}

class EasyFindCategories extends StatefulWidget {
  @override
  _EasyFindCategoriesState createState() => _EasyFindCategoriesState();
}

class _EasyFindCategoriesState extends State<EasyFindCategories> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: _height * 0.25,
      width: _width,
//      color: Maroon,
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
                    "Men's Fashion",
                    style: TextStyle(
                        color: Black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              InkWell(
                  onTap: () {
                    debugPrint("See All form this categories");
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
                  },
                  child: Container(
                    width: 150,
                    height: 130,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: FakeWhite),
                  ),
                );
              },
              itemCount: 4,
            ),
          )
        ],
      ),
    );
  }
}
