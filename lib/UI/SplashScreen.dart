import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/ChooseKidResponse.dart';
import 'package:flutterchalkparent/Responses/LoginResponse.dart';
import 'package:flutterchalkparent/UI/Login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'LandingPage.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _saving = false;
  static String email,password;
  var loginResponse;
  static LoginResponse loginRes;
  static ChooseKidResponse ChooseKidRe;
  var listKidsResponse;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: Center(child: Image(image: AssetImage('Images/splash_logo.png'))),
            ),
        ],
      ),

    ));
  }

  void initState() {
    getStringValuesSF();
  }

  Future<dynamic> startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, fetchData(email,password));
  }
  void getStringValuesSF() async {
    try{ SharedPreferences prefs = await SharedPreferences.getInstance();
//Return String
    print("1");
    email = prefs.getString('ParentMail');
    password = prefs.getString('ParentPassword');
    Future.delayed(const Duration(milliseconds: 500), () {
      print("2");
      if(email!=null && password !=null){
        print(email);
        fetchData(email,password);
      }else{
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Login.id, (Route<dynamic> route) => false);
      }

    });

    }catch(e){

    }

  }
  fetchData(String email,String password) async {
    setState(() {
      _saving = true;
    });
    print("3"+email+password);
    Map data = {
      'docket': '89152ac02591b52451fb16674a9a1cbc',
      'Email': email,
      'Password': password,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL+Constant.loginurl,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);
    loginRes = LoginResponse.fromJson(decodedValue);
    print("Valuee : ${LoginResponse}");
    print("Login response: ${loginRes.Status_Response}");
    loginResponse = loginRes.login_response;
    if(loginRes.Status_Response == '200'){

      fetchKidData();

    }else{
      setState(() {
        _saving = false;
      });


      Navigator.of(context)
          .pushNamedAndRemoveUntil(Login.id, (Route<dynamic> route) => false);

    }
  }



  fetchKidData() async {
    setState(() {
      _saving = true;
    });
    Map data = {
      'docket': Constant.docket,
      'Parent_ID': loginRes.Parents_ID,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL+Constant.getChildren,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    ChooseKidRe = ChooseKidResponse.fromJson(decodedValue);
    print("Valuee : ${LoginResponse}");
    print("Login response: ${ChooseKidRe.select_kids_response[0].Student_Status}");

    if(ChooseKidRe.Status_Response == '200'){

      for(int i = 0 ; i<ChooseKidRe.select_kids_response.length;i++){
        if(ChooseKidRe.select_kids_response[i].Student_Status == '1'){

          addStringToSF( i);
        }
      }



    }else{


      Fluttertoast.showToast(
        msg: loginRes.login_response,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade800,
        textColor: Colors.white,
        fontSize: 16.0,

      );
    }
  }




  addStringToSF(int i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print('asaddsa'+ChooseKidRe.select_kids_response[i].Student_ID);
    prefs.setString('ParentMail', email);
    prefs.setString('ParentPassword', password);
    prefs.setString('ParentID', loginRes.Parents_ID);
    prefs.setString('Student_ID',ChooseKidRe.select_kids_response[i].Student_ID);
    prefs.setString('Student_Name',ChooseKidRe.select_kids_response[i].Student_Name );
    prefs.setString('Student_Gender',ChooseKidRe.select_kids_response[i].Student_Gender );
    prefs.setString('Student_Image_Name',ChooseKidRe.select_kids_response[i].Student_Image_Name );
    prefs.setString('Class_Name',ChooseKidRe.select_kids_response[i].Class_Name );
    prefs.setString('Class_number',ChooseKidRe.select_kids_response[i].Section_Name );
    prefs.setString('Student_Gender',ChooseKidRe.select_kids_response[i].Student_Gender );
    prefs.setString('Class_ID',ChooseKidRe.select_kids_response[i].Class_ID );
    prefs.setString('Section_ID',ChooseKidRe.select_kids_response[i].Section_ID );
    print(('Student_ID'));
    print(ChooseKidRe.select_kids_response[i].Student_ID);
    Navigator.pushNamed(context, LandingPage.id);

  }
}
