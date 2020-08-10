import 'package:flutter/material.dart';

class AppBarContanier extends StatelessWidget {
  String Name;
  String ImagePath;
  Function onPressed;
  Color Themecolor;
  AppBarContanier({this.Name, this.ImagePath, this.onPressed , this.Themecolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 82.0,
              width: 165.0,
              child: Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
              Positioned(
                bottom: 0.0,
                child: RaisedButton(
                  onPressed: (){},
                  color: Themecolor,
//                  decoration: BoxDecoration(
//
//borderRadius: BorderRadius.all(Radius.circular(20))),
                  shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(30.0),

                  ),
                  child: Container(
                    height: 60.0,
                    width: 130.0,
                  ),
                ),
              ),
                  Positioned(
                    bottom: 7.0,
                    child: RaisedButton(
                      onPressed:(){} ,
                      color: Colors.white,
//                  decoration: BoxDecoration(
//
//borderRadius: BorderRadius.all(Radius.circular(20))),
                      shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(30.0),
                           ),
                      child: Container(
child: Center(child: Text(Name,style:  TextStyle( fontFamily: 'RobotoMono',
  color: Colors.black, fontSize: 16.0,
),)),
                        height: 60.0,
                        width: 130.0,
                      ),
                    ),
                  )
                ],
              ),
            ),

            Text(
              "-----------",
              style:  TextStyle( fontFamily: 'RobotoMono',
                  color: Colors.black, fontSize: 23.0, letterSpacing: 3.0),
            ),
            Container(
                height: 55.0,
                width: 55.0,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Themecolor,
                      width: 5.0
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Image(image: AssetImage(ImagePath))),

          ],
        ),
      ),
    );
  }
}



//Container(
//padding: EdgeInsets.all(10.0),
//decoration: BoxDecoration(
//
//borderRadius: BorderRadius.all(Radius.circular(20))),
//child: Text(
//Name,
//style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.black, fontSize: 20.0),
//),
//),