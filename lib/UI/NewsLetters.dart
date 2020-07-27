import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
Color pagetheme = Color(0xFFFF4F79);

class NewsLetters extends StatefulWidget {
  static const String id = 'NewsLetters';

  @override
  _NewsLettersState createState() => _NewsLettersState();
}

class _NewsLettersState extends State<NewsLetters> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            AppBaar(name: "News Letters", ImagePath: "Images/achievement.png",
              Themecolor: pagetheme,),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    NewsLetterWidget(),
                    NewsLetterWidget(),
                    NewsLetterWidget(),
                    NewsLetterWidget(),
                    NewsLetterWidget(),
                    NewsLetterWidget(),
                    NewsLetterWidget(),
                    NewsLetterWidget(),
                    NewsLetterWidget(),
                    NewsLetterWidget(),

                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}





class NewsLetterWidget extends StatelessWidget {
  const NewsLetterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
        decoration: new BoxDecoration(

            border: Border.all(color: Colors.grey),
          borderRadius: new BorderRadius.all(Radius.circular(5)),

        ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.width/3,
             width: MediaQuery.of(context).size.width/3,
             child: Image(image: AssetImage("Images/achievement.png")) ,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 10,),
                Expanded(child: Text('Chintana Jan.2020')),
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    height: 30,

                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.blue)),
                      onPressed: () {

                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Login".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
