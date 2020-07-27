

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';

import 'HomePage.dart';

class  HomeworkPage{
  Color pagetheme = Color(0xFF4E0423);
  Widget getHomeworkPage(BuildContext context){
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body:Column(
        children: <Widget>[
          AppBaar(name: 'HomeWork',ImagePath: "Images/achievement.png",Themecolor: pagetheme,),
          Expanded(
            child: Container(
              child: ListView(
                children: <Widget>[
                  HomeWorkWiget(queryData: queryData),
                  HomeWorkWiget(queryData: queryData),
                  HomeWorkWiget(queryData: queryData),
                  HomeWorkWiget(queryData: queryData),
                  HomeWorkWiget(queryData: queryData),
                  HomeWorkWiget(queryData: queryData),
                  HomeWorkWiget(queryData: queryData),
                  HomeWorkWiget(queryData: queryData),
                  HomeWorkWiget(queryData: queryData),




                ],
              ),
            ),
          )
        ],
      ) ,
    );
  }
}












class HomeWorkWiget extends StatelessWidget {
  const HomeWorkWiget({
    Key key,
    @required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Text("Teacher Name"),
              )),
          Container(
            child: Stack(
              children: <Widget>[
               Container(
                 margin: EdgeInsets.only(left: 40.0,right: 5.0),
                 padding: EdgeInsets.only(top:5.0,bottom: 5.0,right:5.0,left:50),
                 width: queryData.size.width-50,
              height: 100,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: new BorderRadius.all(Radius.circular(10),),

               ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     SizedBox(
                       height: 5.0,
                     ),
                     Text("Subject",style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.blue
                     ),),
                     SizedBox(
                       height: 10.0,
                     ),
                     Text("Homework textashgffjhgjhfgsdjgfjjsdgfhgsdjfgjsdgfkjsdgflhklkhkj  asd asd goueg eojjkefjie iejjfe ",style: TextStyle(color: Colors.grey),),
                     SizedBox(
                       height: 5.0,
                     ),
                   ],
                 ),
               ),
                Positioned(
                  left: 10,
                  top: 20,
                  child: Material(

                    borderRadius: new BorderRadius.circular(5.0),
                    elevation: 5.0,

                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      height: 50,
                      width: 50,
                      decoration: new BoxDecoration(
                        color: Colors.purple.shade900,

                        borderRadius: new BorderRadius.all(Radius.circular(50),),

                      ),
                      child: Center(child: Text("15 jan",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

        ],
      ),
    );
  }
}