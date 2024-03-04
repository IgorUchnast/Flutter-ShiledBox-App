// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:shield_box/api/sensors_api.dart';
import 'package:shield_box/views/chart_views/chart_current_view.dart';
import 'package:shield_box/colors.dart';
import 'package:shield_box/views/chart_views/linechart_current_view.dart';
import 'package:shield_box/views/chart_views/smoke_view.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePageNew> {
  final ShiledBoxService _shieldBoxService = ShiledBoxService();
  final GlobalKey<LineChartCurrnetViewState> lineChartKey = GlobalKey();
  int _selectedIndex = 0;
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

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: containerColor,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                "images/logo.png",
                color: Colors.white,
                height: 150,
              ),
              const Text(
                "ShieldBox 1",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 200,
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
              // shrinkWrap: true,
              itemCount: snapshot.data!.shieldBoxes.length,
              itemBuilder: (context, index) {
                var shieldBox = snapshot.data!.shieldBoxes[index];
                final List<Widget> _charts = [
                  ChartCurrentView(
                    chartbarheight: shieldBox.temperature,
                    containerheight: 400,
                  ),
                  LineChartCurrnetView(
                    key: lineChartKey,
                    currentTemperature: shieldBox.temperature,
                  ),
                  SmokeView(
                    smokeValue: shieldBox.smokeValue,
                  ),
                ];
                return Container(
                  margin: const EdgeInsets.fromLTRB(5, 30, 5, 20),
                  padding: const EdgeInsets.all(20),
                  height: 600,
                  width: double.maxFinite,
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
                      BottomNavigationBar(
                        backgroundColor: containerColor,
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.bar_chart_sharp,
                              color: Colors.white,
                            ),
                            label: "Current Day",
                            backgroundColor: Colors.white,
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.line_axis_outlined,
                              color: Colors.white,
                            ),
                            label: "Temperature History",
                            backgroundColor: Colors.white,
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              Icons.fireplace,
                              color: Colors.white,
                            ),
                            label: "Smoke",
                            backgroundColor: Colors.white,
                          ),
                        ],
                        currentIndex: _selectedIndex,
                        onTap: _onItemTapped,
                      ),
                      GestureDetector(
                        // onDoubleTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const ChartPage(),
                        //     ),
                        //   );
                        // },
                        child: _charts[_selectedIndex],
                      ),
                      const Text(
                        "ShieldBox1",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 10,
                        ),
                      )
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

// ****************************************
