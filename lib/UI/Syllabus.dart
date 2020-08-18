import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/SyllabusResponse.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'LandingPage.dart';

Color pagetheme = Color(0xFF3385C9);

class Syllabus extends StatefulWidget {
  static const String id = 'Syllabus';
  Color pagetheme = Color(0xFF3385C9);

  @override
  _SyllabusState createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  bool   _saving = false;

  List<Widget> _list = new List();
  Widget _widget=Container();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Scaffold(
          body: Column(
            children: <Widget>[
              AppBaar(
                name: "Syllabus",
                ImagePath: "Images/newsyllabus.png",
                Themecolor: pagetheme,
              ),
              Flexible(
                child: Container(
                  child:_widget
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    getStringValuesSF();
    FlutterDownloader.initialize();
  }

  void getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//Return String
    String ParentID = prefs.getString('ParentID');
    String student = prefs.getString('Student_ID');
    String ClassID = prefs.getString('Class_ID');
    String SectionID = prefs.getString('Section_ID');

    fetchSyllabusData(ParentID, student, ClassID, SectionID);
  }

  fetchSyllabusData(String ParentID, String Student_ID, String Class_ID,
      String SectionID) async {
    setState(() {
      _saving = true;

    });
    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,
      'SectionID': SectionID,
    };
//encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL + Constant.getsyllabus_files,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var syllabusResponse = SyllabusResponse.fromJson(decodedValue);
    print("Valuee : ${SyllabusResponse}");

    int total = 0;

    if (syllabusResponse.Status_Response == '200') {
      String sllaybus;

      for (int i = 0;
          i < syllabusResponse.syllabus_files_response.length;
          i++) {
        if(syllabusResponse.syllabus_files_response[i].Status_ID=='1'){
        _list.add(SyllabusListContainer(
          Subject:syllabusResponse.syllabus_files_response[i].Subject_label_name ,
          onPressed: (){
            CallFunctiontoDownload(syllabusResponse.syllabus_files_response[i].Syllabus_dload_file,Class_ID +syllabusResponse.syllabus_files_response[i].Sub_Subject_Name);
          },
            SubjectName:syllabusResponse.syllabus_files_response[i].Sub_Subject_Name,
        ));
      }
      }

      setState(() {
        _saving = false;
        _widget = ListView(
          children: _list
        );
      });
    } else {
      setState(() {
        _saving = false;

      });
    }
  }

  void CallFunctiontoDownload(String url,String name)async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses);
    final directory = await getApplicationDocumentsDirectory();
    Dio dio = Dio();
   var taskdownload= await dio.download(Constant.DOWNLOADURL+url, directory.path + ".pdf",
       );
    print(taskdownload.statusMessage);

    final taskId = await FlutterDownloader.enqueue(
      url: Constant.DOWNLOADURL+url,
      fileName:name,
      savedDir: '/sdcard/download/' ,
      showNotification: true, // show download progress in status bar (for Android)
      openFileFromNotification: true, // click on notification to open downloaded file (for Android)
    );
    print(directory.path);
    print('directory.path');
    print(taskId);


  }


}



class SyllabusListContainer extends StatelessWidget {
  final String Subject,SubjectName;

  Function onPressed;

  SyllabusListContainer({this.Subject, this.onPressed , this.SubjectName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 70.0,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      child: Material(
        borderRadius: new BorderRadius.circular(3.0),
        elevation: 4.0,
        child: Container(
          height: 55.0,
          width: 55.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    height: 70.0,
                    width: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[Text(Subject), Text(SubjectName)],
                    ),
                  ),
                ),
              ),
              Image(
                image: AssetImage('Images/downloadimg.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
