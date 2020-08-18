import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/ChangePasswordResponse.dart';
import 'package:flutterchalkparent/UI/LandingPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


Color pagetheme = Color(0xFF3385C9);
class ChangePassword extends StatefulWidget {
  static const String id = 'ChangePassword';


  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final CurrPaassController = TextEditingController();
  final ConfirmController = TextEditingController();
  final NewPaassController = TextEditingController();
  String oldPass,newPass,confirmPass;
  static String ParentMail;
  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(
          body: Column(

            children: <Widget>[
              AppBaar(name: "Change Password", ImagePath: "Images/achievement.png",
                Themecolor: pagetheme,),
              SizedBox(height: 20,),

              Text("Type your new and confirm password",style:  TextStyle( fontFamily: 'RobotoMono',fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blue),),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: PasswordField(
                  controller: CurrPaassController,
                  color: Colors.grey,
                  hasFloatingPlaceholder: false,
                  hintText: "Current Password",
                   border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(width: 2, color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2, color: Colors.grey)),
                  errorMessage: 'must contain special character either . * @ # \$',

                ),
              ),
              Container(

                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.all(15),
                child: PasswordField(
                  controller: NewPaassController,
                  color: Colors.grey,
                  hasFloatingPlaceholder: false,
                  hintText: "New Password",

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(width: 2, color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2, color: Colors.grey)),
                  errorMessage: 'must contain special character either . * @ # \$',
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.all(15),
                child: PasswordField(
                  controller: ConfirmController,
                  color: Colors.grey,
                  hasFloatingPlaceholder: false,
                  hintText: "Confirm Password",
                   border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(width: 2, color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2, color: Colors.grey)),
                  errorMessage: 'must contain special character either . * @ # \$',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width-50,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.blue)),
                  onPressed: () {
                    setState(() {
                      if(NewPaassController.text == ConfirmController.text){
                        fetchPasswordData(NewPaassController.text,CurrPaassController.text,ParentMail);
                      }else{

                      }
                    });
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Send".toUpperCase(),
                      style:  TextStyle( fontFamily: 'RobotoMono',fontSize: 14)),
                ),
              )
            ],
          ),
        ));
  }



  void initState() {
    getStringValuesSF();
  }

  void getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//Return String
      ParentMail = prefs.getString('ParentMail');


   }

  fetchPasswordData(String New_Password, String Password ,
      String Email) async {
    Map data = {
      'docket': Constant.docket,
      'New_Password': New_Password,
      'Password': Password,
      'Email':Email
    };
//encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL + Constant.Student_change_password,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var changePasswordResponse = ChangePasswordResponse.fromJson(decodedValue);
    print("Valuee : ${ChangePasswordResponse}");

    int total = 0;

    if (changePasswordResponse.Status_Response == '200') {
    print(changePasswordResponse.change_password_response);
    if(changePasswordResponse.change_password_response=='valid'){
      Fluttertoast.showToast(
        msg: 'Password Changed Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade800,
        textColor: Colors.white,
        fontSize: 16.0,

      );
      Navigator.pushNamed(context, LandingPage.id);
    }else{
      Fluttertoast.showToast(
        msg: changePasswordResponse.change_password_response,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade800,
        textColor: Colors.white,
        fontSize: 16.0,

      );
    }



      setState(() {

      });
    } else {}
  }

}
