import 'dart:convert';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/Exam_Subject_Response.dart';
import 'package:flutterchalkparent/Responses/Exams_Response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Color pagetheme = Color(0xFFE81A13);

class Exams extends StatefulWidget {
  static const String id = "Exams";
  @override
  _ExamsState createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  Exam_Subject_Response exam_Subject_Response;
  Exams_Response exams_Response;
  List<Widget> Exams_widget_items = new List();
  List<String> Exams_ID = new List();
  Widget _widget = Container();

  List<Widget> ExamsSubjects = new List();
  Widget _Subjectswidget = Container();

  List<Widget> ExamSllyabuss = new List();
  Widget _Slaybusswidget = Container();

  static String ParentID,student, ClassID;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              AppBaar(
                name: "Exams",
                ImagePath: "Images/newexams.png",
                Themecolor: pagetheme,
              ),
              Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(15.0),
                      width: (MediaQuery.of(context).size.width),
                      height: (MediaQuery.of(context).size.height / 2),
                      child: Material(
                        elevation: 4,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width:
                                MediaQuery.of(context).size.width - 100,
                            child: _widget,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                "Date",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.blue),
                              )),
                              Expanded(
                                  child: Text(
                                "Subject",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.blue),
                              )),
                              Expanded(
                                  child: Text(
                                "Max. Marks",
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.blue),
                              )),
                            ],
                          ),
                          Expanded(
                              child: Container(
                            child: ListView(
                              children: <Widget>[
                                _Subjectswidget
                              ],
                            ),
                          ))
                        ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      child:_Slaybusswidget,
                    ),
                    SizedBox(
                      height: 1,
                    )
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
      ParentID = prefs.getString('ParentID');
      student = prefs.getString('Student_ID');
      ClassID = prefs.getString('Class_ID');

    fetchExamData(ParentID, student, ClassID);
  }

  fetchExamSubjecData(String ParentID, String Student_ID, String Class_ID,
      String examsID) async {
    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,
      'Exams_ID': examsID,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL + Constant.getExamSubjects,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    exam_Subject_Response = Exam_Subject_Response.fromJson(decodedValue);
    print("Valuee : ${exam_Subject_Response}");
    ExamsSubjects.clear();
    ExamSllyabuss.clear();
    int total = 0;
    ExamsSubjects.add(SizedBox(
      height: 10,
    ),);
    if (exam_Subject_Response.Status_Response == '200') {
      String sllaybus;

      for (int i = 0;
          i < exam_Subject_Response.exams_subjects_response.length;
          i++) {
        String subject="";
        if(exam_Subject_Response.exams_subjects_response[i].Syllabus.trim()==""){
          sllaybus = 'Portion for this subject has not been added, please contact your subject teacher.';
        }else{
          sllaybus =exam_Subject_Response.exams_subjects_response[i].Syllabus;
        }
        if(exam_Subject_Response.exams_subjects_response[i].Subject_label_name.contains(" ")){
          var arr=exam_Subject_Response.exams_subjects_response[i].Subject_label_name.split(' ');
          subject= arr[0].substring(0, 1)+arr[1].substring(0, 1)+"-"+exam_Subject_Response.exams_subjects_response[i].Subject_Name;
        }else{
          subject=exam_Subject_Response.exams_subjects_response[i].Subject_label_name+"-"+exam_Subject_Response.exams_subjects_response[i].Subject_Name;
        }
        ExamsSubjects.add(EnterMarksWidget(date : exam_Subject_Response.exams_subjects_response[i].Exams_Date,
        marks: exam_Subject_Response.exams_subjects_response[i].Exams_Max_Marks,
          Subject: subject ,) );
        ExamSllyabuss.add(ExamSllyabus(Date:exam_Subject_Response.exams_subjects_response[i].Exams_Date ,
          subject: subject,
         sllaybus:sllaybus ,));

      }

      setState(() {
        _Slaybusswidget=  Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ExamSllyabuss[index];
          },
//                        pagination: new SwiperPagination(),

          loop: false,
          autoplayDisableOnInteraction: true,
          itemCount: ExamSllyabuss.length,
          itemWidth: MediaQuery.of(context).size.width - 100,
          viewportFraction: 0.7,
          scale: 0.9,
          layout: SwiperLayout.DEFAULT,
        );
        _Subjectswidget =Column(
          children: ExamsSubjects,
        );
      });
    } else {}
  }

  fetchExamData(String ParentID, String Student_ID, String Class_ID) async {
    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL + Constant.getExamsList,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    exams_Response = Exams_Response.fromJson(decodedValue);
    print("Valuee : ${exams_Response}");
    int total = 0;

    if (exams_Response.Status_Response == '200') {

      for (int i = 0; i < exams_Response.exams_list_response.length; i++) {
        String n1 = exams_Response.exams_list_response[i].Exam_Name;
        var s1 = n1.split(' ');
        Exams_ID.add(exams_Response.exams_list_response[i].Exams_ID);

        if(i==0){
          Exams_widget_items.add(
            ExamsTitleWidget(
                onPressed:(){
                  colorchangfunction(i,exams_Response);
                },
                keys:i,
              colorss: Colors.red,
                exam: s1[0].substring(0, 1).toUpperCase() +
                    " " +
                    s1[1].substring(0, 1).toUpperCase()),


          );
        }else{
          Exams_widget_items.add(
            ExamsTitleWidget(
                onPressed:(){
                  colorchangfunction(i,exams_Response);
                },
                keys:i,
                colorss: Colors.grey[200],
                exam: s1[0].substring(0, 1).toUpperCase() +
                    " " +
                    s1[1].substring(0, 1).toUpperCase()),
          );
        }

      }

      setState(() {
        _widget = Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: Exams_widget_items);
      });
      fetchExamSubjecData(ParentID, Student_ID, Class_ID,
          exams_Response.exams_list_response[0].Exams_ID);
    } else {}
  }
  void colorchangfunction(int keys, Exams_Response exams_response) {
    for(int i=0;i<Exams_widget_items.length;i++){

      String n1 = exams_Response.exams_list_response[i].Exam_Name;
      var s1 = n1.split(' ');
      if(i==keys){
        Exams_widget_items[i]=  ExamsTitleWidget(
            onPressed:(){
              colorchangfunction(i,exams_Response);
            },
            keys:i,
            colorss: Colors.red,
            exam: s1[0].substring(0, 1).toUpperCase() +
                " " +
                s1[1].substring(0, 1).toUpperCase());
      }else{
        Exams_widget_items[i]=  ExamsTitleWidget(

    onPressed:(){
    colorchangfunction(i,exams_Response);
    },
    keys:i,
    colorss: Colors.grey[200],
    exam: s1[0].substring(0, 1).toUpperCase() +
    " " +
    s1[1].substring(0, 1).toUpperCase());
      }
    }

    setState(() {
      _widget = Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
          children: Exams_widget_items);
    });
    fetchExamSubjecData(ParentID, student, ClassID,
        exams_Response.exams_list_response[keys].Exams_ID);
  }



}






class EnterMarksWidget extends StatelessWidget {
  String date,marks,Subject;


  EnterMarksWidget({this.date, this.marks, this.Subject});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Text(
              date,
              style: TextStyle(
                  fontFamily: 'RobotoMono',
                  fontSize: 12,
                  color: Color(0xFF7B7B7B)),
            )),
            Expanded(
                child: Text(Subject,
                    style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 12,
                        color: Color(0xFF7B7B7B)))),
            Expanded(
                child: Text(marks,
                    style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 12,
                        color: Color(0xFF7B7B7B)))),
          ],
        ),
        Container(
          height: 0.5,
          color: Color(0xFF9A9A9A),
        )
      ],
    );
  }
}




class ExamsTitleWidget extends StatelessWidget {
  String exam;
  Color colorss;
  int keys;
  Function onPressed;


  ExamsTitleWidget({this.exam, this.colorss ,this.keys,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: colorss,
            border: Border.all(
              color: colorss,
            ),
            borderRadius: BorderRadius.all(Radius.circular(35))),
        child: Center(
            child: Text(
          exam,
        )),
      ),
    );
  }


}





//Slaybuss
class ExamSllyabus extends StatelessWidget {

  String sllaybus,subject,Date;


  ExamSllyabus({this.sllaybus, this.subject, this.Date});

  @override
  Widget build(BuildContext context) {
    return Container(


      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width-100),
            child: Padding(
              padding: EdgeInsets.only(top: 25, bottom: 15),
              child: DottedBorder(
                borderType: BorderType.RRect,

                radius: Radius.circular(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    width: (MediaQuery.of(context).size.width-100),
                    color: Colors.white,
                    padding: EdgeInsets.all(5),
                    child: Column(

                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            subject,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'RobotoMono',
                                color: Colors.blue,
                                fontSize: 14),
                            maxLines: 10,
                          ),
                        ),
                        Text(
                            sllaybus,
                            style: TextStyle(
                                fontFamily: 'RobotoMono',
                                fontSize: 12,
                                color: Color(0xFF7B7B7B)))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: new BoxDecoration(
                  color: pagetheme,
                  borderRadius: new BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                padding: EdgeInsets.all(5),
                child: Center(
                    child: Text(Date,
                        style: TextStyle(
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
