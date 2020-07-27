import 'package:flutter/material.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:passwordfield/passwordfield.dart';

Color pagetheme = Color(0xFF3385C9);
class ChangePassword extends StatefulWidget {
  static const String id = 'ChangePassword';
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child: Scaffold(
          body: Column(

            children: <Widget>[
              AppBaar(name: "Change Password", ImagePath: "Images/achievement.png",
                Themecolor: pagetheme,),
              SizedBox(height: 20,),

              Text("Type your new and confirm password",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blue),),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: PasswordField(
                  color: Colors.grey,
                  hasFloatingPlaceholder: false,
                  hintText: "Confirm Password",
                  pattern: r'.*[@$#.*].*',
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
                  color: Colors.grey,
                  hasFloatingPlaceholder: false,
                  hintText: "Confirm Password",
                  pattern: r'.*[@$#.*].*',
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
                  color: Colors.grey,
                  hasFloatingPlaceholder: false,
                  hintText: "Confirm Password",
                  pattern: r'.*[@$#.*].*',
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
                      Navigator.pushNamed(context, ChangePassword.id);
                    });
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Send".toUpperCase(),
                      style: TextStyle(fontSize: 14)),
                ),
              )
            ],
          ),
        ));
  }
}
