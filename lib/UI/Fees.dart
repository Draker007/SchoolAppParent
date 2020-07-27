import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';

class Fees extends StatefulWidget {
  static const String id = 'Fees';
  @override
  _FeesState createState() => _FeesState();
}

class _FeesState extends State<Fees> {
  Color pagetheme = Color(0xFF8BF500);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(

          child: Column(
            children: <Widget>[
              AppBaar(name: 'Fee',ImagePath: 'Images/achievement.png',Themecolor: pagetheme,),
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
                                SizedBox(height: 40,),
                    Text("Class V fees structure for new session 2019-2020",style: TextStyle( fontWeight: FontWeight.bold,color:Colors.blue,),),
                                FeesWidget(Title: "Tution Fees",value: "25000",),
                                FeesWidget(Title: "Tution Fees",value: "25000",),
                                FeesWidget(Title: "Tution Fees",value: "25000",),
                                FeesWidget(Title: "Tution Fees",value: "25000",),
                                FeesWidget(Title: "Tution Fees",value: "25000",),
                                FeesWidget(Title: "Tution Fees",value: "25000",),
                                FeesWidget(Title: "Tution Fees",value: "25000",),
                                Material(
                                  elevation: 10.0,
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.green,
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 3.0,left: 2.0,right: 2.0,top:3.0),

                                    color: Colors.green,
                                    child: Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin :EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                                          child: Text("Total fee balance",style: TextStyle(color: Colors.white),),
                                        ),
                                        Container(
                                          margin :EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),

                                          child: Text("\$250000",style: TextStyle(color: Colors.white),),
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
    );
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

            child: Text(value),
          )
        ],
      ),
    );
  }
}
