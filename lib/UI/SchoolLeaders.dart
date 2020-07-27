import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';

class SchoolLeaders extends StatefulWidget {
  static const String id = 'SchoolLeaders';
  @override
  _SchoolLeadersState createState() => _SchoolLeadersState();
}

class _SchoolLeadersState extends State<SchoolLeaders> {
  Color pagetheme = Color(0xFF7DDD00);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            AppBaar(name: "School Leaders",ImagePath: 'Images/achievement.png',Themecolor: pagetheme,),
            Expanded(
              child: Container(

                child: ListView(
                  children: <Widget>[
                    SchoolLeadersWidget(name:'Draker Deeapk',classs:'V A',title:"Captain"),
                    SchoolLeadersWidget(name:'Draker Deeapk',classs:'V A',title:"Captain"),
                    SchoolLeadersWidget(name:'Draker Deeapk',classs:'V A',title:"Captain"),
                    SchoolLeadersWidget(name:'Draker Deeapk',classs:'V A',title:"Captain"),
                    SchoolLeadersWidget(name:'Draker Deeapk',classs:'V A',title:"Captain"),
                    SchoolLeadersWidget(name:'Draker Deeapk',classs:'V A',title:"Captain"),
                    SchoolLeadersWidget(name:'Draker Deeapk',classs:'V A',title:"Captain"),
                    SchoolLeadersWidget(name:'Draker Deeapk',classs:'V A',title:"Captain"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}







class SchoolLeadersWidget extends StatelessWidget {
  final String name , classs, title;

  SchoolLeadersWidget({this.name, this.classs, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
    height: 100,

      child: Material(
        borderRadius: BorderRadius.circular(5.0),
        elevation: 3.0,
        child: Container(
          child: Stack(
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0)),

                  ),
                  child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 16),)),
                  ),
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.blue,
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.white,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0))
                    ),
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Text(name,style: TextStyle(color: Colors.grey[700],fontSize: 16),),
                        SizedBox(height: 5,),
                        Text(classs,style: TextStyle(color: Colors.blue,fontSize: 16),),

                      ],
                    )),

                  ),
                )
              ],),
              Center(
                child: Container(

                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://i.imgur.com/BoN9kdC.png")))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
