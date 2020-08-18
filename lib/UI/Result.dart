 import 'dart:convert';
import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/Exams_Response.dart';
import 'package:flutterchalkparent/Responses/Result_Response.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
 import 'package:http/http.dart' as http;

List<String> subjects = new List();
 List<String> ExamListGraph = new List();
Color pagetheme = Color(0xFF049A51);
 List<Color> gradientColors = [
   const Color(0xffffffff),
   const Color(0xffffffff),
 ];
 List<Color> gradientColor2 = [
   const Color(0xff23b6e6),
   const Color(0xff02d39a),
 ];
 List<Color> gradientColor1 = [
   const Color(0xffffffff),
   const Color(0xffffffff),
 ];

class Result extends StatefulWidget {
  static const String id = 'Result';


  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
//  LineChart lineChart = LineChart.fromDateTimeMaps([line1, line2], [Colors.green, Colors.blue]);


  bool showAvg = false;
  Exams_Response exams_Response ;
String ParentID, student, ClassID,SectionID,Percentt = '0 %';
  List<Widget> Exams_widget_items = new List();
  List<String> Exams_ID = new List();
  Widget _widget = Container();
  List<Widget> Exams_Marks = new List();
  Widget _Markswidget = Container();
  List<Widget> Exams_Marks2 = new List();
  List<String> ExamName = new List();
  List<String> subject = new List();
  Widget _dropdown = Container();
  Widget graph = Container();
  int first =1;
bool _saving=false;
  List<String> subjectID = new List();
  String dropdownValue ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Scaffold(
          body: Container(
            child: Column(
              children: <Widget>[
                AppBaar(name: 'Result',ImagePath: "Images/newresults.png",Themecolor: pagetheme,),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(14),
                          height: 50,
                          child: Column(
                            children: <Widget>[
                              Container(

                                child: _widget,

                              ),
                              Container(
                                height: 0.5,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height/3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  height:150,
                                  child:_Markswidget,
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(width: 20,),
                                      Text("Total Percentage  "),
                                      Container(
                                        height: 40,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(

                                            width: 1.0,
                                            color: Colors.grey,
                                          ),


                                        ),
                                        child: Center(child: Text(Percentt,style:  TextStyle( fontFamily: 'RobotoMono',fontWeight: FontWeight.bold,color: Colors.blue),)),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            )

                        ),
                        Container(padding: EdgeInsets.all(10),

                          child:  Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      spreadRadius: 0.5,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.only(left: 10.0),
                                width: MediaQuery.of(context).size.width/2,
                                child: DropdownButton(
                                  isExpanded: true,
                                  items:subject
                                      .map((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),

                                    );
                                  }).toList(),
                                  value: dropdownValue,
                                  onChanged: (value) {
                                    setState(() {


                                      int i = subject.indexOf(value);
                                      print('---------------');
                                      print(i );
                                      dropdownValue = value;
                                      print(dropdownValue );
                                       fetchGraphData(ParentID,student,ClassID,subjectID[i],subject[i]);


                                    });
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  AspectRatio(
                                    aspectRatio: 1.70,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                          color: Color(0xFF049A51)),
                                      child: Padding(
                                          padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 35, bottom: 12),
                                          child:graph
                                      ),
                                    ),
                                  ),

                                ],
                              ),
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

    SectionID = prefs.getString('Section_ID');
    fetchExamTitle(ParentID, student, ClassID);

  }

  fetchExamTitle(String ParentID, String Student_ID, String Class_ID) async {
    setState(() {
      _saving=true;
    });
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
        ExamName.add(s1[0].substring(0, 1).toUpperCase() +
            " " +
            s1[1].substring(0, 1).toUpperCase());

        if(i==0){

          Exams_widget_items.add(
            ResultExamTag(
                onPressed:(){
                  colorchangfunction(i,exams_Response);
                },

                colors: Colors.blue,
                exam: s1[0].substring(0, 1).toUpperCase() +
                    " " +
                    s1[1].substring(0, 1).toUpperCase()),


          );
        }else{
          Exams_widget_items.add(
            ResultExamTag(
                onPressed:(){
                  colorchangfunction(i,exams_Response);
                },

                colors: Colors.white,
                exam: s1[0].substring(0, 1).toUpperCase() +
                    " " +
                    s1[1].substring(0, 1).toUpperCase()),
          );
        }

      }

      setState(() {
        _saving=false;
        _widget = Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: Exams_widget_items );
      });

      fetchResultData(ParentID,student,ClassID,exams_Response.exams_list_response[0].Exams_ID);
    } else {
      setState(() {
        _saving=false;
      });
    }
  }

  void colorchangfunction(int keys, Exams_Response exams_response) {
    for(int i=0;i<Exams_widget_items.length;i++){

      String n1 = exams_Response.exams_list_response[i].Exam_Name;
      var s1 = n1.split(' ');
      if(i==keys){
        Exams_widget_items[i]=  ResultExamTag(
            onPressed:(){
              colorchangfunction(i,exams_Response);
            },

            colors: Colors.blue,
            exam: s1[0].substring(0, 1).toUpperCase() +
                " " +
                s1[1].substring(0, 1).toUpperCase());


      }else{
        Exams_widget_items[i]=  ResultExamTag(
            onPressed:(){
              colorchangfunction(i,exams_Response);
            },

            colors: Colors.white,
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
    fetchResultData(ParentID,student,ClassID,exams_Response.exams_list_response[keys].Exams_ID);
  }



  fetchGraphData(String ParentID, String Student_ID, String Class_ID,String SubID, String subject
       ) async {
setState(() {
  _saving=true;
});
    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,
      'Subject_ID': SubID,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL + Constant.getGraphResult,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var result_Response = Result_Response.fromJson(decodedValue);
    print("Valuee : ${Result_Response}");

    if (result_Response.Status_Response == '200') {
         double x1=0,y1=0,x2=0,y2=0,x3=0,y3=0,x4=0,y4=0,x5=0,y5=0,x6=0,y6=0;
      for (int i = 0; i < result_Response.results_response.length; i++) {
        double percentage = double.parse(((int.parse(result_Response.results_response[i].Obtained_Marks) * 100) / int.parse(result_Response.results_response[i].Exams_Max_Marks)).toStringAsFixed(2)) ;

        switch(i){
          case 0:
            x1=0;
            y1=percentage;
            break;
          case 1:
            x2=1;
            y2=percentage;
            break;
          case 2:
            x3=2;
            y3=percentage;
            break;
          case 3:
            x4=3;
            y4=percentage;
            break;
          case 4:
            x5=4;
            y5=percentage;
            break;
          case 5:
            x6=5;
            y6=percentage;
            break;
       }
       setState(() {
         _saving=false;
      graph = LineChart(
         mainData(x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,ExamName),
      );
       });
      }   
    } else {
      setState(() {
        _saving=false;
      });
    }
  }

    fetchResultData(String parentID, String student, String classID, String exams_id) async{
      setState(() {
        _saving=true;
        _Markswidget=Container();


      });

      Map data = {
        'docket': Constant.docket,
        'Parent_ID': ParentID,
        'Student_ID': student,
        'Exams_ID': exams_id,
      };
      //encode Map to JSON
      var body = json.encode(data);

      var res = await http.post(Constant.BASE_URL + Constant.getResults_student,
          headers: {"Content-Type": "application/json"}, body: body);
      print("${res.statusCode}");
      print("${res.body}");
      var decodedValue = jsonDecode(res.body);

      var result_Response = Result_Response.fromJson(decodedValue);
      print("Valuee : ${Result_Response}");
      Exams_Marks.clear();
      if (result_Response.Status_Response == '200') {
        int totalObtained = 0, totalMaxMarks = 0;
        for (int i = 0; i < result_Response.results_response.length; i++) {
          if(first==1){

              subject.add(result_Response.results_response[i].Sub_Subject_Name);
              subjectID.add(result_Response.results_response[i].Sub_Subject_ID);


          }

          totalObtained = totalObtained +
              int.parse(result_Response.results_response[i].Obtained_Marks);
          totalMaxMarks = totalMaxMarks +
              int.parse(result_Response.results_response[i].Exams_Max_Marks);
          double percentage = ((int.parse(result_Response.results_response[i].Obtained_Marks) * 100) / int.parse(result_Response.results_response[i].Exams_Max_Marks));
          Exams_Marks.add(ResultShowMarks(Subject: result_Response.results_response[i].Sub_Subject_Name,

          ObtMarks: result_Response.results_response[i].Obtained_Marks,
          MaxMarks: result_Response.results_response[i].Exams_Max_Marks,
          Percent: percentage.toStringAsFixed(1),));
        }
        if(first==1){
          dropdownValue = subject[0];
          fetchGraphData(ParentID,student,ClassID,subjectID[0],dropdownValue);
          setState(() {

            _dropdown = Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(

                        value: dropdownValue,
                        isDense: true,
                        onChanged: (newValue) {
                          setState(() {
                            int i = subject.indexOf(newValue );
                            print('---------------');
                            print(i );
                            dropdownValue = newValue;
                            print(dropdownValue );
                             fetchGraphData(ParentID,student,ClassID,subjectID[i],newValue);

                          });
                          print(dropdownValue);
                        },
                        items: subject.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            );

            _saving=false;

          });
          first=2;
        }
        double percentagee = ((totalObtained * 100) / totalMaxMarks);


        setState(() {
          Percentt=percentagee.toStringAsFixed(1)+'%';
          _Markswidget=ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children:  Exams_Marks  );
          _saving=false;

        });
      } else {
        setState(() {
          _Markswidget=ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children:  Exams_Marks  );

          _saving=false;
        });
      }
    }

}
















class ResultShowMarks extends StatelessWidget {
String Subject,ObtMarks,MaxMarks,Percent;


ResultShowMarks({this.Subject, this.ObtMarks, this.MaxMarks, this.Percent });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

        width:150,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(Subject,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.blue),),
                SizedBox(height: 5,),
                Container(

                  height: 80,
                  width: 110,
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: pagetheme,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: <Widget>[
                        Container(
                          height: 100,
                          width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(10) ,bottomLeft: Radius.circular(10)),
                        ),

                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(ObtMarks),

                              Container(
                                height: 1,
                                width: 50,
                                color: Colors.grey,
                              ),
                              Text(MaxMarks),
                            ],
                          ) ,
                        ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("%",style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white,fontSize:16,fontWeight: FontWeight.bold),),
                                Text(Percent,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white,fontSize:12,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}















class ResultExamTag extends StatelessWidget {
 String exam;
 Function onPressed;
 Color colors;

 ResultExamTag({this.exam, this.onPressed, this.colors});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Column(
          children: <Widget>[
            Text(exam),
            Container(
              height: 3,
              width: 50,
              color: colors,

            )
          ],
        ),
      ),
    );
  }
}






 LineChartData mainData(double x1,double y1,double x2,double y2,double x3,double y3,double x4,double y4,double x5,double y5,double x6,double y6,List<String> xaxis) {




   return LineChartData(
     gridData: FlGridData(
       show: true,
       drawVerticalLine: true,
       getDrawingHorizontalLine: (value) {
         return FlLine(
           color: Colors.grey,
           strokeWidth: 0.2,
         );
       },
       getDrawingVerticalLine: (value) {
         return FlLine(
           color: Colors.grey,
           strokeWidth: 0.2,
         );
       },
     ),
     titlesData: FlTitlesData(
       show: true,
       bottomTitles: SideTitles(
         showTitles: true,
         reservedSize: 22,
         textStyle:
         const  TextStyle( fontFamily: 'RobotoMono',color: Color(0xffffffff) , fontSize: 12),
         getTitles: (value) {
           switch (value.toInt()) {
             case 0:
               if(xaxis.length>0){
                 return xaxis[0];
               }else{
                 return '';
               }
               break;
             case 1:
               if(xaxis.length>1){
                 return xaxis[1];
               }else{
                 return '';
               }
               break;
             case 2:
               if(xaxis.length>2){
                 return xaxis[2];
               }else{
                 return '';
               }
               break;
             case 3:
               if(xaxis.length>3){
                 return xaxis[3];
               }else{
           return '';
           }
           break;
             case 4:
               if(xaxis.length>4){
                 return xaxis[4];
               }else{
                 return '';
               }
               break;
             case 5:
               if(xaxis.length>5){
                 return xaxis[5];
               }else{
                 return '';
               }
               break;
           }
           return '';
         },
         margin: 8,
       ),
       leftTitles: SideTitles(
         showTitles: true,
         textStyle: const  TextStyle( fontFamily: 'RobotoMono',
           color: Color(0xffffffff),

           fontSize: 12,
         ),
         getTitles: (value) {
           switch (value.toInt()) {
             case 20:
               return '20';
             case 40:
               return '40';
             case 60:
               return '60';
             case 80:
               return '80';
             case 100:
               return '100';
           }
           return '';
         },
         reservedSize: 28,
         margin: 12,
       ),
     ),
     borderData:
     FlBorderData(show: true, border: Border.all(color: const Color(0xffffffff), width: 0.5)),
     minX: 0,
     maxX: 5,
     minY: 0,
     maxY: 100,
     lineBarsData: [
       LineChartBarData(
         spots: [

           FlSpot(x1, y1),
           FlSpot(x2, y2),
           FlSpot(x3, y3),
           FlSpot(x4, y4),
           FlSpot(x5, y5),
           FlSpot(x6, y6),

         ],
         isCurved: false,
         colors: gradientColors,
         barWidth: 2,
         isStrokeCapRound: true,

         dotData: FlDotData(

           show: true,
//            checkToShowDot:
//            CheckToShowDot = bool Function(spots, spots);



         ),
         belowBarData: BarAreaData(
           show: true,
           colors: gradientColor2.map((color) => color.withOpacity(0.3)).toList(),
         ),
       ),
     ],

   );
 }

 LineChartData avgData() {
   return LineChartData(
     lineTouchData: LineTouchData(enabled: false),
     gridData: FlGridData(
       show: true,
       drawHorizontalLine: true,
       getDrawingVerticalLine: (value) {
         return FlLine(
           color: const Color(0xff37434d),
           strokeWidth: 1,
         );
       },
       getDrawingHorizontalLine: (value) {
         return FlLine(
           color: const Color(0xff37434d),
           strokeWidth: 1,
         );
       },
     ),
     titlesData: FlTitlesData(
       show: true,
       bottomTitles: SideTitles(
         showTitles: true,
         reservedSize: 22,
         textStyle:
         const  TextStyle( fontFamily: 'RobotoMono',color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 16),
         getTitles: (value) {
           switch (value.toInt()) {
             case 2:
               return 'MAR';
             case 5:
               return 'JUN';
             case 8:
               return 'SEP';
           }
           return '';
         },
         margin: 8,
       ),
       leftTitles: SideTitles(
         showTitles: true,
         textStyle: const  TextStyle( fontFamily: 'RobotoMono',
           color: Color(0xffffffff),
           fontWeight: FontWeight.bold,
           fontSize: 15,
         ),
         getTitles: (value) {
           switch (value.toInt()) {
             case 1:
               return '10k';
             case 3:
               return '30k';
             case 5:
               return '50k';
           }
           return '';
         },
         reservedSize: 28,
         margin: 12,
       ),
     ),
     borderData:
     FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
     minX: 0,
     maxX: 11,
     minY: 0,
     maxY: 6,
     lineBarsData: [
       LineChartBarData(
         spots: [
           FlSpot(0, 3.44),
           FlSpot(2.6, 3.44),
           FlSpot(4.9, 3.44),
           FlSpot(6.8, 3.44),
           FlSpot(8, 3.44),
           FlSpot(9.5, 3.44),
           FlSpot(11, 3.44),
         ],
         isCurved: true,
         colors: [
           ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
           ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
         ],
         barWidth: 5,
         isStrokeCapRound: true,
         dotData: FlDotData(
           show: false,
         ),
         belowBarData: BarAreaData(show: true, colors: [
           ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
           ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
         ]),
       ),
     ],
   );
 }