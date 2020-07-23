import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageProductHighlight extends StatefulWidget {

  final bool flag;
  ImageProductHighlight({this.flag});

  @override
  _ImageProductHighlightState createState() => _ImageProductHighlightState();
}

class _ImageProductHighlightState extends State<ImageProductHighlight> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        debugPrint("Image Explore Category");
      },
      child: Container(
        width: _width,
        height: (widget.flag!=null && widget.flag)?_height*0.2:_height*0.3,
        decoration: BoxDecoration(
            color: White,
            border: Border.all(width: 0.1),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    (widget.flag!=null && widget.flag)?"https://www.bigbasket.com/media/uploads/banner_images/2007245_bbstar-exclusive_460_18th.jpg":"https://www.bigbasket.com/media/customPage/b01eee88-e6bc-410e-993c-dedd012cf04b/4ec5c320-719c-4c16-bbb4-5dc4be672239/1254ad92-9857-498f-8ff3-7d7f3c4b68a6/2007033_namkeens_378.jpg"))),
      ),
    );
  }
}
