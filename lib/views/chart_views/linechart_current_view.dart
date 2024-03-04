import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shield_box/colors.dart';
// import 'package:intl/intl.dart';

class LineChartCurrnetView extends StatefulWidget {
  const LineChartCurrnetView({
    super.key,
    required this.currentTemperature,
  });

  final double currentTemperature;

  @override
  State<LineChartCurrnetView> createState() => LineChartCurrnetViewState();
}

class LineChartCurrnetViewState extends State<LineChartCurrnetView> {
  List<FlSpot> spots = []; // List to hold temperature spots

  @override
  void initState() {
    super.initState();
    // Add initial temperature data
    spots.add(FlSpot(0, widget.currentTemperature));
  }

  @override
  void didUpdateWidget(covariant LineChartCurrnetView oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update the chart when new temperature data is received
    spots.add(FlSpot(spots.length.toDouble(), widget.currentTemperature));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: containerColor,
      height: 400,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxY: 50,
          minY: 0,
          titlesData: LineTitles.getTitlesData(),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey,
                strokeWidth: 0.5,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey,
                strokeWidth: 0.5,
              );
            },
          ),
          borderData: FlBorderData(
            border: Border.all(
              color: Colors.amber,
              width: 0.5,
            ),
            show: true,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              dotData: FlDotData(show: false),
              color: Colors.amber,
              barWidth: 1,
              belowBarData: BarAreaData(
                show: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LineTitles {
  static FlTitlesData getTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          // reservedSize: 10,
          getTitlesWidget: (value, meta) {
            switch (value.toInt()) {
              case 0:
                return const Text(
                  "start",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                );
              // case 2:
              //   return const Text(
              //     "4h",
              //     style: TextStyle(
              //       color: Colors.amber,
              //     ),
              //   );
              // case 4:
              //   return const Text(
              //     "3h",
              //     style: TextStyle(
              //       color: Colors.amber,
              //     ),
              //   );
              // case 6:
              //   return const Text(
              //     "2h",
              //     style: TextStyle(
              //       color: Colors.amber,
              //     ),
              //   );
              // case 8:
              //   return const Text(
              //     "1h",
              //     style: TextStyle(
              //       color: Colors.amber,
              //     ),
              //   );
              // case 10:
              //   return const Text(
              //     "now",
              //     style: TextStyle(
              //       color: Colors.amber,
              //     ),
              //   );
            }
            return const Text("");
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          getTitlesWidget: (value, meta) {
            switch (value.toInt()) {
              case 0:
                return const Text(
                  "0℃",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                );
              case 10:
                return const Text(
                  "10℃",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                );
              case 20:
                return const Text(
                  "20℃",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                );
              case 30:
                return const Text(
                  "30℃",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                );
              case 40:
                return const Text(
                  "40℃",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                );
              case 50:
                return const Text(
                  "50℃",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                );
            }
            return const Text("");
          },
        ),
      ),
    );
  }
}
