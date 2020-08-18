import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/SendOTPResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;

import 'ChangePassword.dart';
import 'ResetPassword.dart';


Color pagetheme = Color(0xFF3385C9);

class ForgotPassword extends StatefulWidget {
  static const String id = "ForgotPassword";
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  static var index=0;
  final emailController = TextEditingController();
  static String pincode,otp;
  @override
  Widget build(BuildContext context) {
    var widget_items=[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.all(20),
            child:  TextField(
              controller: emailController,
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),

                labelText: 'Enter Your registered phone number',

                prefixIcon: const Icon(
                  Icons.phone_android,
                  color: Colors.green,
                ),

              ),
            ),

          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.grey)),
            onPressed: () {
              setState(() {
                fetchChangePassOTP( emailController.text);

              });
            },
            color: Colors.grey,
            textColor: Colors.white,
            child: Text("Send".toUpperCase(),
                style:  TextStyle( fontFamily: 'RobotoMono',fontSize: 14)),
          ),
        ],
      ),
      Container(
//        color: Colors.white,

        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Container(
              margin:EdgeInsets.only(top: 40) ,
              child: Text("Enter the 4 digit code sent to your phone")),
        Container(
          margin:EdgeInsets.only(top: 20) ,
            width:200,
          child: PinCodeTextField(
            backgroundColor: Colors.transparent,

          length: 4,
            onChanged: (text) {
              setState(() {
                pincode=text;
              });
            },

            obsecureText: false,
          animationType: AnimationType.fade,
          validator: (v) {
          if (v.length < 3) {
          return "I'm from validator";
          } else {
          return null;
          }
          },
          pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,

          borderRadius: BorderRadius.circular(5),
          activeColor: Colors.grey,
          selectedColor: Colors.grey,
          inactiveColor: Colors.grey,

          fieldHeight: 50,
          fieldWidth: 40,

          ),
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: false,

    onCompleted: (v) {
    print("Completed");
    },

    beforeTextPaste: (text) {
    print("Allowing to paste $text");
    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
    //but you can show anything you want here, like your pop up saying wrong paste format or etc
    return true;
    },
    ),
        ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Change Phone number'),
                GestureDetector(
                    onTap: (){
                      setState(() {
                        fetchChangePassOTP( emailController.text);
                      });
                    },
                    child: Text('Resend OTP',style:  TextStyle( fontFamily: 'RobotoMono',color: Colors.blue),))
              ],
            ),
            SizedBox(height: 20,),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.blue)),
              onPressed: () {
                setState(() {
                  if(pincode==otp){
                    Constant.otp = pincode;
                    Constant.Email = emailController.text ;
                    Navigator.pushNamed(context, ResetPassword.id,arguments: pincode);
                  }else{
                    Fluttertoast.showToast(
                      msg: "Wrong OTP entered.",
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
            ),

        ],

        ),
      )


    ];

    return SafeArea(
      child: Scaffold(
        body:Container(
          child: Column(
            children: <Widget>[
              AppBaar(name: "Forgot Password", ImagePath: "Images/achievement.png",
                Themecolor: pagetheme,),
              widget_items[index]
            ],
          ),
        ),



        
      ),
    );
  }



  fetchChangePassOTP(String Email) async {
    setState(() {
      // _saving = true;

    });
    Map data = {
      'docket': Constant.docket,
      'Contact_Number': Email,
    };
//encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL + Constant.getSendOTP,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var sendOTPResponse = SendOTPResponse.fromJson(decodedValue);
    print("Valuee : ${SendOTPResponse}");

    int total = 0;

    if (sendOTPResponse.Status_Response == '200') {
      String sllaybus;
      otp=sendOTPResponse.resrt_password_otp_response;


      setState(() {
         index=1;
      });
    } else {
      setState(() {


      });
    }
  }
}


