 import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterchalkparent/Resources/AppBaar.dart';

Color pagetheme = Color(0xFF049A51);
 List<Color> gradientColors = [
   const Color(0xffffffff),
   const Color(0xffffffff),
 ];

 List<Color> gradientColor1 = [
   const Color(0xffffffff),
   const Color(0xffffffff),
 ];

class Result extends StatefulWidget {
  static const String id = 'Result';


  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
//  LineChart lineChart = LineChart.fromDateTimeMaps([line1, line2], [Colors.green, Colors.blue]);


  bool showAvg = false;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              AppBaar(name: 'Result',ImagePath: "Images/newresults.png",Themecolor: pagetheme,),
              Container(
                padding: EdgeInsets.all(14),
                height: 50,
                child: Column(
                  children: <Widget>[
                    Container(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ResultExamTag(),
                          ResultExamTag(),
                          ResultExamTag(),
                          ResultExamTag(),
                          ResultExamTag(),

                        ],
                      ),
                    ),
                    Container(
                      height: 0.5,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height/3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height:150,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ResultShowMarks(),
                          ResultShowMarks(),
                          ResultShowMarks(),
                          ResultShowMarks(),
                          ResultShowMarks(),
                          ResultShowMarks(),

                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 20,),
                          Text("Total Percentage  "),
                          Container(
                            height: 40,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(

                                width: 1.0,
                                color: Colors.grey,
                              ),


                            ),
                            child: Center(child: Text("100 %",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)),
                          )
                        ],
                      ),
                    ),

                  ],
                )

              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1.70,
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: Color(0xFF049A51)),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                              child: LineChart(
                                showAvg ? avgData() : mainData(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          height: 34,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                showAvg = !showAvg;
                              });
                            },
                            child: Text(
                              'avg',
                              style: TextStyle(
                                  fontSize: 12, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
















class ResultShowMarks extends StatelessWidget {
  const ResultShowMarks({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

        width:150,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("Eng 1",style: TextStyle(color: Colors.blue),),
                SizedBox(height: 5,),
                Container(

                  height: 100,
                  width: 120,
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: pagetheme,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: <Widget>[
                        Container(
                          height: 100,
                          width: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(10) ,bottomLeft: Radius.circular(10)),
                        ),

                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("90"),
                              Container(
                                height: 1,
                                width: 50,
                                color: Colors.grey,
                              ),
                              Text('100'),
                            ],
                          ) ,
                        ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("%",style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold),),
                                Text("95",style: TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}















class ResultExamTag extends StatelessWidget {
  const ResultExamTag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("T1"),
          Container(
            height: 3,
            width: 40,
            color: Colors.blue,

          )
        ],
      ),
    );
  }
}






 LineChartData mainData() {

   return LineChartData(
     gridData: FlGridData(
       show: true,
       drawVerticalLine: true,
       getDrawingHorizontalLine: (value) {
         return FlLine(
           color: const Color(0xffffffff),
           strokeWidth: 0.5,
         );
       },
       getDrawingVerticalLine: (value) {
         return FlLine(
           color: const Color(0xffffffff),
           strokeWidth: 0.5,
         );
       },
     ),
     titlesData: FlTitlesData(
       show: true,
       bottomTitles: SideTitles(
         showTitles: true,
         reservedSize: 22,
         textStyle:
         const TextStyle(color: Color(0xffffffff) , fontSize: 16),
         getTitles: (value) {
           switch (value.toInt()) {
             case 2:
               return 'MAR';
             case 5:
               return 'JUN';
             case 8:
               return 'SEP';
           }
           return '';
         },
         margin: 8,
       ),
       leftTitles: SideTitles(
         showTitles: true,
         textStyle: const TextStyle(
           color: Color(0xffffffff),

           fontSize: 15,
         ),
         getTitles: (value) {
           switch (value.toInt()) {
             case 2:
               return '20';
             case 4:
               return '40';
             case 6:
               return '60';
             case 8:
               return '80';
           }
           return '';
         },
         reservedSize: 28,
         margin: 12,
       ),
     ),
     borderData:
     FlBorderData(show: true, border: Border.all(color: const Color(0xffffffff), width: 0.5)),
     minX: 0,
     maxX: 11,
     minY: 0,
     maxY: 10,
     lineBarsData: [
       LineChartBarData(
         spots: [
           FlSpot(0, 3),
           FlSpot(2.6, 2),
           FlSpot(4.9, 5),
           FlSpot(6.8, 3.1),
           FlSpot(8, 4),
           FlSpot(9.5, 3),
           FlSpot(11, 4),
         ],
         isCurved: false,
         colors: gradientColors,
         barWidth: 2,
         isStrokeCapRound: true,

         dotData: FlDotData(

           show: true,
//            checkToShowDot:
//            CheckToShowDot = bool Function(spots, spots);



         ),
         belowBarData: BarAreaData(
           show: false,
           colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
         ),
       ),
     ],

   );
 }

 LineChartData avgData() {
   return LineChartData(
     lineTouchData: LineTouchData(enabled: false),
     gridData: FlGridData(
       show: true,
       drawHorizontalLine: true,
       getDrawingVerticalLine: (value) {
         return FlLine(
           color: const Color(0xff37434d),
           strokeWidth: 1,
         );
       },
       getDrawingHorizontalLine: (value) {
         return FlLine(
           color: const Color(0xff37434d),
           strokeWidth: 1,
         );
       },
     ),
     titlesData: FlTitlesData(
       show: true,
       bottomTitles: SideTitles(
         showTitles: true,
         reservedSize: 22,
         textStyle:
         const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 16),
         getTitles: (value) {
           switch (value.toInt()) {
             case 2:
               return 'MAR';
             case 5:
               return 'JUN';
             case 8:
               return 'SEP';
           }
           return '';
         },
         margin: 8,
       ),
       leftTitles: SideTitles(
         showTitles: true,
         textStyle: const TextStyle(
           color: Color(0xffffffff),
           fontWeight: FontWeight.bold,
           fontSize: 15,
         ),
         getTitles: (value) {
           switch (value.toInt()) {
             case 1:
               return '10k';
             case 3:
               return '30k';
             case 5:
               return '50k';
           }
           return '';
         },
         reservedSize: 28,
         margin: 12,
       ),
     ),
     borderData:
     FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
     minX: 0,
     maxX: 11,
     minY: 0,
     maxY: 6,
     lineBarsData: [
       LineChartBarData(
         spots: [
           FlSpot(0, 3.44),
           FlSpot(2.6, 3.44),
           FlSpot(4.9, 3.44),
           FlSpot(6.8, 3.44),
           FlSpot(8, 3.44),
           FlSpot(9.5, 3.44),
           FlSpot(11, 3.44),
         ],
         isCurved: true,
         colors: [
           ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
           ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
         ],
         barWidth: 5,
         isStrokeCapRound: true,
         dotData: FlDotData(
           show: false,
         ),
         belowBarData: BarAreaData(show: true, colors: [
           ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
           ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
         ]),
       ),
     ],
   );
 }