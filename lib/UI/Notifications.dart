import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Resources/SpecialCharacters.dart';
import 'package:flutterchalkparent/Responses/NotificationResponse.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'BottomNavigationBaar.dart';

Color pagetheme = Color(0xFFE59810);
class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List <Widget> widget_items  = new List();
  bool _saving=false;
  Widget _widget = Container();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Scaffold(
          body: Container(
            child: Column(
              children: <Widget>[
                BottomNavigationBaar(name: "Notification",ImagePath: "Images/ic_nitification_new.png",Themecolor: pagetheme,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20),
                    child:_widget
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String ParentID = prefs.getString('ParentID');
    String student =prefs.getString('Student_ID');
    String ClassID = prefs.getString('Class_ID');
    String Section_ID = prefs.getString('Section_ID');
    fetchNotificationData(ParentID,student,ClassID,Section_ID);

  }


  fetchNotificationData(String ParentID,String Student_ID,String Class_ID,String Section_ID ) async {
setState(() {
  _saving=true;
});
    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,
      'Section_ID': Section_ID,

    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL+Constant.getNotifications,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var notificationResponse = NotificationResponse.fromJson(decodedValue);
    print("Valuee : ${NotificationResponse}");

    if(notificationResponse.Status_Response == '200'){

      for(int i = 0 ; i<notificationResponse.notifications_response.length;i++){
        if(notificationResponse.notifications_response[i].Status_ID == '1'){
          widget_items.add(NotificationWidget(Title:SpecialCharacters.getCurrectString(notificationResponse.notifications_response[i].Notification_Text) ,
          date: notificationResponse.notifications_response[i].Created_on,
          data: SpecialCharacters.getCurrectString(notificationResponse.notifications_response[i].Notification_info),));
        }
      }

      setState(() {
        _saving=false;
        _widget= ListView(
          children: widget_items,
        );
      });




    }else{
setState(() {
  _saving=false;
  _widget=Center(child: Text('No Notification Found'),);
});






    }
  }

  @override
  void initState() {
    getStringValuesSF();
  }
}

class NotificationWidget extends StatelessWidget {
  String Title,data,date;


  NotificationWidget({this.Title, this.data, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(height: 7.0,),
        Row(
          children: <Widget>[

            Text(Title,style:  TextStyle( fontFamily: 'RobotoMono', color: Colors.blue),),
          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(data,
          style :  TextStyle( fontFamily: 'RobotoMono',
              color: Colors.grey
          ),),
        SizedBox(height: 6.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(date,style:  TextStyle( fontFamily: 'RobotoMono',fontSize: 11,color: Colors.grey),),
          ],
        ),
        SizedBox(
          height: 4.0,
        ),
        Container(
          color: Colors.grey.shade500,
          height: 0.5,
        ),
      ],),
    );
  }
}