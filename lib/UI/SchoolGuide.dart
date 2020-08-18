import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Resources/SpecialCharacters.dart';
import 'package:flutterchalkparent/Responses/SchoolGuideResponse.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SchoolGuide extends StatefulWidget {
  static const String id = 'SchoolGuide';
  @override
  _SchoolGuideState createState() => _SchoolGuideState();
}

class _SchoolGuideState extends State<SchoolGuide> {
  Color pagetheme = Color(0xFFFAA613);
  List <Widget> widget_items  = new List();
  Widget _widget = Container();
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Scaffold(
          body: Column(
            children: <Widget>[
              AppBaar(name: "School Guide",ImagePath: 'Images/newschoolguide.png',Themecolor: pagetheme,),
              Expanded(
                  child:_widget)
            ],
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
    fetchSchooolGuideData(ParentID,student,ClassID,Section_ID);

  }


  fetchSchooolGuideData(String ParentID,String Student_ID,String Class_ID,String Section_ID ) async {
setState(() {
  _saving = true;
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

    var res = await http.post(Constant.BASE_URL+Constant.getSchoolGuide,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var schoolGuideResponse = SchoolGuideResponse.fromJson(decodedValue);
    print("Valuee : ${SchoolGuideResponse}");

    if(schoolGuideResponse.Status_Response == '200'){

      for(int i = 0 ; i<schoolGuideResponse.Important_notice_response.length;i++){
        widget_items.add(
            SchoolGuideWidget( Guideline:SpecialCharacters.getCurrectString(schoolGuideResponse.Important_notice_response[i].Important_notice_Type))
        );
      }

      setState(() {
        _saving = false;
        _widget= GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children:widget_items



        );
      });




    }else{
setState(() {
  _saving = false;
  _widget=Center(child: Text('No Notification Found'),);
});





    }
  }

  @override
  void initState() {
    getStringValuesSF();
  }
}

class SchoolGuideWidget extends StatelessWidget {
  String Guideline;


  SchoolGuideWidget({this.Guideline});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
      child: Material(
        color: Color(0xFF5FBDFC),
        elevation: 5.0,
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: EdgeInsets.all(5),


        child: Center(child: Text(Guideline,textAlign: TextAlign.center,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white),)),
        ),
      ),
    );
  }
}
