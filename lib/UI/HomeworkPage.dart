//
//import 'dart:convert';
//
//import 'package:flutterchalkparent/Resources/Constant.dart';
//import 'package:flutterchalkparent/Responses/HomeworkResponse.dart';
//import 'package:http/http.dart' as http;
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutterchalkparent/Resources/AppBaar.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//import 'HomePage.dart';
//Color pagetheme = Color(0xFF4E0423);
//class HomeworkPage extends StatefulWidget {
//  @override
//  _State createState() => _State();
//}
//
//class _State extends State<> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}
//
//class  HomeworkPage{
//
//  static HomeworkResponse homeworkResponse;
//  List <Widget> widget_items  = new List();
//   Widget _widget = Container();
//  static String ParentID  ;
//  static String student  ;
//  static String ClassID ;
//  static  String Section_ID;
//
//
//
//
//  Widget getHomeworkPage(BuildContext context){
//    getStringValuesSF();
//    return SafeArea(
//      child: Scaffold(
//        body:Column(
//          children: <Widget>[
//            AppBaar(name: 'HomeWork',ImagePath: "Images/achievement.png",Themecolor: pagetheme,),
//            Expanded(
//              child: Container(
//                child: fetchHomeWorkData(ParentID,student,ClassID,Section_ID)
//              ),
//            )
//          ],
//        ) ,
//      ),
//    );
//
//
//
//  }
//
//   getStringValuesSF() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    //Return String
//     ParentID = prefs.getString('ParentID');
//     student =prefs.getString('Student_ID');
//     ClassID = prefs.getString('Class_ID');
//     Section_ID = prefs.getString('Section_ID');
//
//
//  }
//
//
//  fetchHomeWorkData(String ParentID,String Student_ID,String Class_ID,String Section_ID ) async {
//
//    Map data = {
//      'docket': Constant.docket,
//      'Parent_ID': ParentID,
//      'Student_ID': Student_ID,
//      'Class_ID': Class_ID,
//      'Section_ID': Section_ID,
//
//    };
//    //encode Map to JSON
//    var body = json.encode(data);
//
//    var res = await http.post(Constant.BASE_URL+Constant.getHomework,
//        headers: {"Content-Type": "application/json"}, body: body);
//    print("${res.statusCode}");
//    print("${res.body}");
//    var decodedValue = jsonDecode(res.body);
//
//    var homeworkResponse = HomeworkResponse.fromJson(decodedValue);
//    print("Valuee : ${HomeworkResponse}");
//
//    if(homeworkResponse.Status_Response == '200'){
//
//      for(int i = 0 ; i<homeworkResponse.subjects_homework_response.length;i++){
//        if(homeworkResponse.subjects_homework_response[i].Status_ID == '1'){
//          widget_items.add(HomeWorkWiget(Teacher:homeworkResponse.subjects_homework_response[i].Teachers_Name ,
//              homework: homeworkResponse.subjects_homework_response[i].Homework,
//              date: homeworkResponse.subjects_homework_response[i].Submission_date,
//              Subject:homeworkResponse.subjects_homework_response[i].Subject_Name
//
//          ));
//        }
//      }
//
//
//        return _widget= ListView(
//          children: widget_items,
//        );
//
//
//
//    }else{
//
//      return  _widget=Center(child: Text('No Homework Found'),);
//
//
//
//
//
//    }
//  }
//
//}
//
//
//
//
//
//
//
//
//
//
//
//
//class HomeWorkWiget extends StatelessWidget {
//
//  HomeWorkWiget({this.Teacher, this.homework,   this.date, this.Subject});
//
//
//  String Teacher,homework,date,Subject;
//
//
//  @override
//  Widget build(BuildContext context) {
//    String Teacher,homework,date,Subject;
//
//    MediaQueryData queryData;
//    queryData = MediaQuery.of(context);
//    return Container(
//      child: Column(
//        children: <Widget>[
//          SizedBox(
//            height: 10.0,
//          ),
//          Align(
//            alignment: Alignment.bottomRight,
//              child: Padding(
//                padding: const EdgeInsets.only(right:8.0),
//                child: Text(Teacher,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.blue),),
//              )),
//          Container(
//            child: Stack(
//              children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(left: 40.0,right: 5.0),
//                 padding: EdgeInsets.only(top:5.0,bottom: 5.0,right:5.0,left:50),
//                 width: queryData.size.width-50,
//
//              decoration: new BoxDecoration(
//                  color: Colors.white,
//                  border: Border.all(color: Colors.blueGrey,width: 0.2),
//
//                  borderRadius: new BorderRadius.all(Radius.circular(10),),
//
//               ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     SizedBox(
//                       height: 5.0,
//                     ),
//                     Text(Subject,style:  TextStyle( fontFamily: 'RobotoMono',
//                        fontSize: 14,
//                       color: Colors.blue
//                     ),),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Text(homework,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.black),),
//                     SizedBox(
//                       height: 5.0,
//                     ),
//                   ],
//                 ),
//
//               ),
//                Positioned(
//                  left: 10,
//                  top: 20,
//                  child: Material(
//
//                    borderRadius: new BorderRadius.circular(5.0),
//                    elevation: 5.0,
//
//                    child: Container(
//                      margin: EdgeInsets.all(5.0),
//                      height: 50,
//                      width: 50,
//                      decoration: new BoxDecoration(
//                        color: Colors.purple.shade900,
//
//                        borderRadius: new BorderRadius.all(Radius.circular(50),),
//
//                      ),
//                      child: Center(child: Text(date,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white),)),
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//          SizedBox(
//            height: 10.0,
//          ),
//
//        ],
//      ),
//    );
//  }
//
//}