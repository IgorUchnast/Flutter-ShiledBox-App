import 'package:flutter/material.dart';
import 'package:shield_box/colors.dart';
import 'package:shield_box/views/auth_view/login_page.dart';
import 'package:shield_box/views/auth_view/register_page.dart';
// import 'package:shield_box/views/drawer_view.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: containerColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.png",
              color: Colors.white,
              height: 200,
            ),
            const ButtonStart(
              text: "login",
              widgetAuth: SignInPage(),
            ),
            const ButtonStart(
              text: "register",
              widgetAuth: SignUpPage(),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonStart extends StatelessWidget {
  const ButtonStart({
    super.key,
    required this.text,
    required this.widgetAuth,
  });
  final Widget widgetAuth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      color: Colors.white,
      height: 30,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widgetAuth,
            ),
          );
        },
        child: Text(
          text,
        ),
      ),
    );
  }
}
