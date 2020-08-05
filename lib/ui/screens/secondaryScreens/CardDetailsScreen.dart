import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/material.dart';

class CardDetailsScreen extends StatefulWidget {
  @override
  _CardDetailsScreenState createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
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
                "Card & Wallets",
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
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                width: _width,
                height: _height * 0.4,
                color: White,
                margin: EdgeInsets.only(top: 5),
              ),
              itemCount: 4,
            ),
          ),
        ),
      ),
    );
  }
}
