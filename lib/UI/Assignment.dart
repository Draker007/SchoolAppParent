import 'dart:convert';
import 'package:flutterchalkparent/Responses/AssignmentResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
Color pagetheme = Color(0xFFFF4F79);
class Assignment extends StatefulWidget {
  static const String id = 'Assignment';
  String ParentID,Student_ID,Class_ID;
  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  var loginResponse;
  static AssignmentResponse assignmentResponse;
  List <Widget> widget_items  = new List();
  Widget _widget;

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        body: Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              AppBaar(name: "Assignment", ImagePath: "Images/newassigment.png",
                Themecolor: pagetheme,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      height:MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      child:_widget ,
                    ),
                  ],
                ),
              ),
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

  void getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String ParentID = prefs.getString('ParentID');
    String student =prefs.getString('Student_ID');
    String ClassID = prefs.getString('Class_ID');
    fetchAssignmentData(ParentID,student,ClassID);

  }

  fetchAssignmentData(String ParentID,String Student_ID,String Class_ID ) async {

    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL+Constant.getAssignment,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    assignmentResponse = AssignmentResponse.fromJson(decodedValue);
    print("Valuee : ${AssignmentResponse}");

    if(assignmentResponse.Status_Response == '200'){

      for(int i = 0 ; i<assignmentResponse.student_assignment_response.length;i++){
        if(assignmentResponse.student_assignment_response[i].Status_ID == '1'){
          widget_items.add(AssignmentWidget(date:assignmentResponse.student_assignment_response[i].Submission_date ,
            subject: assignmentResponse.student_assignment_response[i].Subject_Name,
            assignment: assignmentResponse.student_assignment_response[i].Assignments,
          ));
        }
      }
      setState(() {
        _widget=Swiper(
          itemBuilder: (BuildContext context, int index) {
            return widget_items[index];
          },
//                        pagination: new SwiperPagination(),

          loop: false,
          autoplayDisableOnInteraction:true ,
          itemCount: widget_items.length,
          itemWidth: MediaQuery.of(context).size.width-75,
          viewportFraction: 0.8,
          scale: 1,
          layout: SwiperLayout.STACK,
        );
      });



    }else{
          setState(() {
            _widget=Center(child: Text('No Assignment Found'),);
          });


    }
  }

}



class AssignmentWidget extends StatelessWidget {
String date,subject,assignment;


AssignmentWidget({this.date, this.subject, this.assignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width-75,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 25,bottom: 15),
              child: DottedBorder(

                borderType: BorderType.RRect,
                radius: Radius.circular(12),

                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    color: Colors.white,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(padding:EdgeInsets.all(10),
                          width:MediaQuery.of(context).size.width-75,
                          child: Text(assignment
                            ,overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                          style:  TextStyle( fontFamily: 'RobotoMono',fontSize: 16,color:Color(0xFF7B7B7B) ),),
                        ),
                        Text('Submission Date:$date',
                        style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.blue,fontSize: 16),)
                      ],
                    ),

                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width/2,
                decoration: new BoxDecoration(

                  color: pagetheme,
                  borderRadius: new BorderRadius.all(Radius.circular(25),),

                ),padding: EdgeInsets.all(5),
                child: Center(child: Text(subject,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



