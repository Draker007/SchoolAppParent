
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';
Color pagetheme = Color(0xFFE81A13);
class Exams extends StatefulWidget {
  static const String id = "Exams";
  @override
  _ExamsState createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  var widget_items=[
    ExamSllyabus(),
    ExamSllyabus(),
    ExamSllyabus(),
    ExamSllyabus(),
    ExamSllyabus()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              AppBaar(
                name: "Exams", ImagePath: "Images/newexams.png",
                Themecolor: pagetheme,
              ),

              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
            
                        padding:EdgeInsets.all(15.0),
                        width: (MediaQuery.of(context).size.width ),

                        height: (MediaQuery.of(context).size.height/2),
                        child: Material(
                      elevation: 4,
                          child: Expanded(child: Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width-100,
                                  child: Row(

                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: <Widget>[
                                      ExamsTitleWidget(exam: 'FT',),
                                      ExamsTitleWidget(exam: 'ST',),
                                      ExamsTitleWidget(exam: 'MT',),
                                      ExamsTitleWidget(exam: 'TT',),
                                      ExamsTitleWidget(exam: 'FT',),
                                      ExamsTitleWidget(exam: 'FT',),


                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(child: Text("Date",style: TextStyle(color: Colors.blue),)),
                                    Expanded(child: Text("Subject",style: TextStyle(color: Colors.blue),)),
                                    Expanded(child: Text("Max. Marks",style: TextStyle(color: Colors.blue),)),
                                ],),
                                 Expanded(child: Container(
                                   child: ListView(
                                     children: <Widget>[
                                       Column(
                                         children: <Widget>[
                                           SizedBox(height: 10,),
                                           EnterMarksWidget(),
                                           EnterMarksWidget(),
                                           EnterMarksWidget(),
                                           EnterMarksWidget(),
                                           EnterMarksWidget(),
                                           EnterMarksWidget(),
                                         ],
                                       ),

                                     ],
                                   ),
                                 ))
                              ],
                            ),
                          )),
                        ),
                      ),
                      Container(
                        height:MediaQuery.of(context).size.height/4,
                        width: MediaQuery.of(context).size.width,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return widget_items[index];
                          },
//                        pagination: new SwiperPagination(),

                          loop: false,
                          autoplayDisableOnInteraction:true ,
                          itemCount: widget_items.length,
                          itemWidth: MediaQuery.of(context).size.width-100,
                          viewportFraction: 0.7,
                          scale: 0.9,
                          layout: SwiperLayout.DEFAULT,
                        ),
                      ),
                      SizedBox(height: 1,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








class EnterMarksWidget extends StatelessWidget {
  const EnterMarksWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5,),
        Row(

          children: <Widget>[
            Expanded(child: Text('09.aug.20',style: TextStyle(fontSize: 12,color: Color(0xFF7B7B7B)),)),
            Expanded(child: Text('S1-Hindi',style: TextStyle(fontSize: 12,color: Color(0xFF7B7B7B)))),
            Expanded(child: Text('50',style: TextStyle(fontSize: 12,color: Color(0xFF7B7B7B)))),
          ],
        ),
        Container(
          height: 0.5,
          color: Color(0xFF9A9A9A),
        )
      ],
    );
  }
}







class ExamsTitleWidget extends StatelessWidget {
 String exam;


 ExamsTitleWidget({this.exam});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 50,
      width:50,
      decoration: BoxDecoration(
          color: Colors.red[500],
          border: Border.all(
            color: Colors.red[500],
          ),
          borderRadius: BorderRadius.all(Radius.circular(35))
      ),
      child: Center(child: Text(exam, )),
    );
  }
}






//Slaybuss
class ExamSllyabus extends StatelessWidget {
  const ExamSllyabus({
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
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(padding:EdgeInsets.all(10),
                          child: Text("Water pollution  "
                            ,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.blue,fontSize: 16),
                            maxLines: 10,
                            ),
                        ),
                        Text('Water pollution effects, causes & other effects on animals Water pollution effects, causes & other effects on animalsWater pollution effects, causes & other effects on animals',
                            style: TextStyle(fontSize: 12,color:Color(0xFF7B7B7B) )
                          )
                      ],
                    ),

                  ),
                ),
              ),
            ),
          ),
          Row(

            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: new BoxDecoration(

                  color: pagetheme,
                  borderRadius: new BorderRadius.all(Radius.circular(25),),

                ),padding: EdgeInsets.all(5),
                child: Center(child: Text("Jun 20 ",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}