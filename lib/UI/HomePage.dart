import 'package:flutter/material.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutterchalkparent/UI/Achivements.dart';
import 'package:flutterchalkparent/UI/Calender.dart';
import 'package:flutterchalkparent/UI/Fees.dart';
import 'package:flutterchalkparent/UI/NewsLetters.dart';
import 'Assignment.dart';
import 'SchoolGuide.dart';
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
                  ImagePath: "Images/achievement.png",
                  onPressed: () { Navigator.pushNamed(context, Assignment.id);},
                ),
                LandingPageContanier(
                  Name: "Syllabus",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {
                    Navigator.pushNamed(context, Syllabus.id);
                  },
                ),
                LandingPageContanier(
                  Name: "Fees",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {Navigator.pushNamed(context, Fees.id);},
                ),
                LandingPageContanier(
                  Name: "Exams",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {},
                ),
                LandingPageContanier(
                  Name: "Results",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {},
                ),
                LandingPageContanier(
                  Name: "Achivements",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {Navigator.pushNamed(context, Achivements.id);},
                ),
                LandingPageContanier(
                  Name: "Calendar",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {
                    Navigator.pushNamed(context, Calender.id);
                  },
                ),
                LandingPageContanier(
                  Name: "Gallery",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {},
                ),
                LandingPageContanier(
                  Name: "School Info",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {},
                ),
                LandingPageContanier(
                  Name: "School Guide",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {
                    Navigator.pushNamed(context, SchoolGuide.id);
                  },
                ),
                LandingPageContanier(
                  Name: "School Leaders",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {Navigator.pushNamed(context, SchoolLeaders.id);},
                ),
                LandingPageContanier(
                  Name: "NewsLetters",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {Navigator.pushNamed(context, NewsLetters.id);},
                ),
                LandingPageContanier(
                  Name: "Achivement",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {},
                ),
                LandingPageContanier(
                  Name: "Achivement",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {},
                ),
                LandingPageContanier(
                  Name: "Test",
                  ImagePath: "Images/achievement.png",
                  onPressed: () {
                    Navigator.pushNamed(context, CircularListPage.id);
                  },
                ),
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

  LandingPageContanier({this.Name, this.ImagePath, this.onPressed});

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
                      color: Colors.purple.shade900,
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
                        child: Center(child: Text(Name,style: TextStyle(
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
              style: TextStyle(
                  color: Colors.black, fontSize: 25.0, letterSpacing: 5.0),
            ),
            Container(
                height: 40.0,
                width: 40.0,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(

                    border: Border.all(
                  width: 3.0,
                      color: Colors.purple,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Image(image: AssetImage(ImagePath)))
          ],
        ),
      ),
    );
  }
}