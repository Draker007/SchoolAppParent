import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';

class Profile {
  static const String id = "Profile";
  Widget getProfile(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 225,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
//                    color: Colors.blue,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Images/profileBG.png"),
                              fit: BoxFit.cover)),
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 75),
                        width: 150.0,
                        height: 150.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://i.imgur.com/BoN9kdC.png")))),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Name",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text('Dhanya Prasad Sinha',
                                  style: TextStyle(color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Class",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text('V',
                                  style: TextStyle(color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Section",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text('A',
                                  style: TextStyle(color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Blood Group",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text('O +ve',
                                  style: TextStyle(color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Father's Name",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text('Prasad Sinha',
                                  style: TextStyle(color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Mother's Name",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text('Dhanya Prasad Sinha',
                                  style: TextStyle(color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Phone Number",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text('+1-45678915',
                                  style: TextStyle(color: Colors.grey[600]))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Address",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Flexible(
                                child: Container(
                                    margin: EdgeInsets.only(left: 50),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        '#10 asd,deefede,qwew dsdw,dw wdw dwd,sada sd asf wsa ,,asdw adwa,dwasdwa',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        style: TextStyle(
                                            color: Colors.grey[600]))),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
//                        height: 100,
//                        width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400)),
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '665/665',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Perfomance")
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '100%',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Percentage")
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '665/665',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Attendance")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
