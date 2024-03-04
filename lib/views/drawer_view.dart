import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shield_box/colors.dart';
import 'package:shield_box/example.dart';
import 'package:shield_box/home_page_new.dart';
import 'package:shield_box/views/auth_view/login_page.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  double value = 0;
  String nickname = "Igor Uchnast";
  // var UserData = ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: Stack(
          children: [
            Container(
              width: 200,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          nickname,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: const [
                        DraweListTitle(
                          textDrawer: "home",
                          drawerIcons: Icons.home,
                          nextPage: HomePageNew(),
                        ),
                        DraweListTitle(
                          textDrawer: "log out",
                          drawerIcons: Icons.logout,
                          nextPage: SignInPage(),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        DraweListTitle(
                          textDrawer: "ShieldBox1",
                          drawerIcons: Icons.arrow_back_ios,
                          nextPage: DrawerView(),
                        ),
                        DraweListTitle(
                          textDrawer: "ShieldBox2",
                          drawerIcons: Icons.arrow_back_ios,
                          nextPage: ShieldBox2(),
                        ),
                        // DraweListTitle(
                        //   textDrawer: "Add new shieldbox",
                        //   drawerIcons: Icons.add_box,
                        //   nextPage: ShieldBox2(),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: 0,
                end: value,
              ),
              duration: const Duration(milliseconds: 500),
              builder: (_, val, __) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: const HomePageNew(),
                );
              },
            ),
            GestureDetector(
              onHorizontalDragUpdate: (e) {
                if (e.delta.dx > 0) {
                  setState(
                    () {
                      value = 1;
                    },
                  );
                } else {
                  setState(() {
                    value = 0;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DraweListTitle extends StatefulWidget {
  const DraweListTitle(
      {super.key,
      required this.textDrawer,
      required this.drawerIcons,
      required this.nextPage});
  final String textDrawer;
  final IconData drawerIcons;
  final Widget nextPage;

  @override
  State<DraweListTitle> createState() => _DraweListTitleState();
}

class _DraweListTitleState extends State<DraweListTitle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget.nextPage,
          ),
        );
      },
      leading: Icon(
        widget.drawerIcons,
        color: Colors.white,
      ),
      title: Text(
        widget.textDrawer,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
