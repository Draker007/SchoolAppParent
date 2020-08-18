import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Responses/HomeworkResponse.dart';
import 'package:flutterchalkparent/UI/HomePage.dart';
import 'HomeworkPages.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Notifications.dart';
import 'Profile.dart';
import 'package:http/http.dart' as http;

class LandingPage extends StatefulWidget {

  static const String id = "Landing_Page";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MyStatefulWidget());
  }
}



int _selectedIndex = 0;
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static HomeworkResponse homeworkResponse;
  List <Widget> widget_items  = new List();
  Widget _widget;

  static const TextStyle optionStyle =
   TextStyle( fontFamily: 'RobotoMono',fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {

    final Tabs = [
      Home().getHome(context),
      HomeworkPages(),
      Notifications(),
      Profile() ,
    ];
    return Scaffold(

      body: Tabs[_selectedIndex],
      bottomNavigationBar:new Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.purple[900],
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.white,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new  TextStyle( fontFamily: 'RobotoMono',color: Colors.white))), // sets the inactive color of the `BottomNavigationBar`
          child:  BottomNavigationBar(
            selectedIconTheme: IconThemeData(
              size: 25
            ),
            selectedFontSize: 15,
            unselectedIconTheme: IconThemeData(
                size: 20
            ),
            unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('HomeWork'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notification'),
              ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:  Colors.white,
        onTap: _onItemTapped,
      )),
    );
  }

//  getStringValuesSF() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    //Return String
//    String ParentID = prefs.getString('ParentID');
//    String student =prefs.getString('Student_ID');
//    String ClassID = prefs.getString('Class_ID');
//    String Section_ID = prefs.getString('Section_ID');
//    fetchHomeWorkData(ParentID,student,ClassID,Section_ID);
//    return ParentID;
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
//            homework: homeworkResponse.subjects_homework_response[i].Homework,
//            date: homeworkResponse.subjects_homework_response[i].Submission_date,
//              Subject:homeworkResponse.subjects_homework_response[i].Subject_Name
//
//          ));
//        }
//      }
//
//setState(() {
//  _widget= ListView(
//    children: widget_items,
//  );
//});
//
//
//    }else{
//setState(() {
//  _widget=Center(child: Text('No Homework Found'),);
//});
//
//
//
//
//    }
//  }

}
