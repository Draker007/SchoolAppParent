
import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';

class Notifications {
  Color pagetheme = Color(0xFFE59810);

  Widget getNotifications(){
  return Scaffold(
    body: Container(
      child: Column(
        children: <Widget>[
          AppBaar(name: "Notification",ImagePath: "Images/achievement.png",Themecolor: pagetheme,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20),
              child: ListView(
                children: <Widget>[
                  NotificationWidget(),
                  NotificationWidget(),
                  NotificationWidget(),
                  NotificationWidget(),
                  NotificationWidget(),
                  NotificationWidget(),
                  NotificationWidget(),
                  NotificationWidget(),
                  NotificationWidget(),
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

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(height: 7.0,),
        Row(
          children: <Widget>[

            Text("Independence Day",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Text("dsawqeassdwqeqjygjkh ada sikdd ad asd sdf e w cwue cwe wie eiuuewh ciuwe hf iewuh fiu euwfhiuwehuufgiudf",
            style : TextStyle(
          color: Colors.grey
        ),),
        SizedBox(height: 5.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("24-june-2020",style: TextStyle(fontSize: 11,color: Colors.grey),),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          color: Colors.grey.shade500,
          height: 1.0,
        ),
      ],),
    );
  }
}
