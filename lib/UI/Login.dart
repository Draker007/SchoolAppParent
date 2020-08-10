import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/ChooseKidResponse.dart';


import 'package:flutterchalkparent/Responses/LoginResponse.dart';
import 'package:flutterchalkparent/UI/ForgotPassword.dart';
import 'package:flutterchalkparent/UI/LandingPage.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class Login extends StatefulWidget {
  static const String id = "Login_id";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _saving = false;
  static String email,password;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var loginResponse;
  static LoginResponse loginRes;
  static ChooseKidResponse ChooseKidRe;
  var listKidsResponse;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(bottom: 100.0),
            decoration: BoxDecoration(

              image: DecorationImage(
                image: AssetImage("Images/login_bg_new.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Material(

                    borderRadius: new BorderRadius.circular(20.0),
                    elevation: 10.0,

                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      margin: EdgeInsets.only(bottom: 50.0,top: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment : CrossAxisAlignment.center,
                  children: <Widget>[
                  Text('Login'),
                      TextField(

                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'UserName',

                        ),

                      ),
            PasswordField(
              controller: passwordController,
              hasFloatingPlaceholder: true,
              pattern: r'.*[@$#.*].*',
              errorMessage: 'must contain special character either . * @ # \$',
            ),
                      Column(

                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 30.0),
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              shape: RoundedRectangleBorder(

                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(color: Colors.purple.shade900)),
                              onPressed: () {
                                if(emailController.text != '' && passwordController.text != ''){

                                  setState(() {
                                   fetchData();



                                  });

                                }else{
                                  Fluttertoast.showToast(
                                      msg: "Please Fill all fields",
                                      toastLength: Toast.LENGTH_SHORT,

                                      timeInSecForIosWeb: 1,

                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );

                                }
                               // Navigator.pushNamed(context, LandingPage.id);
                              },
                              color: Colors.purple.shade900,
                              textColor: Colors.white,
                              child: Text("Login".toUpperCase(),
                                  style:  TextStyle( fontFamily: 'RobotoMono',fontSize: 14)),
                            ),
                          ),

                        ],
                      ),
                    GestureDetector(
                        onTap:(){
                          Navigator.pushNamed(context, ForgotPassword.id);
                        },
                        child: Text("Forgot Password ?"))
              ],
            ),
                    ),

                  ),
                )
              ],
            ),
          ),
        ),
          inAsyncCall: _saving
      ),

    );
  }


  fetchData() async {
    setState(() {
      _saving = true;
    });
    Map data = {
      'docket': '89152ac02591b52451fb16674a9a1cbc',
      'Email': emailController.text,
      'Password': passwordController.text,
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
      setState(() {
        _saving = false;
      });

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
    prefs.setString('ParentMail', emailController.text);
    prefs.setString('ParentPassword', passwordController.text);
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


