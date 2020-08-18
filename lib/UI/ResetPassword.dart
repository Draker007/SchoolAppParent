import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/SendOTPResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:http/http.dart' as http;

import 'Login.dart';

Color pagetheme = Color(0xFF3385C9);

class ResetPassword extends StatefulWidget {
  static const String id = 'ResetPassword';
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final ConfirmController = TextEditingController();
  final NewPaassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(
          body: Column(

            children: <Widget>[
              AppBaar(name: "Change Password", ImagePath: "Images/achievement.png",
                Themecolor: pagetheme,),
             Expanded(
               child: Container(
                 child: ListView(
                   children: <Widget>[
                     SizedBox(height: 20,),

                     Center(child: Text("Type your new and confirm password",style:  TextStyle( fontFamily: 'RobotoMono',fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blue),)),

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
                     RaisedButton(
                       padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
                       shape: RoundedRectangleBorder(

                           borderRadius: BorderRadius.circular(5.0),
                           side: BorderSide(color: Colors.blue)),
                       onPressed: () {
                         setState(() {
                           if(NewPaassController.text == ConfirmController.text){
                             fetchChangePassOTP(  Constant.Email,  Constant.otp,  NewPaassController.text,);
                           }else{
                             Fluttertoast.showToast(
                               msg: "Password are not same Please renter",
                               toastLength: Toast.LENGTH_SHORT,
                               gravity: ToastGravity.BOTTOM,
                               timeInSecForIosWeb: 1,
                               backgroundColor: Colors.grey.shade800,
                               textColor: Colors.white,
                               fontSize: 16.0,

                             );
                           }
                         });
                       },
                       color: Colors.blue,
                       textColor: Colors.white,
                       child: Text("Send".toUpperCase(),
                           style:  TextStyle( fontFamily: 'RobotoMono',fontSize: 14)),
                     )
                   ],
                 ),
               ),
             )
            ],
          ),
        ));
  }



  fetchChangePassOTP(String Email,String otp,String Newpass,) async {
    setState(() {
      // _saving = true;

    });
    Map data = {
      'docket': Constant.docket,
      'Contact_Number': Email,
      'OTP': otp,
      'New_Password': Newpass,
    };
//encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL + Constant.setNewPass,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var sendOTPResponse = SendOTPResponse.fromJson(decodedValue);
    print("Valuee : ${SendOTPResponse}");

    int total = 0;

    if (sendOTPResponse.Status_Response == '200') {
      Fluttertoast.showToast(
        msg: 'Password Changed successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade800,
        textColor: Colors.white,
        fontSize: 16.0,

      );

      Navigator.of(context)
          .pushNamedAndRemoveUntil(Login.id, (Route<dynamic> route) => false);

    } else {
      Fluttertoast.showToast(
        msg: sendOTPResponse.reset_password_response,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade800,
        textColor: Colors.white,
        fontSize: 16.0,

      );
    }
  }
}
