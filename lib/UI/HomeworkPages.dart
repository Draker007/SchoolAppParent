
import 'dart:convert';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/HomeworkResponse.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BottomNavigationBaar.dart';

Color pagetheme = Color(0xFF4E0423);

class HomeworkPages extends StatefulWidget {
  @override
  _HomeworkPagesState createState() => _HomeworkPagesState();
}

class _HomeworkPagesState extends State<HomeworkPages> {


  static HomeworkResponse homeworkResponse;
  List <Widget> widget_items  = new List();
  Widget _widget = Container();
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Scaffold(
          body:Column(
            children: <Widget>[
              BottomNavigationBaar(name: 'HomeWork',ImagePath: "Images/ic_money_new.png",Themecolor: pagetheme,),
              Expanded(
                child: Container(
                    child:  _widget
                ),
              )
            ],
          ) ,
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
    fetchHomeWorkData(ParentID,student,ClassID,Section_ID);

  }


  fetchHomeWorkData(String ParentID,String Student_ID,String Class_ID,String Section_ID ) async {
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

    var res = await http.post(Constant.BASE_URL+Constant.getHomework,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var homeworkResponse = HomeworkResponse.fromJson(decodedValue);
    print("Valuee : ${HomeworkResponse}");

    if(homeworkResponse.Status_Response == '200'){

      for(int i = 0 ; i<homeworkResponse.subjects_homework_response.length;i++){

        if(homeworkResponse.subjects_homework_response[i].Status_ID == '1'){
          String str = homeworkResponse.subjects_homework_response[i].Submission_date;
          var arr = str.split('-');
          var  month =   arr[1] ;
          var date = arr[2];
          String Month = "Jan";

          switch (month){
            case '01':
              Month = "Jan";
              break;
            case '02':
              Month = "Feb";
              break;
            case '03':
              Month = "Mar";
              break;
            case '04':
              Month = "Apr";
              break;
            case '05':
              Month = "May";
              break;
            case '06':
              Month = "Jun";
              break;
            case '07':
              Month = "Jul";
              break;
            case '08':
              Month = "Aug";
              break;
            case '09':
              Month = "Sep";
              break;
            case '10':
              Month = "Oct";
              break;
            case '11':
              Month = "Nov";
              break;
            default:
              Month = "Dec";
              break;
          }



          print(homeworkResponse.subjects_homework_response[i].Teachers_Name);
          print(homeworkResponse.subjects_homework_response[i].Homework);
          print(homeworkResponse.subjects_homework_response[i].Submission_date);
          print(homeworkResponse.subjects_homework_response[i].Sub_Subject_Name);
          print("m here");
          widget_items.add(HomeWorkWiget(Teacher:(homeworkResponse.subjects_homework_response[i].Teachers_Name   ),
              homework: (homeworkResponse.subjects_homework_response[i].Homework ),
              date:  Month  ,
              month:date,
              Subject:(homeworkResponse.subjects_homework_response[i].Sub_Subject_Name )

          ));
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
        _widget=Center(child: Text('No Homework Found'),);
      });





    }
  }

  @override
  void initState() {
    getStringValuesSF();
  }
}







class HomeWorkWiget extends StatelessWidget {
  String Teacher,homework,date,Subject,month;

  HomeWorkWiget({this.Teacher, this.homework,   this.date, this.Subject, this.month});





  @override
  Widget build(BuildContext context) {


    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Text(Teacher,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.blue),),
              )),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 40.0,right: 5.0),
                  padding: EdgeInsets.only(top:5.0,bottom: 5.0,right:5.0,left:50),
                  width: queryData.size.width-50,

                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blueGrey,width: 0.2),

                    borderRadius: new BorderRadius.all(Radius.circular(10),),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(Subject,style:  TextStyle( fontFamily: 'RobotoMono',
                          fontSize: 14,
                          color: Colors.blue
                      ),),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(homework,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.black),),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),

                ),
                Positioned(
                  left: 10,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Material(

                      borderRadius: new BorderRadius.circular(5.0),
                      elevation: 5.0,

                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        height: 50,
                        width: 50,
                        decoration: new BoxDecoration(
                          color:  Color(0xFF550527),

                          borderRadius: new BorderRadius.all(Radius.circular(50),),

                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(month,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white),),
                              Text(date,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

        ],
      ),
    );
  }

}