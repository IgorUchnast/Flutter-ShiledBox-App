// ignore_for_file: prefer_const_constructors

// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
// import 'package:fl_chart_app/util/extensions/color_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shield_box/colors.dart';

class ChartCurrentView extends StatefulWidget {
  const ChartCurrentView({
    super.key,
    required this.chartbarheight,
    required this.containerheight,
  });
  final double chartbarheight;
  final double containerheight;

  @override
  State<ChartCurrentView> createState() => _ChartCurrentViewState();
}

class _ChartCurrentViewState extends State<ChartCurrentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 30, 5, 20),
      padding: const EdgeInsets.all(20),
      height: widget.containerheight,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: containerColor,
        boxShadow: [
          BoxShadow(
            color: Colors.white12,
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
      child: Container(
        padding: EdgeInsets.all(15),
        child: BarChart(
          BarChartData(
            barTouchData: barTouchData,
            titlesData: titlesData,
            borderData: borderData,
            barGroups: barGroups,
            gridData: FlGridData(show: true),
            alignment: BarChartAlignment.spaceAround,
            maxY: 40,
          ),
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.toString(),
              const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.w700,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.amber,
      fontWeight: FontWeight.w700,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Current Temperature';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: const [
          // Colors.white38,
          Colors.white,
          Colors.amber,
          Colors.red,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              fromY: 0,
              toY: widget.chartbarheight,
              width: 150,
              gradient: _barsGradient,
              borderRadius: BorderRadius.circular(15),
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

// class BarChartSample3 extends StatefulWidget {
//   const BarChartSample3({super.key});

//   @override
//   State<StatefulWidget> createState() => BarChartSample3State();
// }

// class BarChartSample3State extends State<BarChartSample3> {
//   @override
//   Widget build(BuildContext context) {
//     return const AspectRatio(
//       aspectRatio: 1.6,
//       child: BarChartView(),
//     );
//   }
// }
