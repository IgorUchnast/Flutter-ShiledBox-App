import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:shield_box/api/sensors_api.dart';
import 'package:shield_box/colors.dart';
// import 'package:flutter_charts/flutter_charts.dart';

class BarChartWeekView extends StatefulWidget {
  const BarChartWeekView({
    super.key,
    required this.temperatureDay1,
    required this.temperatureDay2,
    required this.temperatureDay3,
    required this.temperatureDay4,
    required this.temperatureDay5,
    required this.temperatureDay6,
    required this.temperatureDay7,
  });
  final double temperatureDay1;
  final double temperatureDay2;
  final double temperatureDay3;
  final double temperatureDay4;
  final double temperatureDay5;
  final double temperatureDay6;
  final double temperatureDay7;
  @override
  State<BarChartWeekView> createState() => _BarChartWeekViewState();
}

class _BarChartWeekViewState extends State<BarChartWeekView> {
  final ShiledBoxService _shieldBoxService = ShiledBoxService();
  @override
  void initState() {
    super.initState();
    _shieldBoxService.startListening();
  }

  @override
  void dispose() {
    _shieldBoxService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<BarChartModel> data = [
      BarChartModel(
        time: "Current Temperature1",
        temperature: widget.temperatureDay1,
        color: charts.ColorUtil.fromDartColor(Colors.red.withOpacity(0.90)),
      ),
      BarChartModel(
        time: "Current Temperature2",
        temperature: widget.temperatureDay2,
        color: charts.ColorUtil.fromDartColor(Colors.red.withOpacity(0.90)),
      ),
      BarChartModel(
        time: "Current Temperature3",
        temperature: widget.temperatureDay3,
        color: charts.ColorUtil.fromDartColor(Colors.red.withOpacity(0.90)),
      ),
      BarChartModel(
        time: "Current Temperature4",
        temperature: widget.temperatureDay4,
        color: charts.ColorUtil.fromDartColor(Colors.red.withOpacity(0.90)),
      ),
      BarChartModel(
        time: "Current Temperature5",
        temperature: widget.temperatureDay5,
        color: charts.ColorUtil.fromDartColor(Colors.red.withOpacity(0.90)),
      ),
      BarChartModel(
        time: "Current Temperature6",
        temperature: widget.temperatureDay6,
        color: charts.ColorUtil.fromDartColor(Colors.red.withOpacity(0.90)),
      ),
      BarChartModel(
        time: "Current Temperature7",
        temperature: widget.temperatureDay7,
        color: charts.ColorUtil.fromDartColor(Colors.red.withOpacity(0.90)),
      ),
    ];
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "Temperature",
        data: data,
        domainFn: (BarChartModel series, _) => series.time,
        measureFn: (BarChartModel series, _) => series.temperature,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];
    return Scaffold(
      body: Container(
        // height: 300,
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
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
        child: Column(
          children: [
            Title(
              color: containerColor,
              child: const Text(
                "Last Week Temperature",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              constraints: const BoxConstraints(
                maxHeight: 200, // Set your maximum height here
              ),
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
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              width: double.maxFinite,
              // height: 200,
              child: charts.BarChart(
                series,
                animate: true,
                domainAxis: const charts.OrdinalAxisSpec(
                  renderSpec: charts.NoneRenderSpec(),
                ),
                primaryMeasureAxis: const charts.NumericAxisSpec(
                  renderSpec: charts.SmallTickRendererSpec(
                    labelStyle: charts.TextStyleSpec(fontSize: 20),
                    tickLengthPx: 6,
                  ),
                ),
                defaultRenderer: charts.BarRendererConfig(
                  groupingType: charts.BarGroupingType.grouped,
                  strokeWidthPx: 1.0,
                  minBarLengthPx: 50,
                  cornerStrategy: const charts.ConstCornerStrategy(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BarChartModel {
  String time;
  double temperature;
  final charts.Color color;

  BarChartModel({
    required this.time,
    required this.temperature,
    required this.color,
  });
}
