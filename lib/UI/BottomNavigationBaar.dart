import 'package:flutter/material.dart';
import 'package:flutterchalkparent/UI/LandingPage.dart';

class BottomNavigationBaar extends StatelessWidget {
  String name , ImagePath;
  Color Themecolor;


  BottomNavigationBaar({this.name, this.ImagePath, this.Themecolor  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 20),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LandingPage.id, (Route<dynamic> route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                      child: Container(child: Icon(Icons.arrow_back_ios)),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "------------------",
                    style: TextStyle(
                        fontFamily: 'RobotoMono',
                        color: Colors.black,
                        fontSize: 23.0,
                        letterSpacing: 3.0),
                  ),
                  Container(
                      height: 55.0,
                      width: 55.0,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Themecolor, width: 5.0),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Image(image: AssetImage(ImagePath))),
                ],
              ),
              Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 6,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Themecolor,
//                  decoration: BoxDecoration(
//
//borderRadius: BorderRadius.all(Radius.circular(20))),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          child: Container(
                            height: 45.0,
                            width: MediaQuery.of(context).size.width / 4,
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
//                  decoration: BoxDecoration(
//
//borderRadius: BorderRadius.all(Radius.circular(20))),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        child: Container(
                          child: Center(
                              child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'RobotoMono',
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          )),
                          height: 45.0,
                          width: MediaQuery.of(context).size.width / 4,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
