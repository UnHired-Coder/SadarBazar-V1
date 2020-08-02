import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/ui/screens/mainscreens/CartUtil/CartViewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AnimatedCartButton extends StatefulWidget {
  final Function cartButtonCallback;

  AnimatedCartButton({@required this.cartButtonCallback});

  @override
  _AnimatedCartButtonState createState() => _AnimatedCartButtonState();
}

class _AnimatedCartButtonState extends State<AnimatedCartButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  int _count;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        duration: Duration(milliseconds: 200),
        lowerBound: 0.1,
        upperBound: 1,
        vsync: this)
      ..addListener(() {
        setState(() {});
      });
    _count = 0;
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (context, cart, child) {
      if (cart.getTotalItemCount() != _count) {
        debugPrint("Animate");
        _updateCount(cart.getTotalItemCount());
      }

      return Container(
        key: PageStorageKey("AnimatedCartButton"),
        width: 40,
        height: 30,
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            debugPrint("Cart Icon Tapped");
            widget.cartButtonCallback();
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
                child: Transform.scale(
                  scale: _animationController.value,
                  child: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: White),
                    child: Text(
                      _count.toString(),
                      style: TextStyle(
                          color: Orange,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  void _updateCount(int len) {
    _animationController
        .reverse()
        .then((value) => _animationController.forward());
    _count = len;
  }

//  void _updateCount() {
//    _animationController.reverse().then((value) =>(setState(() {
//      _count++;
//    }))).then((value) => _animationController.forward());
//  }
}
