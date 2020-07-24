import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimatedNotificationButton extends StatefulWidget {
  @override
  _AnimatedNotificationButtonState createState() =>
      _AnimatedNotificationButtonState();
}

class _AnimatedNotificationButtonState extends State<AnimatedNotificationButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  int _count;

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
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: PageStorageKey("AnimatedNotificationButton"),
      width: 35,
      height: 30,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          debugPrint("Notification Icon Tapped");
          _updateCount();
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.solidBell,
                color: Colors.white,
                size: 16,
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
  }

  void _updateCount() {
    _animationController
        .reverse()
        .then((value) => (setState(() {
              _count++;
            })))
        .then((value) => _animationController.forward());
  }
}
