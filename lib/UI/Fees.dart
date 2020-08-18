import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/FeesResponse.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Fees extends StatefulWidget {
  static const String id = 'Fees';
  @override
  _FeesState createState() => _FeesState();
}

class _FeesState extends State<Fees> {
  var loginResponse;
  static FeesResponse feesResponse;
  static int finalamnt=0;
  List <Widget> widget_items  = new List();
  Widget _widget= Container();
  static String classs="0";
  bool _saving = false;

  @override
  void initState() {
    getStringValuesSF();
  }

  Color pagetheme = Color(0xFF8BF500);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  ModalProgressHUD(
        inAsyncCall: _saving ,
        child: Scaffold(
          body: Container(

            child: Column(
              children: <Widget>[
                AppBaar(name: 'Fees',ImagePath: 'Images/newfee.png',Themecolor: pagetheme,),
                Container(
//      margin: EdgeInsets.only(top: 5,left: 10.0,right: 10.0),
                  child: Expanded(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 10,),
                      Text("Class Grade-$classs fee structure ",style:  TextStyle( fontFamily: 'RobotoMono', fontWeight: FontWeight.bold,color:Colors.blue,),),
                                SizedBox(height: 20,),
                                  _widget,
                                  Material(
                                    elevation: 10.0,
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: pagetheme,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 3.0,left: 2.0,right: 2.0,top:3.0),

                                      color: pagetheme,
                                      child: Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            margin :EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                                            child: Text("Total fee balance",style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white),),
                                          ),
                                          Container(
                                            margin :EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),

                                            child: Text("\$ $finalamnt",style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.white),),
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
                      ],
                    ),
                  ),
                ),
              ],
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
    fetchHomeWorkData(ParentID,student,ClassID);

  }

  fetchHomeWorkData(String ParentID,String Student_ID,String Class_ID ) async {
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

    var res = await http.post(Constant.BASE_URL+Constant.getFees,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    feesResponse = FeesResponse.fromJson(decodedValue);
    print("Valuee : ${FeesResponse}");
    int total=0;

    if(feesResponse.Status_Response == '200'){

      for(int i = 0 ; i<feesResponse.fees_class_response.length;i++){
        if(feesResponse.fees_class_response[i].Status_ID == '1'){

           widget_items.add( FeesWidget(Title: feesResponse.fees_class_response[i].Fee_name,value: feesResponse.fees_class_response[i].Fee_amount,),);
           total = total+ int.parse(feesResponse.fees_class_response[i].Fee_amount);
        }
      }
      setState(() {
        _saving=false;
        finalamnt=total;
        classs=Class_ID;
      _widget = Column(children: widget_items);
      });



    }else{
      setState(() {
        _saving=false;
        _widget=Center(child: Text('No Fees Found'),);
      });


    }
  }

}



class FeesWidget extends StatelessWidget {
  final String Title , value;

  FeesWidget({this.Title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin :EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            child: Text(Title),
          ),
          Container(
            margin :EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),

            child: Text('\$ $value'),
          )
        ],
      ),
    );
  }
}
