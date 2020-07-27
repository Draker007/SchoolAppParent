import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
import 'package:dotted_border/dotted_border.dart';
Color pagetheme = Color(0xFFFF4F79);
class Assignment extends StatefulWidget {
  static const String id = 'Assignment';
  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {

  @override
  Widget build(BuildContext context) {
    var widget_items=[
      AssignmentWidget(),
      AssignmentWidget(),
      AssignmentWidget(),
      AssignmentWidget(),
      AssignmentWidget()
    ];

    return SafeArea(
      child: Scaffold(
        body: Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              AppBaar(name: "Assignment", ImagePath: "Images/achievement.png",
                Themecolor: pagetheme,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      height:MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return widget_items[index];
                        },
//                        pagination: new SwiperPagination(),
                        control: new SwiperControl(),
                        loop: false,
                        autoplayDisableOnInteraction:true ,
                        itemCount: widget_items.length,
                        itemWidth: MediaQuery.of(context).size.width-75,
                        viewportFraction: 0.8,
                        scale: 1,
                        layout: SwiperLayout.STACK,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class AssignmentWidget extends StatelessWidget {
  const AssignmentWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 25,bottom: 15),
              child: DottedBorder(

                borderType: BorderType.RRect,
                radius: Radius.circular(12),

                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    color: Colors.white,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(padding:EdgeInsets.all(10),
                          child: Text("Water pollution effects, causes & other effects on animals Water pollution effects, causes & other effects on animals Water pollution effects, causes & other effects on animals Water pollution effects, causes & other effects on animals."
                            ,overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                          style: TextStyle(fontSize: 16,color:Color(0xFF7B7B7B) ),),
                        ),
                        Text('Water pollution effects, causes & other effects on animals',
                        style: TextStyle(color: Colors.blue,fontSize: 16),)
                      ],
                    ),

                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width/2,
                decoration: new BoxDecoration(

                  color: pagetheme,
                  borderRadius: new BorderRadius.all(Radius.circular(25),),

                ),padding: EdgeInsets.all(5),
                child: Center(child: Text("Social Science",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
