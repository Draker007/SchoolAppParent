

import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart' as wheel;
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
import 'HomePage.dart';
import 'Syllabus.dart';

class CircularListPage extends StatefulWidget {
  static const String id = "asddsa";

  @override
  _CircularListPageState createState() => _CircularListPageState();
}

class _CircularListPageState extends State<CircularListPage> {
  wheel.FixedExtentScrollController _controller;

  _listListener() {
    setState(() {});
  }

  @override
  void initState() {
    _controller = wheel.FixedExtentScrollController();
    _controller.addListener(_listListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F6FE0),
      appBar: AppBar(
        title: Text("Circular List"),
      ),
      body: wheel.CircleListScrollView.useDelegate(
        childDelegate: wheel.CircleListChildBuilderDelegate(
          builder: (context, index) {
            int currentIndex = 0;
            try {
              currentIndex = _controller.selectedItem;
            } catch (_) {}
            final resizeFactor =
            (1 - (((currentIndex - index).abs() * 0.3).clamp(0.0, 1.0)));
            Character c1;
            return CircleListItem(
                character:Character().characters[index]
            );
          },
          childCount: Character().characters.length,
        ),
        physics: wheel.CircleFixedExtentScrollPhysics(),
        controller: _controller,
        axis: Axis.vertical,
        itemExtent: 120,
        radius: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
}

class CircleListItem extends StatelessWidget {

  final Character character;


  CircleListItem({this.character});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: character.onPressed,
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
                      onPressed: character.onPressed,
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
                      onPressed:character.onPressed ,
                      color: Colors.white,
//                  decoration: BoxDecoration(
//
//borderRadius: BorderRadius.all(Radius.circular(20))),
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                        child: Center(child: Text(character.Name,style: TextStyle(
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
                child: Image(image: AssetImage(character.ImagePath)))
          ],
        ),
      ),
    );
  }
}
//
//LandingPageContanier(
//Name: "Assignment",
//ImagePath: "Images/achievement.png",
//onPressed: () { Navigator.pushNamed(context, Assignment.id);},
//),
//LandingPageContanier(
//Name: "Syllabus",
//ImagePath: "Images/achievement.png",
//onPressed: () {
//Navigator.pushNamed(context, Syllabus.id);
//},
//),
//LandingPageContanier(
//Name: "Fees",
//ImagePath: "Images/achievement.png",
//onPressed: () {Navigator.pushNamed(context, Fees.id);},
//),
//LandingPageContanier(
//Name: "Exams",
//ImagePath: "Images/achievement.png",
//onPressed: () {},
//),
//LandingPageContanier(
//Name: "Results",
//ImagePath: "Images/achievement.png",
//onPressed: () {},
//),
//LandingPageContanier(
//Name: "Achivements",
//ImagePath: "Images/achievement.png",
//onPressed: () {Navigator.pushNamed(context, Achivements.id);},
//),
//LandingPageContanier(
//Name: "Calendar",
//ImagePath: "Images/achievement.png",
//onPressed: () {
//Navigator.pushNamed(context, Calender.id);
//},
//),
//LandingPageContanier(
//Name: "Gallery",
//ImagePath: "Images/achievement.png",
//onPressed: () {},
//),
//LandingPageContanier(
//Name: "School Info",
//ImagePath: "Images/achievement.png",
//onPressed: () {},
//),
//LandingPageContanier(
//Name: "School Guide",
//ImagePath: "Images/achievement.png",
//onPressed: () {
//Navigator.pushNamed(context, SchoolGuide.id);
//},
//),
//LandingPageContanier(
//Name: "School Leaders",
//ImagePath: "Images/achievement.png",
//onPressed: () {Navigator.pushNamed(context, SchoolLeaders.id);},
//),
//LandingPageContanier(
//Name: "NewsLetters",
//ImagePath: "Images/achievement.png",
//onPressed: () {Navigator.pushNamed(context, NewsLetters.id);},
//),
//LandingPageContanier(
//Name: "Achivement",
//ImagePath: "Images/achievement.png",
//onPressed: () {},
//),
//LandingPageContanier(
//Name: "Achivement",
//ImagePath: "Images/achievement.png",
//onPressed: () {},
//),
//LandingPageContanier(
//Name: "Test",
//ImagePath: "Images/achievement.png",
//onPressed: () {
//Navigator.pushNamed(context, CircularListPage.id);
//},
//),
//],




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









class Character {
  String Name;
  String ImagePath;
  Function onPressed;


  Character({this.Name, this.ImagePath,
    this.onPressed}); //source: https://www.giantbomb.com/dragon-ball-z/3025-159/characters/


  final characters = <Character>[
    Character(
      Name: "Test",
      ImagePath: "Images/achievement.png",
      onPressed: () {

      },
    ),
    Character(
      Name: "Test",
      ImagePath: "Images/achievement.png",
      onPressed: () {

      },
    ),
    Character(
      Name: "Test",
      ImagePath: "Images/achievement.png",
      onPressed: () {

      },
    ),
    Character(
      Name: "Test",
      ImagePath: "Images/achievement.png",
      onPressed: () {

      },
    ),
    Character(
      Name: "Test",
      ImagePath: "Images/achievement.png",
      onPressed: () {

      },
    ),
    Character(
      Name: "Test",
      ImagePath: "Images/achievement.png",
      onPressed: () {

      },
    ),
    Character(
      Name: "Test",
      ImagePath: "Images/achievement.png",
      onPressed: () {

      },
    ),
    Character(
      Name: "Test",
      ImagePath: "Images/achievement.png",
      onPressed: () {

      },
    ),
    Character(
      Name: "Test",
      ImagePath: "Images/achievement.png",
      onPressed: () {

      },
    ),

  ];
}