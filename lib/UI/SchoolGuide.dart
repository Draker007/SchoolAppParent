import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';

class SchoolGuide extends StatefulWidget {
  static const String id = 'SchoolGuide';
  @override
  _SchoolGuideState createState() => _SchoolGuideState();
}

class _SchoolGuideState extends State<SchoolGuide> {
  Color pagetheme = Color(0xFFFAA613);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            AppBaar(name: "School Guide",ImagePath: 'Images/achievement.png',Themecolor: pagetheme,),
            Expanded(
                child: ListView(
                  children: <Widget>[
                    SchoolGuideWidget(),
                    SchoolGuideWidget(),
                    SchoolGuideWidget(),
                    SchoolGuideWidget(),
                    SchoolGuideWidget(),
                    SchoolGuideWidget(),
                    SchoolGuideWidget(),
                    SchoolGuideWidget(),
                    SchoolGuideWidget(),
                    SchoolGuideWidget(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class SchoolGuideWidget extends StatelessWidget {
  const SchoolGuideWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Material(
            color: Colors.blue,
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              padding: EdgeInsets.all(5),
              height: (MediaQuery.of(context).size.width/2)-50,
              width: (MediaQuery.of(context).size.width/2)-50,
            child: Center(child: Text('jhgasdkjgasjd aysgdjhgs dasgd jhsagdja sda sdasd asd asdasd',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
            ),
          ),
          Material(color: Colors.green,
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              height: (MediaQuery.of(context).size.width/2)-50,
              width: (MediaQuery.of(context).size.width/2)-50,
              child: Center(child: Text('jhgasdkjgasjd aysgdjhgs dasgd jhsagdja sda sdasd asd asdasd',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),

            ),
          )
        ],
      ),
    );
  }
}
