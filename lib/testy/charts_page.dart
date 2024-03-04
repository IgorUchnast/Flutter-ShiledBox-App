import 'package:flutter/material.dart';
import 'package:shield_box/api/sensors_api.dart';
import 'package:shield_box/testy/chart_week_view.dart';
import 'package:shield_box/views/chart_views/chart_current_view.dart';
import 'package:shield_box/colors.dart';
// import 'package:shield_box/views/chart_views/chart_current_view1.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerColor,
        title: const Text(
          "ShieldBox",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
          ),
        ),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      backgroundColor: backGroundColor,
      body: StreamBuilder<ListOfShieldBox>(
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
            return ListView.builder(
              itemCount: snapshot.data!.shieldBoxes.length,
              itemBuilder: (context, index) {
                var shieldBox = snapshot.data!.shieldBoxes[index];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ChartCurrentView(
                        chartbarheight: shieldBox.temperature,
                        containerheight: 500,
                      ),
                      const ChartWeekView(
                        text: "Last Week Temperature",
                        // day1: shieldBox.temperature,
                        // day2: shieldBox.temperature,
                        // day3: shieldBox.temperature,
                        // day4: shieldBox.temperature,
                        // day5: shieldBox.temperature,
                        // day6: shieldBox.temperature,
                        // day7: shieldBox.temperature,
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
