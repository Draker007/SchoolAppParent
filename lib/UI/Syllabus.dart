

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';

import 'LandingPage.dart';
Color pagetheme = Color(0xFF3385C9);
class Syllabus extends StatefulWidget {
  static const String id = 'Syllabus';
  Color pagetheme = Color(0xFF3385C9);

  @override
  _SyllabusState createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            AppBaar(name:"Syllabus",ImagePath:"Images/achievement.png",Themecolor: pagetheme,),
            Flexible(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    SyllabusListContainer(Subject: "Mathematics",onPressed: (){},),
                    SyllabusListContainer(Subject: "Science",onPressed: (){},),
                    SyllabusListContainer(Subject: "English",onPressed: (){},),
                    SyllabusListContainer(Subject: "Mathematics",onPressed: (){},),
                    SyllabusListContainer(Subject: "Mathematics",onPressed: (){},),
                    SyllabusListContainer(Subject: "Mathematics",onPressed: (){},),
                    SyllabusListContainer(Subject: "Mathematics",onPressed: (){},),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SyllabusListContainer extends StatelessWidget {
  final String Subject;
  Function onPressed;


  SyllabusListContainer({this.Subject, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 70.0,
      margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
                child: Material(
                  borderRadius: new BorderRadius.circular(3.0),
                  elevation: 4.0,
        child: Container(

          height: 55.0,
          width: 55.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    height: 70.0,
                    width: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Subject"),
                        Text(Subject)
                      ],
                    ),
                  ),
                ),
              ),
              Image(
                image: AssetImage('Images/downloadimg.png'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


