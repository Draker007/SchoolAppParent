import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/HomeworkResponse.dart';
import 'package:flutterchalkparent/UI/Achivements.dart';
import 'package:flutterchalkparent/UI/Calender.dart';
import 'package:flutterchalkparent/UI/Exams.dart';
import 'package:flutterchalkparent/UI/Fees.dart';
import 'package:flutterchalkparent/UI/NewsLetters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Assignment.dart';
import 'Galllery.dart';
import 'Result.dart';
import 'SchoolGuide.dart';
import 'SchoolInfo.dart';
import 'SchoolLeaders.dart';
import 'Syllabus.dart';
import 'Test.dart';

class Home{

   Widget getHome(BuildContext context){
   return Scaffold(
      body: SafeArea(
        child: Container(
            color: Colors.white,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                LandingPageContanier(
                  Name: "Assignment",
                  ImagePath: "Images/newassigment.png",
                  onPressed: () { Navigator.pushNamed(context, Assignment.id);},
                  Themecolor: Color(0xFFFF4F79),
                ),
                LandingPageContanier(
                  Name: "Syllabus",
                  ImagePath: "Images/newsyllabus.png",
                  onPressed: () {
                    Navigator.pushNamed(context, Syllabus.id);
                  },
                  Themecolor: Color(0xFF3385C9),
                ),
                LandingPageContanier(
                  Name: "Fees",
                  ImagePath: "Images/newfee.png",
                  onPressed: () {Navigator.pushNamed(context, Fees.id);},
                  Themecolor: Color(0xFF8BF500),
                ),
                LandingPageContanier(
                  Name: "Exams",
                  ImagePath: "Images/newexams.png",
                  onPressed: () {Navigator.pushNamed(context, Exams.id);},
                  Themecolor: Color(0xFFE81A13),
                ),
                LandingPageContanier(
                  Name: "Results",
                  ImagePath: "Images/newresults.png",
                  onPressed: () {Navigator.pushNamed(context, Result.id);},
                  Themecolor: Color(0xFF049A51),
                ),
                LandingPageContanier(
                  Name: "Achivements",
                  ImagePath: "Images/newachievement.png",
                  onPressed: () {Navigator.pushNamed(context, Achivements.id);},
                  Themecolor: Color(0xFFFF4F79),
                ),
                LandingPageContanier(
                  Name: "Calendar",
                  ImagePath: "Images/newcalendar.png",
                  onPressed: () {
                    Navigator.pushNamed(context, Calender.id);

                  }, Themecolor: Color(0xFFFAA613),
                ),
                LandingPageContanier(
                  Name: "Gallery",
                  ImagePath: "Images/gallery.png",
                  onPressed: () {Navigator.pushNamed(context, Gallery.id);},
                  Themecolor: Color(0xFF550527),
                ),
                LandingPageContanier(
                  Name: "School Info",
                  ImagePath: "Images/ic_school_info.png",
                    Themecolor:Color(0xFF3993DD),
                  onPressed: () {Navigator.pushNamed(context, SchoolInfo.id);},

                ),
                LandingPageContanier(
                  Name: "School Guide",
                  ImagePath: "Images/newschoolguide.png",
                  onPressed: () {
                    Navigator.pushNamed(context, SchoolGuide.id);
                  },
                  Themecolor: Color(0xFFFAA613),
                ),
                LandingPageContanier(
                  Name: "School Leaders",
                  ImagePath: "Images/newschoolleader.png",
                  onPressed: () {Navigator.pushNamed(context, SchoolLeaders.id);},
                  Themecolor: Color(0xFF7DDD00),
                ),
                LandingPageContanier(
                  Name: "NewsLetters",
                  ImagePath: "Images/newnewsletter.png",
                  onPressed: () {Navigator.pushNamed(context, NewsLetters.id);},
                  Themecolor: Color(0xFFFF4F79),
                ),

//                LandingPageContanier(
//                  Name: "Test",
//                  ImagePath: "Images/achievement.png",
//                  onPressed: () {
//                    Navigator.push(context, MaterialPageRoute(builder: (context) => CircularListPage()));
//                  },
//                  Themecolor: Color(0xFFE81A13),
//                ),
              ],
            )),
      ),
    );
  }
}


class LandingPageContanier extends StatelessWidget {
  String Name;
  String ImagePath;
  Function onPressed;
  Color Themecolor;

  LandingPageContanier({this.Name, this.ImagePath, this.onPressed ,this.Themecolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 60.0,
              width: 135.0,
              child: Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  Positioned(
                    bottom: 0.0,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: onPressed,
                      color: Themecolor,
//                  decoration: BoxDecoration(
//
//borderRadius: BorderRadius.all(Radius.circular(20))),
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(30.0),

                      ),
                      child: Container(
                        height: 40.0,
                        width: 100.0,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 7.0,
                    child: RaisedButton(
                      onPressed:onPressed ,
                      color: Colors.white,
//                  decoration: BoxDecoration(
//
//borderRadius: BorderRadius.all(Radius.circular(20))),
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                        child: Center(child: Text(Name,style:  TextStyle( fontFamily: 'RobotoMono',
                          color: Colors.black, fontSize: 14.0,
                        ),)),
                        height: 40.0,
                        width: 100.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              "---------",
              style:  TextStyle( fontFamily: 'RobotoMono',
                  color: Colors.black, fontSize: 25.0, letterSpacing: 5.0),
            ),
            Container(
                height: 40.0,
                width: 40.0,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(

                    border: Border.all(
                  width: 3.0,
                      color: Themecolor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Image(image: AssetImage(ImagePath)))
          ],
        ),
      ),
    );
  }


}


