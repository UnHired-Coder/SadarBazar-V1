import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "About",
              style: TextStyle(color: White),
            )
          ],
        ),
        backgroundColor: Maroon,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Sadar Bazar",
              style: TextStyle(color: Black, fontSize: 20),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2017/08/25/11/06/horse-profile-2679776__340.jpg"))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Hello there! \n  I am a developer and I love to develop beautiful things. \n You can find me at ",
                style: TextStyle(),
                textAlign: TextAlign.center,
                maxLines: 150,
                overflow: TextOverflow.ellipsis,
              ),
            ),
           Container(
             height: 30,
             width: MediaQuery.of(context).size.width,
             alignment: Alignment.center,
             child: RichText(text: TextSpan(
               children: [
                 TextSpan(
                   text: "https://github.com/pratyush",
                   style: TextStyle(color: Colors.blue),
                   recognizer: TapGestureRecognizer()
                     ..onTap = () async {
                       final url = 'https://github.com/1-2-ka-4-4-2-ka-1';
                       if (await canLaunch(url)) {
                         await launch(
                           url,
                           forceSafariVC: false,
                         );
                       }
                     },
                 )
               ]
             )),
           ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: RichText(text: TextSpan(
                  children: [
                    TextSpan(
                      text: "https://www.linkedin.com/pratyush",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final url = 'https://www.linkedin.com/in/pratyush-tiwari-9aa143174/';
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceSafariVC: false,
                            );
                          }
                        },
                    )
                  ]
              )),
            ),

            Container(
              alignment: Alignment.center,
              height: 30,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Text(
                "Fake Data",
                style: TextStyle(),
                textAlign: TextAlign.center,

                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Text(
                "Our Passion for Success As our company has grown and our software has evolved, our focus has remained unchanged since the inception of 1ShoppingCart® in 1999. We provide effective online tools to help businesses small and large achieve success online. This, combined with our desire for excellence in customer service, has allowed us to help our customers grow their businesses from small start-ups to multi-million dollar enterprises time and time again. It's no wonder why over 25,000 businesses world-wide sell online with 1ShoppingCart®. Our Formula for Success What's our formula for success? Simple. A centralized and automated solution to manage all aspects of an eCommerce business - reducing operational costs and increasing efficiency. eCommerce is most successful when it is integrated directly with online marketing tools. And, when businesses grow tired of paying too much for multiple software products or want to alleviate the hassle of numerous, disconnected systems, they turn to 1ShoppingCart®. We see it everyday. Our Team 1ShoppingCart® is operated primarily from our Barrie, Ontario, Canada office, one hour north of Toronto. Our company has partnered with a variety of solution providers throughout the United States to offer the highest quality of service and security. Our software is designed, developed, maintained, and supported from our office in Canada.",
                style: TextStyle(),
                textAlign: TextAlign.center,
                maxLines: 150,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
