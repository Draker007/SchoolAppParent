import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/NewsLetter_Response.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


Color pagetheme = Color(0xFFFF4F79);

class NewsLetters extends StatefulWidget {
  static const String id = 'NewsLetters';


  @override
  _NewsLettersState createState() => _NewsLettersState();
}

class _NewsLettersState extends State<NewsLetters> {
  Widget _widget = Container();
  List<Widget> _list = new List();
  bool _saving=false;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Scaffold(
          body: Column(
            children: <Widget>[
              AppBaar(name: "News Letters", ImagePath: "Images/newnewsletter.png",
                Themecolor: pagetheme,),
              SizedBox(height: 10,),
              Expanded(
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
      _saving=true;
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

    var res = await http.post(Constant.BASE_URL + Constant.getnewsletters_files,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    var newsLetter_Response = NewsLetter_Response.fromJson(decodedValue);
    print("Valuee : ${NewsLetter_Response}");


    if (newsLetter_Response.Status_Response == '200') {


      for (int i = 0;
      i < newsLetter_Response.newsletters_files_response.length;
      i++) {
        if(newsLetter_Response.newsletters_files_response[i].Status_ID=='1'){
          _list.add(NewsLetterWidget(image:newsLetter_Response.newsletters_files_response[i].Newsletter_thumbnail ,
                                      Date: newsLetter_Response.newsletters_files_response[i].Newsletter_month+" "+newsLetter_Response.newsletters_files_response[i].Newsletter_year,
                                      onPressed: (){
                                        CallFunctiontoDownload(newsLetter_Response.newsletters_files_response[i].Newsletter_file,
                                            'NewsLetter'+newsLetter_Response.newsletters_files_response[i].Newsletter_month+newsLetter_Response.newsletters_files_response[i].Newsletter_year);
                                      },) );
        }
      }

      setState(() {
        _saving=false;
        _widget =  GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children:_list
        );

      });
    } else {
      setState(() {
        _saving=false;
      });
    }
  }

  void CallFunctiontoDownload(String url,String name)async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses);
    final directory = await getApplicationDocumentsDirectory();


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




class NewsLetterWidget extends StatelessWidget {
 String image,Date;
 Function onPressed;


 NewsLetterWidget({this.image, this.Date, this.onPressed});

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
            height: MediaQuery.of(context).size.width/3-10,
             width: MediaQuery.of(context).size.width/3,
             child: Image.network( Constant.DOWNLOADURL+image) ,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 10,),
                Expanded(child: Text(Date)),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: onPressed,
                    child: Container(
                      height: 30,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.blue,width: 2)

                      ),
                      child: Center(
                        child: Text("Download" ,
                            style:  TextStyle( fontFamily: 'RobotoMono',fontSize: 12,color: Colors.blue)),
                      ),
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
