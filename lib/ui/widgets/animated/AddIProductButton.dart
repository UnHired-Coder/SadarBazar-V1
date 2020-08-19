
import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/Product/ProductItem.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:bazar/ui/screens/mainscreens/CartUtil/CartViewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AddProductButton extends StatefulWidget {
  final double width;
  final double height;
  final ProductItem productItem;
  final Function valueZeroCallback;

  AddProductButton({this.width, this.height, @required this.productItem,this.valueZeroCallback});

  @override
  _AddProductButtonState createState() => _AddProductButtonState();
}

class _AddProductButtonState extends State<AddProductButton> {
  int _count;

  @override
  void initState() {
    _count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (context , cart , child){
      return Container(
        // Key::PageStorageKey("AddCartButton"),
        height: widget.height * 0.2,
        width: widget.width,
        color: White,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: (cart.getItemCount(widget.productItem) == 0) ? Orange : White,
                  borderRadius: BorderRadius.circular(5)),
              alignment: Alignment.center,
              margin: EdgeInsets.all(4),
              height: 30,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 30,
                    child: (cart.getItemCount(widget.productItem) == 0)
                        ? InkWell(
                      onTap: () {
                        debugPrint("Add Item");
                        Provider.of<CartViewModel>(context, listen: false)
                            .addToCart(widget.productItem);
                        setState(() {
                        });
                      },
                      child: Container(
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Orange,
                            borderRadius: BorderRadius.circular(12)),
                        margin: EdgeInsets.only(left: 4),
                        child: Text(
                          "Add  ",
                          style: TextStyle(
                              color: White, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                        : InkWell(
                      onTap: () {
                        debugPrint("Remove More");
                        Provider.of<CartViewModel>(context, listen: false)
                            .removeFromCart(widget.productItem);
//                        setState(() {
////                          _count--;
//                        });
                      },
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Orange,
                              borderRadius: BorderRadius.circular(12)),
                          alignment: Alignment.center,
                          child: Icon(
                            FontAwesomeIcons.minus,
                            size: 10,
                            color: White,
                          )),
                    ),
                  ),
//                SizedBox(
//                  width: 10,
//                ),
                  Container(
                    child: (cart.getItemCount(widget.productItem) == 0)
                        ? Container()
                        : Container(
                      height: 30,
                      alignment: Alignment.center,
                      width: 20,
                      color: White,
                      child: Text(
                        cart.getItemCount(widget.productItem).toString(),
                        style: TextStyle(color: LightBlack, fontSize: 10),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.5,
                    color: White,
                  ),
                  InkWell(
                    onTap: () {
                      debugPrint("Add More");
                      Provider.of<CartViewModel>(context, listen: false)
                          .addToCart(widget.productItem);
//                      setState(() {
//
//                      });
                    },
                    child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Orange,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          FontAwesomeIcons.plus,
                          size: 10,
                          color: White,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
