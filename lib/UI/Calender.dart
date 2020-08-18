import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Resources/SpecialCharacters.dart';
import 'package:flutterchalkparent/Responses/Events_Response.dart';
import 'package:flutterchalkparent/Responses/HolidaysList_Response.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Color pagetheme = Color(0xFFFAA613);
List <Widget> event_widget_items  = new List();
List <Widget> widget_items  = new List();
Widget Holiday_widget=Container( );
Widget Events_widget=Container( );
class Calender extends StatefulWidget {
  static const String id = "Calender";



  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  static Events_Response events_Response;
  static HolidaysList_Response holidaysList_Response;
  bool _saving = false;
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Events',
    ),
    Tab(text: 'Holidays'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _saving ,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(150.0),
              child: AppBar(
                backgroundColor: Colors.white,
                flexibleSpace: Container(
                  height: 100,
                  color: Colors.white,
                  child: AppBaar(
                    name: "Calendar",
                    ImagePath: "Images/newcalendar.png",
                    Themecolor: pagetheme,
                  ),
                ),
                bottom: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.blue,
                  indicatorColor: pagetheme,
                  indicatorWeight: 5.0,
                  tabs: myTabs,
                ),
              ),
            ),
            body: TabBarView(
              children: myTabs.map((Tab tab) {
                final String label = tab.text.toLowerCase();
                return CallTabs(label);
              }).toList(),
            ),
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
    String Section_ID = prefs.getString('Section_ID');
    setState(() {
      _saving = true;
    });
    fetchEventsData(ParentID,student,ClassID,Section_ID);
    fetchHolidaysData(ParentID,student,ClassID,Section_ID);

  }
  fetchHolidaysData(String ParentID,String Student_ID,String Class_ID,String Section_ID ) async {

    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,

    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL+Constant.getHolidays,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    holidaysList_Response = HolidaysList_Response.fromJson(decodedValue);
   // print("Valuee : ${holidaysList_Response.Student_leaderinfo_response}");
    widget_items.clear();
    if(holidaysList_Response.Status_Response == '200'){

      for(int i = 0 ; i<holidaysList_Response.holidays_response.length;i++){
        String str = holidaysList_Response.holidays_response[i].Holiday_Date;

        //split string
        var arr = str.split('-');
        var  month =   arr[1] ;
        var date = arr[2];
        String Month = "Jan";

        switch (month){
          case '1':
            Month = "Jan";
            break;
          case '2':
            Month = "Feb";
            break;
          case '3':
            Month = "Mar";
            break;
          case '4':
            Month = "Apr";
            break;
          case '5':
            Month = "May";
            break;
          case '6':
            Month = "Jun";
            break;
          case '7':
            Month = "Jul";
            break;
          case '8':
            Month = "Aug";
            break;
          case '9':
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

          widget_items.add(HolidayWidget(details:SpecialCharacters.getCurrectString(holidaysList_Response.holidays_response[i].Holiday_Info)  ,
          title:  SpecialCharacters.getCurrectString(holidaysList_Response.holidays_response[i].Holiday_Name) ,
          date:date,
          month:  Month));

      }

      setState(() {
        Holiday_widget= ListView(
          children:  widget_items,
        );
        _saving = false;
      });


    }else{

      setState(() {
        Holiday_widget=Container(child: Center(child: Text('No Holiday Found'),));
        _saving = false;
      });




    }
  }


  fetchEventsData(String ParentID,String Student_ID,String Class_ID,String Section_ID ) async {

    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,

    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL+Constant.getEvents,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    events_Response = Events_Response.fromJson(decodedValue);
    // print("Valuee : ${holidaysList_Response.Student_leaderinfo_response}");
    event_widget_items.clear();
    if(events_Response.Status_Response == '200'){

      for(int i = 0 ; i<events_Response.student_event_response.length;i++){
        String str = events_Response.student_event_response[i].Event_Date;

        //split string
        var arr = str.split('-');
        var  month =   arr[1] ;
        var date = arr[2];
        String Month = "Jan";

        switch (month){
          case '1':
            Month = "Jan";
            break;
          case '2':
            Month = "Feb";
            break;
          case '3':
            Month = "Mar";
            break;
          case '4':
            Month = "Apr";
            break;
          case '5':
            Month = "May";
            break;
          case '6':
            Month = "Jun";
            break;
          case '7':
            Month = "Jul";
            break;
          case '8':
            Month = "Aug";
            break;
          case '9':
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

        event_widget_items.add(EventsWidget(details:SpecialCharacters.getCurrectString(events_Response.student_event_response[i].Event_Info) ,
            title: SpecialCharacters.getCurrectString(events_Response.student_event_response[i].Event_Name),
            date:date,
            month:  Month,
          fulldate: str,
        image:events_Response.student_event_response[i].Event_Image ,));

      }

      setState(() {
        Events_widget= ListView(
          children:  event_widget_items,
        );
        _saving = false;
      });


    }else{

      setState(() {
        Events_widget=Container(child: Center(child: Text('No Event Found'),));
        _saving = false;
      });




    }
  }

  @override
  void initState() {
    getStringValuesSF();
  }
}



Widget CallTabs(String label) {
  if(label=='events' ){
    return Container(
      child: Events_widget
    );
  }else{
    return Container(
      child:Holiday_widget,
    );
  }



}


class EventsWidget extends StatelessWidget {
  String month,date,title,details,image,fulldate;


  EventsWidget({this.month, this.date, this.title, this.details, this.fulldate, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showDialog(

                  context: context, builder: (context) => CustomDailog(
                date: fulldate,
                titles: title,
                details: details,
                image: image,
              ));
            },
            child: Container(
              margin: EdgeInsets.only(left:5.0),
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Container(
                      height: 70,
                      width: 70,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(left: 6),
                        decoration: BoxDecoration(
                          color: pagetheme,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      month,
                                      style:  TextStyle( fontFamily: 'RobotoMono',fontSize: 14,color: Colors.white),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Align(
                                    alignment: Alignment.centerRight,child: Text(date, style:  TextStyle( fontSize: 14,fontFamily: 'RobotoMono',color: Colors.white))),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Text(title,
                              style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.blue)),
                          SizedBox(height: 8,),
                          Container(
                            margin: EdgeInsets.all(6),
                            child: Text(
                              details,
                              softWrap: true, style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.grey), ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 0.5,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

}

class HolidayWidget extends StatelessWidget {
  String month,date,title,details;


  HolidayWidget({this.month, this.date, this.title, this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {

            },
            child: Container(
              margin: EdgeInsets.only(left:5.0),
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    elevation: 5,
                    child: Container(
                      height: 70,
                      width: 70,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.only(left: 6),
                        decoration: BoxDecoration(
                          color: pagetheme,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      month,
                                      style:  TextStyle( fontFamily: 'RobotoMono',fontSize: 14,color: Colors.white),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Align(
                                    alignment: Alignment.centerRight,child: Text(date, style:  TextStyle( fontSize: 14,fontFamily: 'RobotoMono',color: Colors.white))),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Text(title,
                              style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.blue)),
                          SizedBox(height: 8,),
                          Container(
                            margin: EdgeInsets.all(6),
                            child: Text(
                                details,
                                softWrap: true, style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.grey), ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 0.5,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}




class CustomDailog extends StatelessWidget {
  String image,titles,date,details;


  CustomDailog({this.image, this.titles, this.date, this.details});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        backgroundColor: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height/4),
          width: MediaQuery.of(context).size.width - 10,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(
              Radius.circular(25),

            ),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Center(child: Text(titles,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.black,fontWeight: FontWeight.bold),)),
              SizedBox(
                height: 10,
              ),
              Center(child: Text(date,style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.black,fontWeight: FontWeight.bold),)),
              SizedBox(
                height: 10,
              ),
              Center(child: Text(details,style:  TextStyle( fontFamily: 'RobotoMono' , ),textAlign: TextAlign.center,)),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(

                     child: AspectRatio(
                         aspectRatio: 4.3,
                         child: Image.network( Constant.DOWNLOADURL+image)),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.all(
                          Radius.circular(25),

                        ),
                        )),
              )
            ],
          ),
        ));
  }
}
