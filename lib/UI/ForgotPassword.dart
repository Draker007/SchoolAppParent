import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'ChangePassword.dart';


Color pagetheme = Color(0xFF3385C9);
var index=0;
class ForgotPassword extends StatefulWidget {
  static const String id = "ForgotPassword";
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

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
                index=1;
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
    onChanged: (value) {
    print(value);
    setState(() {

    });
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
                        index = 0;
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
                  Navigator.pushNamed(context, ChangePassword.id);
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
}


