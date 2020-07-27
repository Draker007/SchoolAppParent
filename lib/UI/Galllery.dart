import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';


class Gallery extends StatefulWidget {
  static const String id = 'Gallery';
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 200.0,
          child: new Carousel(
            boxFit: BoxFit.fill,
            images: [
              AssetImage('assets/images/one.png'),
              AssetImage('assets/images/one.png'),
              AssetImage('assets/images/one.png'),
              AssetImage('assets/images/one.png'),
              AssetImage('assets/images/one.png'),
            ],
            autoplay: true,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 4.0,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.transparent,
            dotColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
