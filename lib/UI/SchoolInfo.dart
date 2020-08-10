import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/AboutSchool_Response.dart';
import 'package:flutterchalkparent/Responses/Events_Response.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


Color pagetheme = Color(0xFF3993DD);
class SchoolInfo extends StatefulWidget {
  static const String id = 'SchoolInfo';

  @override
  _SchoolInfoState createState() => _SchoolInfoState();
}

class _SchoolInfoState extends State<SchoolInfo> {

  String  SchoolInfo="",SchoolImage="",SchoolAddress="",SchoolPhone="",SchoolEmail="";

  static AboutSchool_Response aboutSchool_Response;

  List <Widget> widget_items  = new List();
  Widget _widget= Container();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              AppBaar(name: 'School Info',ImagePath: "Images/ic_school_info.png",Themecolor: pagetheme,),
              Expanded(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
//                             Container(
//                              padding: EdgeInsets.all(5),
//                              height: 220,
//
//                              child: Image.network( Constant.DOWNLOADURL+SchoolImage),
//                            ),
                            Image.network( Constant.DOWNLOADURL+SchoolImage),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(SchoolInfo,style:  TextStyle( fontFamily: 'RobotoMono',color: Color(0xFF7B7B7B)),),
                            ),
                            Container(
                              height: 200,
                              child: _widget
                            ),
                            Container(
                              color: Color(0xFF7B7B7B),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 50,
                                        ),

                                        Text("Contact Details",style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(

                                            decoration: BoxDecoration(

                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                      color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                            ),

                                            child: Icon(Icons.location_on,color: Color(0xFF7B7B7B),)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Text(SchoolAddress,
                                            overflow: TextOverflow.ellipsis,
                                          maxLines: 10,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white),),
                                        ),
                                     SizedBox(
                                       width: MediaQuery.of(context).size.width/3,
                                     )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(

                                            decoration: BoxDecoration(

                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                            ),

                                            child: Icon(Icons.phone,color: Color(0xFF7B7B7B),)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Text(SchoolPhone,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 10,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white),),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width/3,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(

                                            decoration: BoxDecoration(

                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                            ),

                                            child: Icon(Icons.email,color: Color(0xFF7B7B7B),)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Text(SchoolEmail,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 10,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white),),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width/3,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height:5,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  void getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String ParentID = prefs.getString('ParentID');
    String student =prefs.getString('Student_ID');
    String ClassID = prefs.getString('Class_ID');
    fetchSchoolData(ParentID,student,ClassID);

  }

  fetchSchoolData(String ParentID,String Student_ID,String Class_ID ) async {

    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL+Constant.getSchoolInfo,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    aboutSchool_Response = AboutSchool_Response.fromJson(decodedValue);
    print("Valuee : ${aboutSchool_Response}");
    int total=0;

    if(aboutSchool_Response.Status_Response == '200'){
      setState(() {
        SchoolAddress=aboutSchool_Response.about_school_response[0].About_School_Contact_Address;
        SchoolEmail=aboutSchool_Response.about_school_response[0].About_School_Contact_Email;
        SchoolInfo=aboutSchool_Response.about_school_response[0].About_School_Info;
        SchoolImage=aboutSchool_Response.about_school_response[0].About_School_Images;
        SchoolPhone=aboutSchool_Response.about_school_response[0].About_School_Contact_Number;
      });

      for(int i = 0 ; i<aboutSchool_Response.Admin_schoolfacilitylist_response.length;i++){


          widget_items.add(  SchoolInfoImage(
            image:aboutSchool_Response.Admin_schoolfacilitylist_response[i].About_School_Facility_Images ,
            title: aboutSchool_Response.Admin_schoolfacilitylist_response[i].About_School_Facility_Info,
          )  );


      }
      setState(() {

        _widget = ListView(
            scrollDirection: Axis.horizontal,
            children:  widget_items
        ) ;
      });



    }else{
      setState(() {
        _widget=Center( );
      });


    }
  }

  @override
  void initState() {
    getStringValuesSF();
  }
}

class SchoolInfoImage extends StatelessWidget {

  String image,title;


  SchoolInfoImage({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height:180 ,
          width: 280,
//          color: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child:   ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(   Constant.DOWNLOADURL+image,

              fit: BoxFit.cover, ),
          ),
        ),
        Center(child: Text(title))
      ],
    );
  }
}
