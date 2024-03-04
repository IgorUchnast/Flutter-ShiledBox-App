// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shield_box/views/chart_views/chart_current_view.dart';
// import 'package:shield_box/views/chart_views/chart_current_view1.dart';
import 'package:shield_box/testy/chart_week_view.dart';
// import 'package:shield_box/views/chart_views/chart_week_view2.dart';
import 'package:shield_box/testy/charts_page.dart';
import 'package:shield_box/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _charts = [
    // BarChartCurrentView(),
    const ChartCurrentView(
      chartbarheight: 26.5,
      containerheight: 400,
    ),
    const ChartWeekView(text: "Last Week Temperature"),
    // BarChartWeekView()
  ];

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
                "ShieldBox",
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
      body: Container(
        margin: const EdgeInsets.fromLTRB(5, 30, 5, 20),
        padding: const EdgeInsets.all(20),
        height: double.infinity,
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
                    Icons.bar_chart_sharp,
                    color: Colors.white,
                  ),
                  label: "Last Week",
                  backgroundColor: Colors.white,
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            GestureDetector(
              onDoubleTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChartPage(),
                  ),
                );
              },
              child: _charts[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
