import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/Attendant_Response.dart';
import 'package:flutterchalkparent/Responses/ChooseKidResponse.dart';
import 'package:flutterchalkparent/Responses/Profile_Response.dart';
import 'package:flutterchalkparent/Responses/Result_Response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String id = "Profile";
Widget _widget = Container();

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ChooseKidResponse ChooseKidRe;
  String Student_Name = '--',
      Attendance = '--',
      Percentage = '--',
      Perfomance = '--',
      Address = '--',
      PhoneNumber = '--',
      MotherName = '--',
      FatherName = '--',
      Bloodgrp = '--',
      Section = '--',
      Class = '--';
  List<Widget> widget_items = new List();

 static String character;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 220,
                width: double.infinity,
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
//                    color: Colors.blue,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Images/profileBG.png"),
                              fit: BoxFit.cover)),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => CustomDailog());
                            },
                            child: Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.all(30),
                                child: Image(
                                  image: AssetImage('Images/threedot.png'),
                                  height: 40,
                                  width: 5,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: Container(
                          margin: EdgeInsets.only(top: 35),
                          width: 120.0,
                          height: 120.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://i.imgur.com/BoN9kdC.png")))),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Name",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.grey[600]),
                              ),
                              Text(Student_Name,
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Class",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.grey[600]),
                              ),
                              Text(Class,
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Section",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.grey[600]),
                              ),
                              Text(Section,
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Blood Group",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.grey[600]),
                              ),
                              Text(Bloodgrp,
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Father's Name",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.grey[600]),
                              ),
                              Text(FatherName,
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Mother's Name",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.grey[600]),
                              ),
                              Text(MotherName,
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.grey[600]),
                              ),
                              Text(PhoneNumber,
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Address",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.grey[600]),
                              ),
                              Flexible(
                                child: Container(
                                    margin: EdgeInsets.only(left: 50),
                                    alignment: Alignment.centerRight,
                                    child: Text(Address,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        style: TextStyle(
                                            fontFamily: 'RobotoMono',
                                            color: Colors.grey[600]))),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
//                        height: 100,
//                        width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400)),
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        Perfomance,
                                        style: TextStyle(
                                            fontFamily: 'RobotoMono',
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Perfomance")
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        Percentage,
                                        style: TextStyle(
                                            fontFamily: 'RobotoMono',
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Percentage")
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        Attendance,
                                        style: TextStyle(
                                            fontFamily: 'RobotoMono',
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Attendance")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    getStringValuesSF();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String ParentID = prefs.getString('ParentID');
    String student = prefs.getString('Student_ID');
    String ClassID = prefs.getString('Class_ID');
    String Section_ID = prefs.getString('Section_ID');
    character = prefs.getString('Student_ID');
    fetchProfileData(ParentID, student, ClassID, Section_ID);
    fetchResultData(ParentID, student, ClassID, Section_ID);
    fetchAttendenceData(ParentID, student, ClassID, Section_ID);
    fetchKidData(ParentID);
  }

  fetchProfileData(String ParentID, String Student_ID, String Class_ID,
      String Section_ID) async {
    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,
      'Section_ID': Section_ID,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL + Constant.getProfile,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var profile_Response = Profile_Response.fromJson(decodedValue);
    print("Valuee : ${Profile_Response}");

    if (profile_Response.Status_Response == '200') {
      setState(() {
        Student_Name =
            profile_Response.Student_parentinfo_response[0].Student_Name;

        Address = profile_Response.Student_parentinfo_response[0].Address;
        PhoneNumber = profile_Response
            .Student_parentinfo_response[0].Parents_Contact_Number;
        MotherName =
            profile_Response.Student_parentinfo_response[0].Parents_Name_mother;
        FatherName =
            profile_Response.Student_parentinfo_response[0].Parents_Name;
        Bloodgrp =
            profile_Response.Student_parentinfo_response[0].Student_Bloodgroup +
                " ve";
        Section = profile_Response.Student_parentinfo_response[0].Section_Name;
        Class = profile_Response.Student_parentinfo_response[0].Class_Name;
      });
    } else {
      setState(() {
        Student_Name = "--";
        Attendance = '0';
        Address = "--";
        PhoneNumber = "--";
        MotherName = "--";
        FatherName = "--";
        Bloodgrp = "--";
        Section = "--";
        Class = "--";
        Percentage = '';
        Perfomance = '';
      });
    }
  }

  fetchResultData(String ParentID, String Student_ID, String Class_ID,
      String Section_ID) async {
    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,
      'Section_ID': Section_ID,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL + Constant.getResult,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var result_Response = Result_Response.fromJson(decodedValue);
    print("Valuee : ${Result_Response}");

    if (result_Response.Status_Response == '200') {
      int totalObtained = 0, totalMaxMarks = 0;
      for (int i = 0; i < result_Response.results_response.length; i++) {
        totalObtained = totalObtained +
            int.parse(result_Response.results_response[i].Obtained_Marks);
        totalMaxMarks = totalMaxMarks +
            int.parse(result_Response.results_response[i].Exams_Max_Marks);
      }
      double percentage = ((totalObtained * 100) / totalMaxMarks);

      setState(() {
        Percentage = percentage.toStringAsFixed(2) + " %";
        Perfomance = '$totalObtained"/"$totalMaxMarks';
      });
    } else {
      setState(() {
        Percentage = "--";
        Perfomance = "--";
      });
    }
  }

  fetchAttendenceData(String ParentID, String Student_ID, String Class_ID,
      String Section_ID) async {
    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,
      'Section_ID': Section_ID,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL + Constant.getAttendance,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var attendant_Response = Attendant_Response.fromJson(decodedValue);
    print("Valuee : ${Attendant_Response}");

    if (attendant_Response.Status_Response == '200') {
      setState(() {
        Attendance = attendant_Response.attendance_response[0].Present +
            '/' +
            attendant_Response.attendance_response[0].No_of_days_working;
      });
    } else {
      setState(() {
        Attendance = "--";
      });
    }
  }

  fetchKidData(String ParentID) async {
    widget_items.clear();
    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL + Constant.getChildren,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

      ChooseKidRe = ChooseKidResponse.fromJson(decodedValue);
    print("Valuee : ${ChooseKidResponse}");
    print(
        "Login response: ${ChooseKidRe.select_kids_response[0].Student_Status}");

    if (ChooseKidRe.Status_Response == '200') {
      for (int i = 0; i < ChooseKidRe.select_kids_response.length; i++) {
        if (ChooseKidRe.select_kids_response[i].Student_Status == '1') {
          widget_items.add(

            Row(
              children: <Widget>[
                Radio(
                  value: ChooseKidRe.select_kids_response[i].Student_ID,
                  groupValue: character,
                  onChanged: (String value) {
                    print(value);
                     setState(() {
                       print(character);
                       character = value;
                       addStringToSF(  i);
                       Navigator.pop(context);
                     });
                  },
                ),
                Text(ChooseKidRe.select_kids_response[i].Student_Name)
              ],
            ),

           );
        }
      }

      setState(() {
        _widget = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget_items,
        );
      });
    } else {}
  }

  addStringToSF(int i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print('asaddsa'+ChooseKidRe.select_kids_response[i].Student_ID);


    prefs.setString('Student_ID',ChooseKidRe.select_kids_response[i].Student_ID);
    prefs.setString('Student_Name',ChooseKidRe.select_kids_response[i].Student_Name );
    prefs.setString('Student_Gender',ChooseKidRe.select_kids_response[i].Student_Gender );
    prefs.setString('Student_Image_Name',ChooseKidRe.select_kids_response[i].Student_Image_Name );
    prefs.setString('Class_Name',ChooseKidRe.select_kids_response[i].Class_Name );
    prefs.setString('Class_number',ChooseKidRe.select_kids_response[i].Section_Name );
    prefs.setString('Student_Gender',ChooseKidRe.select_kids_response[i].Student_Gender );
    prefs.setString('Class_ID',ChooseKidRe.select_kids_response[i].Class_ID );
    prefs.setString('Section_ID',ChooseKidRe.select_kids_response[i].Section_ID );
    print(('Student_ID'));
    print(ChooseKidRe.select_kids_response[i].Student_ID);
    getStringValuesSF();

  }
}

class CustomDailog extends StatelessWidget {
  String image, titles, date, details;

  CustomDailog({this.image, this.titles, this.date, this.details});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        backgroundColor: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height /3 ,
          width: MediaQuery.of(context).size.width - 10,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(
              Radius.circular(25),
            ),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Manage Profile'),
              _widget,
              Text('Change Password',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
              Text('Log out',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
            ],
          ),
        ));
  }
}
