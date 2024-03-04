import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});
  final chartHeight = 10;

  void changeChartColor(chartHeight) {
    if (chartHeight > 25) {
      return;
    }
  }

  // @override
  // void initState() {
  //   changeChartColor();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 30, 5, 20),
          padding: const EdgeInsets.all(20),
          height: 400,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 10, 41, 57),
            boxShadow: [
              BoxShadow(
                color: Colors.white38,
                spreadRadius: 1,
                blurRadius: 15,
                offset: Offset(0, 3),
              )
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
              // const Text("igor"),
              BarChart(
                BarChartData(
                  backgroundColor: const Color.fromARGB(255, 10, 41, 57),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 1),
                      bottom: BorderSide(width: 1),
                    ),
                  ),
                  maxY: 40,
                  groupsSpace: 10,
                  // titlesData: FlTitlesData(),
                  barGroups: [
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          fromY: 0,
                          toY: 25,
                          width: 100,
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ],
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

// class ChartTempView extends StatelessWidget {
//   const ChartTempView({
//     super.key,
//     required this.text,
//   });
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.fromLTRB(5, 30, 5, 20),
//       padding: const EdgeInsets.all(20),
//       height: 400,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         color: Color.fromARGB(255, 10, 41, 57),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white38,
//             spreadRadius: 1,
//             blurRadius: 15,
//             offset: Offset(0, 3),
//           )
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
//             color: const Color.fromARGB(255, 10, 41, 57),
//             child: const Text(
//               "igor",
//               style: TextStyle(
//                 color: Color.fromARGB(255, 39, 127, 199),
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           BarChart(
//             BarChartData(
//               backgroundColor: const Color.fromARGB(255, 10, 41, 57),
//               borderData: FlBorderData(
//                 show: true,
//                 border: const Border(
//                   top: BorderSide.none,
//                   right: BorderSide.none,
//                   left: BorderSide(width: 1),
//                   bottom: BorderSide(width: 1),
//                 ),
//               ),
//               maxY: 40,
//               groupsSpace: 10,
//               // titlesData: FlTitlesData(),
//               barGroups: [
//                 BarChartGroupData(
//                   x: 1,
//                   barRods: [
//                     BarChartRodData(
//                       fromY: 0,
//                       toY: 25,
//                       width: 100,
//                       color: Colors.amber,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//     // return Container(
//     //   margin: const EdgeInsets.fromLTRB(5, 30, 5, 20),
//     //   padding: const EdgeInsets.all(20),
//     //   height: 700,
//     //   width: double.infinity,
//     //   decoration: const BoxDecoration(
//     //     color: Color.fromARGB(255, 10, 41, 57),
//     //     boxShadow: [
//     //       BoxShadow(
//     //         color: Colors.white38,
//     //         spreadRadius: 1,
//     //         blurRadius: 15,
//     //         offset: Offset(0, 3),
//     //       ),
//     //     ],
//     //     borderRadius: BorderRadius.only(
//     //       topLeft: Radius.circular(30),
//     //       bottomRight: Radius.circular(30),
//     //       topRight: Radius.circular(30),
//     //       bottomLeft: Radius.circular(30),
//     //     ),
//     //   ),
//     //   child: Column(
//     //     children: [
//     //       Title(
//     //         color: Color.fromARGB(255, 10, 41, 57),
//     //         child: Text(
//     //           text,
//     //           style: TextStyle(
//     //             color: Color.fromARGB(255, 39, 127, 199),
//     //             fontSize: 20,
//     //             fontWeight: FontWeight.w600,
//     //           ),
//     //         ),
//     //       ),
//     //       // BarChart(
//     //       //   BarChartData(
//     //       //     borderData: FlBorderData(
//     //       //       border: const Border(
//     //       //         top: BorderSide.none,
//     //       //         right: BorderSide.none,
//     //       //         left: BorderSide(width: 1),
//     //       //         bottom: BorderSide(width: 1),
//     //       //       ),
//     //       //     ),
//     //       //     groupsSpace: 10,
//     //       //     barGroups: [
//     //       //       BarChartGroupData(
//     //       //         x: 1,
//     //       //         barRods: [
//     //       //           BarChartRodData(
//     //       //             fromY: 0,
//     //       //             toY: 10,
//     //       //             width: 15,
//     //       //             color: Colors.amber,
//     //       //           ),
//     //       //         ],
//     //       //       ),
//     //       //       BarChartGroupData(
//     //       //         x: 2,
//     //       //         barRods: [
//     //       //           BarChartRodData(
//     //       //             fromY: 0,
//     //       //             toY: 10,
//     //       //             width: 15,
//     //       //             color: Colors.amber,
//     //       //           ),
//     //       //         ],
//     //       //       ),
//     //       //     ],
//     //       //   ),
//     //       // ),
//     //     ],
//     //   ),
//     // );
//   }
// }