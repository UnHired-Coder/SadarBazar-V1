import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/material.dart';

class ShopItemGrid extends StatefulWidget {
  @override
  _ShopItemGridState createState() => _ShopItemGridState();
}

class _ShopItemGridState extends State<ShopItemGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Container(),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Orange, border: Border.all(color: Black,width: 0.1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 4,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          padding: EdgeInsets.all(1),
                          child: Text(
                            "Checkout these Amazing products!!",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: White,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            debugPrint("See all");
                          },
                          elevation: 0,
                          color: FakeWhite,
                          child: Text(
                            "See all",
                            style: TextStyle(color: Black),
                          ),
                        ),SizedBox(width: 4,)
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [ProductGridItem()],
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProductGridItem extends StatefulWidget {
  @override
  _ProductGridItemState createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: White,
        border: Border.all(width: 0.1),
      ),
child: GridView.count(  physics: NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  crossAxisCount: 2,
  children: List.generate(4, (index) {
    return Container(alignment: Alignment.center,child: _item(),decoration: BoxDecoration(border: Border.all(width: 0.02,color: Black)),);
  }),),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: [_item(), _item()],
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: [_item(), _item()],
//          )
//        ],
//      ),
    );
  }

  Widget _item() {
    return InkWell(
      onTap: (){debugPrint("Explore this category");},
      child: Container(
        height: 150,
        width: 100,
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://www.bigbasket.com/media/uploads/p/s/40139744_3-kapiva-ayurveda-wild-honey-pure-natural-healthy.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [_text("Food", true), _text("34% off", false)],
        ),
      ),
    );
  }

  Widget _text(String text, bool flag) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: FakeWhite),
      padding: EdgeInsets.all(2),
      child: Text(
        text,
        style: TextStyle(
            color: flag ? Black : LightBlack, fontSize: flag ? 15 : 10),
      ),
    );
  }
}
