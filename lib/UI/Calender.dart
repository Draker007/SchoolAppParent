

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
Color pagetheme = Color(0xFFFAA613);
class Calender extends StatelessWidget {

  static const String id = "Calender";
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Events',),
    Tab(text: 'Holidays'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: AppBar(
              backgroundColor: Colors.white,
              flexibleSpace:Container(
              height: 100,
                color: Colors.white,

                child: AppBaar(name: "Calendar",
                  ImagePath: "Images/achievement.png",
                Themecolor: pagetheme,),

              ),

              bottom: TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.blue,
               indicatorColor: pagetheme,
                indicatorWeight:5.0 ,
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
    );
  }
}

Widget CallTabs(String label) {
  return Container(
    child: ListView(
      children: <Widget>[
        CalenderWidget(),
        CalenderWidget(),
        CalenderWidget(),
        CalenderWidget(),
        CalenderWidget(),
        CalenderWidget(),
        CalenderWidget(),
        CalenderWidget(),

      ],
    ),
  );
}

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(
      children: <Widget>[
        Container(margin: EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Material(
              elevation: 5,
                child: Container(
                  height: 60,
                  width: 60,
                  child:Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(left: 6),
                    decoration: BoxDecoration(
                      color: pagetheme,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(5)),


                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Aug',style: TextStyle(color: Colors.white),)),
                          Text('15',style: TextStyle(color: Colors.white))
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Text('Independence Day',style: TextStyle(color: Colors.blue)),
                    Container(
                      child: Text('On the occasion of independence day, all are requested to wear uniform compulsorily  On the occasion of independence day, all are requested to wear uniform compulsorily  On the occasion of independence day, all are requested to wear uniform compulsorily  On the occasion of independence day, all are requested to wear uniform compulsorily.',
                      softWrap: true,
                          textAlign: TextAlign.center),
                    )
                  ],),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey,
        )
      ],
    ),
    );
  }
}