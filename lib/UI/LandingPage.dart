import 'package:flutter/material.dart';
import 'package:flutterchalkparent/UI/HomePage.dart';
import 'package:flutterchalkparent/UI/Syllabus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Notification.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'HomeworkPage.dart';
import 'Profile.dart';

class LandingPage extends StatefulWidget {

  static const String id = "Landing_Page";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MyStatefulWidget());
  }
}




int _selectedIndex = 0;
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void initState() {
    getStringValuesSF();
  }

  @override
  Widget build(BuildContext context) {

    final Tabs = [
      Home().getHome(context),
      Profile().getProfile(context),
      HomeworkPage().getHomeworkPage(context),
      Notifications().getNotifications(),
    ];
    return Scaffold(

      body: Tabs[_selectedIndex],
      bottomNavigationBar:new Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.purple[900],
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.white,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
          child:  BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('HomeWork'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notification'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      )),
    );
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String ParentID = prefs.getString('ParentID');
    print(ParentID);
    return ParentID;
  }
}
