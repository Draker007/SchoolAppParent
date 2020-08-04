import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';


final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];



Color pagetheme = Color(0xFF550527);
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
           
            child: Column(children: <Widget>[
              AppBaar(name: "Gallery", ImagePath: "Images/gallery.png",
                Themecolor: pagetheme,),
              Expanded(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      GalleryWidget(),
                      GalleryWidget(),
                      GalleryWidget(),
                      GalleryWidget(),
                      GalleryWidget(),
                      GalleryWidget(),
                    ],
                  ),
                ),
              ),
            ],)
        ),
      ),
    );
  }
}

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Sports Day",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)),
        ),
        CarouselSlider(

          options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 2.0,
            enlargeCenterPage: false,
          ),
          items: imageSliders,
        ),
      ],
    );
  }
}
//images: [
//AssetImage('Images/downloadimg.png'),
//AssetImage('Images/downloadimg.png'),
//AssetImage('Images/downloadimg.png'),
//AssetImage('Images/downloadimg.png'),
//AssetImage('Images/downloadimg.png'),
//],


final List<Widget> imageSliders = imgList.map((item) => Container(
  height: 400,
  width: 400,
  child: Container(
    width: 400,
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 400.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

              ),
            ),
          ],
        )
    ),
  ),
)).toList();