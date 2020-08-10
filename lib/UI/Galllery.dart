import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:flutterchalkparent/Resources/Constant.dart';
import 'package:flutterchalkparent/Responses/GalleryImagesResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;




Color pagetheme = Color(0xFF550527);
class Gallery extends StatefulWidget {
  static const String id = 'Gallery';
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  static GalleryImagesResponse galleryImagesResponse  ;
  List <Widget> widgets  = new List();
  List <Widget> widget_items  = new List();
  Widget _widget= Container();
  List <Widget> widget2  = new List();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        body: Container(
           
            child: Column(children: <Widget>[
              AppBaar(name: "Gallery", ImagePath: "Images/gallery.png",
                Themecolor: pagetheme,),
              Expanded(
                child: Container(

                  child:ListView(
                    children:  widget2,)
        ),
      ),
                    ])
      )
    )
    );
  }


  @override
  void initState() {
    getStringValuesSF();
  }

  void getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String ParentID = prefs.getString('ParentID');
    String student =prefs.getString('Student_ID');
    String ClassID = prefs.getString('Class_ID');
    fetchHomeWorkData(ParentID,student,ClassID);

  }

  fetchHomeWorkData(String ParentID,String Student_ID,String Class_ID ) async {

    Map data = {
      'docket': Constant.docket,
      'Parent_ID': ParentID,
      'Student_ID': Student_ID,
      'Class_ID': Class_ID,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var res = await http.post(Constant.BASE_URL+Constant.getGallery,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${res.statusCode}");
    print("${res.body}");
    var decodedValue = jsonDecode(res.body);

    galleryImagesResponse = GalleryImagesResponse.fromJson(decodedValue);
    print("Valuee : ${galleryImagesResponse}");
    int total=0;

    if(galleryImagesResponse.Status_Response == '200'){
      String id='0';
    String title="";
      for(int i = 0 ; i<galleryImagesResponse.gallery_images_response.length;i++){
      if(galleryImagesResponse.gallery_images_response[i].Status_ID=='1') {
        if(  id==galleryImagesResponse.gallery_images_response[i].Gallery_Category_ID){
          widget_items.add(Container(
            height: 180,
            width: 280,
//          color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(Constant.DOWNLOADURL +
                  galleryImagesResponse.gallery_images_response[i]
                      .Gallery_images_path,

                fit: BoxFit.cover,),
            ),
          ));
          print(galleryImagesResponse.gallery_images_response[i].Gallery_Category_name);
          print("yes");
          id=galleryImagesResponse.gallery_images_response[i].Gallery_Category_ID  ;
          title=galleryImagesResponse.gallery_images_response[i].Gallery_Category_name;

        }else if(id=='0'){
          widget_items.add(Container(
            height: 180,
            width: 280,
//          color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(Constant.DOWNLOADURL +
                  galleryImagesResponse.gallery_images_response[i]
                      .Gallery_images_path,

                fit: BoxFit.cover,),
            ),
          ));
          print(galleryImagesResponse.gallery_images_response[i].Gallery_Category_name);
          print("yes");
          id=galleryImagesResponse.gallery_images_response[i].Gallery_Category_ID  ;
          title=galleryImagesResponse.gallery_images_response[i].Gallery_Category_name;

        }else{
          print(galleryImagesResponse.gallery_images_response[i].Gallery_Category_name);

          print("no");

            widgets.add(GalleryWidget(images: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: widget_items
              ),
            ),
              Title: title,));

            widget_items.clear();
              id=galleryImagesResponse.gallery_images_response[i].Gallery_Category_ID  ;
              title=galleryImagesResponse.gallery_images_response[i].Gallery_Category_name;
            widget_items.add(Container(
              height: 180,
              width: 280,
//          color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(Constant.DOWNLOADURL +
                    galleryImagesResponse.gallery_images_response[i]
                        .Gallery_images_path,

                  fit: BoxFit.cover,),
              ),
            ));
        }

      }

      }
      setState(() {

        widget2 =  widgets;
      });



    }else{
      setState(() {
        _widget=Center(child: Text('No Fees Found'),);
      });


    }
  }
}

class GalleryWidget extends StatelessWidget {
  Widget images;
  String Title;


  GalleryWidget({this.images, this.Title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(Title,style:  TextStyle( fontFamily: 'RobotoMono',fontWeight: FontWeight.bold,color: Colors.blue),)),
        ),
        images,
      ],
    );
  }
}
//images: [
//AssetImage('Images/downloadimg.png'),
//AssetImage('Images/downloadimg.png'),
//AssetImage('Images/downloadimg.png'),
//AssetImage('Images/downloadimg.png'),
//AssetImage('Images/downloadimg.png'),
//],










