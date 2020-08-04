import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Color pagetheme = Color(0xFF3993DD);
class SchoolInfo extends StatefulWidget {
  static const String id = 'SchoolInfo';

  @override
  _SchoolInfoState createState() => _SchoolInfoState();
}

class _SchoolInfoState extends State<SchoolInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              AppBaar(name: 'School Info',ImagePath: "Images/ic_school_info.png",Themecolor: pagetheme,),
              Expanded(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text("Bangalore Public School",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 220,
                              child: Image(image: AssetImage("Images/schoolimg.png")),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text('This school is affordable and management provide the minimum required infrastructure to meet the basic needs. -accommodate the low economic group students. Right to education is the freedom for everyone, and pr'
                                  'ovide education to all the children without any'
                                  ' partiality.',style: TextStyle(color: Color(0xFF7B7B7B)),),
                            ),
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  SchoolInfoImage(),
                                  SchoolInfoImage(),
                                  SchoolInfoImage(),
                                  SchoolInfoImage(),
                                ],
                              ),
                            ),
                            Container(
                              color: Color(0xFF7B7B7B),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 50,
                                        ),

                                        Text("Contact Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(

                                            decoration: BoxDecoration(

                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                      color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                            ),

                                            child: Icon(Icons.location_on,color: Color(0xFF7B7B7B),)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Text("Camlin Public School, Rajan layout, 8th main, RR Nagar, Bangalore- 546789",
                                            overflow: TextOverflow.ellipsis,
                                          maxLines: 10,style: TextStyle(color: Colors.white),),
                                        ),
                                     SizedBox(
                                       width: MediaQuery.of(context).size.width/3,
                                     )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(

                                            decoration: BoxDecoration(

                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                            ),

                                            child: Icon(Icons.phone,color: Color(0xFF7B7B7B),)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Text("+91-45678998754",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 10,style: TextStyle(color: Colors.white),),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width/3,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(

                                            decoration: BoxDecoration(

                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                            ),

                                            child: Icon(Icons.email,color: Color(0xFF7B7B7B),)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Text("abc@mail.com",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 10,style: TextStyle(color: Colors.white),),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width/3,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:5,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SchoolInfoImage extends StatelessWidget {
  const SchoolInfoImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height:180 ,
          width: 280,
//          color: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child:   ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',

              fit: BoxFit.cover, ),
          ),
        ),
        Center(child: Text("Library"))
      ],
    );
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];


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