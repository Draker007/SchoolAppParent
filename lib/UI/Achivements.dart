import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/AchivementResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Achivements extends StatefulWidget {
  static const String id = "Achivements";

  @override
  _AchivementsState createState() => _AchivementsState();
}

class _AchivementsState extends State<Achivements> {


//  AchivementResponse achivementResponse;
  static AchivementResponse achivementResponse;
  List <Widget> widget_items  = new List();
  Widget _widget=Container( );

  Color pagetheme = Color(0xFFFF4F79);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container(child: Column(
      children: <Widget>[
        AppBaar(name: "Achivements",
          ImagePath: "Images/newachievement.png",
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
                    Text("Congratulation !",style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 10.0,),
                    Text("You Won !",style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0,),


          ],
        ),
        Expanded(
          child: _widget,
        )
      ],
    ),),
    ));
  }

  void getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String ParentID = prefs.getString('ParentID');
    String student =prefs.getString('Student_ID');
    String ClassID = prefs.getString('Class_ID');
    String Section_ID = prefs.getString('Section_ID');
    fetchHomeWorkData(ParentID,student,ClassID,Section_ID);

  }
  fetchHomeWorkData(String ParentID,String Student_ID,String Class_ID,String Section_ID ) async {

    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,

    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL+Constant.getAchiement,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    achivementResponse = AchivementResponse.fromJson(decodedValue);
    print("Valuee : ${AchivementResponse}");

    if(achivementResponse.Status_Response == '200'){

      for(int i = 0 ; i<achivementResponse.student_performance_response.length;i++){
        if(achivementResponse.student_performance_response[i].Status_ID == '1'){
          widget_items.add(AchivementsWidget(
            Performance_Comments:achivementResponse.student_performance_response[i].Performance_Comments ,
            Performance_title: achivementResponse.student_performance_response[i].Performance_title,
          ));
        }
      }

setState(() {
  _widget= ListView(
    children:  widget_items,
  );
});


    }else{

      setState(() {
        _widget=Container(child: Center(child: Text('No Homework Found'),));
      });




    }
  }

  @override
  void initState() {
    getStringValuesSF();
  }
}












class AchivementsWidget extends StatelessWidget {

String Performance_title ,Performance_Comments;


AchivementsWidget({this.Performance_title, this.Performance_Comments});

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
            Text(Performance_title,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.blue,fontSize: 18),),
            SizedBox(height: 10,),
            Text(Performance_Comments,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.grey),),

          ],),
        ),
      ),
    );
  }



}
