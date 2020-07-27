import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';

class Achivements extends StatefulWidget {
  static const String id = "Achivements";

  @override
  _AchivementsState createState() => _AchivementsState();
}

class _AchivementsState extends State<Achivements> {
  Color pagetheme = Color(0xFFFF4F79);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container(child: Column(
      children: <Widget>[
        AppBaar(name: "Achivements",
          ImagePath: "Images/achievement.png",
        Themecolor: pagetheme,),
        Row(

          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10,top:15),
                width: 150.0,
                height: 150.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://i.imgur.com/BoN9kdC.png")
                    )
                )),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Congratulation !",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 10.0,),
                    Text("You Won !",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0,),


          ],
        ),
        Expanded(
          child: ListView(
           
            children: <Widget>[
              AchivementsWidget(),
              AchivementsWidget(),
              AchivementsWidget(),
              AchivementsWidget(),
              AchivementsWidget(),
              AchivementsWidget(),
              AchivementsWidget(),

            ],
          ),
        )
      ],
    ),),
    ));
  }
}

class AchivementsWidget extends StatelessWidget {
  const AchivementsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(5.0),
        elevation: 2.0,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Text("School Leaders",style: TextStyle(color: Colors.blue,fontSize: 18),),
            SizedBox(height: 10,),
            Text("Congratulation you have won something really valuable. valuable valuable valuable valuable valuable valuable...",style: TextStyle(color: Colors.grey),),

          ],),
        ),
      ),
    );
  }
}
