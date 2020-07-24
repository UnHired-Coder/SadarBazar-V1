import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimatedCartButton extends StatefulWidget {
  @override
  _AnimatedCartButtonState createState() => _AnimatedCartButtonState();
}

class _AnimatedCartButtonState extends State<AnimatedCartButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 30,
//      color: Colors.white,
      child: InkWell(
        onTap: (){
          debugPrint("Cart Icon Tapped");
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.shoppingCart,
                color: Colors.white,
                size: 15,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: White),
                child: Text(
                  "3",
                  style: TextStyle(color: Orange, fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
