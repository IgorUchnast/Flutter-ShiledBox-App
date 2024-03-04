// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shield_box/colors.dart';

class ChartWeekView extends StatelessWidget {
  const ChartWeekView({
    super.key,
    required this.text,
    // required this.day1,
    // required this.day2,
    // required this.day3,
    // required this.day4,
    // required this.day5,
    // required this.day6,
    // required this.day7,
  });
  final String text;
  // final double da1;
  // final double day2;
  // final double day3;
  // final double day4;
  // final double day5;
  // final double day6;
  // final double day7;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 30, 5, 20),
      padding: const EdgeInsets.all(20),
      height: 400,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: containerColor,
        boxShadow: [
          BoxShadow(
            color: Colors.white12,
            spreadRadius: 1,
            blurRadius: 15,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Title(
            color: containerColor,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 300,
            width: double.maxFinite,
            // color: Colors.amber,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 15),
                      FlSpot(1, 16),
                      FlSpot(2, 15.5),
                      FlSpot(3, 15.9),
                      FlSpot(4, 17),
                      FlSpot(5, 16.7),
                      FlSpot(6, 15.9),
                    ],
                    isCurved: true,
                    dotData: FlDotData(
                      show: true,
                    ),
                    color: const Color.fromARGB(255, 211, 170, 47),
                    barWidth: 2,
                    belowBarData: BarAreaData(
                      show: true,
                      // color:
                    ),
                  ),
                ],
                minX: 0,
                minY: 10,
                maxX: 6,
                maxY: 30,
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        String textt = '';
                        switch (value.toInt()) {
                          case 0:
                            textt = "Mon";
                            break;
                          case 1:
                            textt = "Tue";
                            break;
                          case 2:
                            textt = "Wed";
                            break;
                          case 3:
                            textt = "Thu";
                            break;
                          case 4:
                            textt = "Fri";
                            break;
                          case 5:
                            textt = "Sat";
                            break;
                          case 6:
                            textt = "Sun";
                            break;
                        }
                        return Text(
                          textt,
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    axisNameWidget: Text(
                      "Temperature",
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 10,
                      getTitlesWidget: (value, meta) {
                        String temp = "";
                        switch (value.toInt()) {
                          case 0:
                            temp = "10";
                            break;
                          case 1:
                            temp = "15";
                            break;
                          case 2:
                            temp = "20";
                            break;
                          case 3:
                            temp = "25";
                            break;
                          case 4:
                            temp = "30";
                            break;
                          case 5:
                            temp = "35";
                            break;
                          case 6:
                            temp = "40";
                            break;
                        }
                        return Text(
                          temp,
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// margin: const EdgeInsets.fromLTRB(5, 30, 5, 20),
//       padding: const EdgeInsets.all(20),
//       height: 400,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         color: containerColor,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white12,
//             spreadRadius: 1,
//             blurRadius: 15,
//             offset: Offset(0, 3),
//           ),
//         ],
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           bottomRight: Radius.circular(30),
//           topRight: Radius.circular(30),
//           bottomLeft: Radius.circular(30),
//         ),
//       ),
//       child: Column(
//         children: [
//           Title(
//             color: containerColor,
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: Colors.amber,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(5),
//             height: 300,
//             width: double.maxFinite,
//             // color: Colors.amber,
//             child: LineChart(
//               LineChartData(
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: [
//                       FlSpot(0, 15),
//                       FlSpot(1, 16),
//                       FlSpot(2, 15.5),
//                       FlSpot(3, 15.9),
//                       FlSpot(4, 17),
//                       FlSpot(5, 16.7),
//                       FlSpot(6, 15.9),
//                     ],
//                     isCurved: true,
//                     dotData: FlDotData(
//                       show: true,
//                     ),
//                     color: const Color.fromARGB(255, 211, 170, 47),
//                     barWidth: 2,
//                     belowBarData: BarAreaData(
//                       show: true,
//                       // color:
//                     ),
//                   ),
//                 ],
//                 minX: 0,
//                 minY: 10,
//                 maxX: 6,
//                 maxY: 30,
//                 titlesData: FlTitlesData(
//                   show: true,
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       getTitlesWidget: (value, meta) {
//                         String textt = '';
//                         switch (value.toInt()) {
//                           case 0:
//                             textt = "Mon";
//                             break;
//                           case 1:
//                             textt = "Tue";
//                             break;
//                           case 2:
//                             textt = "Wed";
//                             break;
//                           case 3:
//                             textt = "Thu";
//                             break;
//                           case 4:
//                             textt = "Fri";
//                             break;
//                           case 5:
//                             textt = "Sat";
//                             break;
//                           case 6:
//                             textt = "Sun";
//                             break;
//                         }
//                         return Text(
//                           textt,
//                           style: TextStyle(
//                             color: Colors.amber,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   leftTitles: AxisTitles(
//                     axisNameWidget: Text(
//                       "Temperature",
//                       style: TextStyle(
//                         color: Colors.amber,
//                       ),
//                     ),
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       interval: 1,
//                       reservedSize: 10,
//                       getTitlesWidget: (value, meta) {
//                         String temp = "";
//                         switch (value.toInt()) {
//                           case 0:
//                             temp = "10";
//                             break;
//                           case 1:
//                             temp = "15";
//                             break;
//                           case 2:
//                             temp = "20";
//                             break;
//                           case 3:
//                             temp = "25";
//                             break;
//                           case 4:
//                             temp = "30";
//                             break;
//                           case 5:
//                             temp = "35";
//                             break;
//                           case 6:
//                             temp = "40";
//                             break;
//                         }
//                         return Text(
//                           temp,
//                           style: TextStyle(
//                             color: Colors.amber,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 // backgroundColor: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
