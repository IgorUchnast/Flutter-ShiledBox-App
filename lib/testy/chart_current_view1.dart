// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:shield_box/api/sensors_api.dart';
import 'package:shield_box/colors.dart';
// import 'package:flutter_charts/flutter_charts.dart';

class BarChartCurrentView extends StatefulWidget {
  const BarChartCurrentView({super.key});

  @override
  State<BarChartCurrentView> createState() => _BarChartCurrentViewState();
}

class _BarChartCurrentViewState extends State<BarChartCurrentView> {
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
    return StreamBuilder<ListOfShieldBox>(
      stream: _shieldBoxService.shieldBoxStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.shieldBoxes.length,
              itemBuilder: (context, index) {
                var shieldBox = snapshot.data!.shieldBoxes[index];

                final List<BarChartModel> data = [
                  BarChartModel(
                    time: "Current Temperature",
                    temperature: shieldBox.temperature,
                    color: charts.ColorUtil.fromDartColor(
                        Colors.red.withOpacity(0.90)),
                  ),
                ];
                List<charts.Series<BarChartModel, String>> series = [
                  charts.Series(
                    id: "Temperature",
                    data: data,
                    domainFn: (BarChartModel series, _) => series.time,
                    measureFn: (BarChartModel series, _) => series.temperature,
                    colorFn: (BarChartModel series, _) => series.color,
                    // colorFn: (_, __) => charts.MaterialPalette.white,
                  ),
                ];
                return Container(
                  height: 455,
                  width: double.infinity,
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
                          "Current Temperature",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        "${shieldBox.temperature}°C",
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: containerColor,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.white12,
                          //     spreadRadius: 1,
                          //     blurRadius: 15,
                          //     offset: Offset(0, 3),
                          //   )
                          // ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        width: double.infinity,
                        height: 330,
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
                            cornerStrategy:
                                const charts.ConstCornerStrategy(20),
                          ),
                        ),
                      ),
                      // Text(
                      //   "${shieldBox.temperature}°C",
                      //   style: const TextStyle(
                      //     color: Colors.amber,
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
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
