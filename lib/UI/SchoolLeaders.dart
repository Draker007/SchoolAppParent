import 'dart:convert';
import 'package:flutterchalkparent/Responses/SchoolLeadersResponse.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SchoolLeaders extends StatefulWidget {
  static const String id = 'SchoolLeaders';
  @override
  _SchoolLeadersState createState() => _SchoolLeadersState();
}

class _SchoolLeadersState extends State<SchoolLeaders> {

  @override
  void initState() {
    getStringValuesSF();
  }
  Color pagetheme = Color(0xFF7DDD00);
  static SchoolLeadersResponse schoolLeadersResponse;
  List <Widget> widget_items  = new List();
  Widget _widget=Container( );
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            AppBaar(name: "School Leaders",ImagePath: 'Images/newschoolleader.png',Themecolor: pagetheme,),
            Expanded(
              child: Container(

                child:_widget
              ),
            )
          ],
        ),
      ),
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

    var res = await http.post(Constant.BASE_URL+Constant.getLeaders,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    schoolLeadersResponse = SchoolLeadersResponse.fromJson(decodedValue);
    print("Valuee : ${schoolLeadersResponse.Student_leaderinfo_response}");

    if(schoolLeadersResponse.Status_Response == '200'){

      for(int i = 0 ; i<schoolLeadersResponse.Student_leaderinfo_response.length;i++){
        if(schoolLeadersResponse.Student_leaderinfo_response[i].Status_ID == '1'){
          widget_items.add(SchoolLeadersWidget(name: schoolLeadersResponse.Student_leaderinfo_response[i].Student_Name,
          classs: schoolLeadersResponse.Student_leaderinfo_response[i].Class_number+' '+schoolLeadersResponse.Student_leaderinfo_response[i].Section_Name,
              title:schoolLeadersResponse.Student_leaderinfo_response[i].Special_title,
          image: schoolLeadersResponse.Student_leaderinfo_response[i].Student_Image_Name,));
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


}











class SchoolLeadersWidget extends StatelessWidget {
  final String name , classs, title ,image;

  SchoolLeadersWidget({this.name, this.classs, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
    height: 100,

      child: Material(
        borderRadius: BorderRadius.circular(5.0),
        elevation: 3.0,
        child: Container(
          child: Stack(
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0)),

                  ),
                  child: Center(child: Text(title,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white,fontSize: 16),)),
                  ),
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.blue,
                ),
                Container(
                  height: 100,
                  width: 50,
                  color: Colors.white,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0))
                    ),
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Text(name,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.grey[700],fontSize: 16),),
                        SizedBox(height: 5,),
                        Text(classs,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.blue,fontSize: 16),),

                      ],
                    )),

                  ),
                )
              ],),
              Center(
                child: Container(

                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                Constant.DOWNLOADURL+image)))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
