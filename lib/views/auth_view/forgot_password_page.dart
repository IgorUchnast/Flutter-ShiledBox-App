// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:shield_box/testy/theme.dart';
import 'package:shield_box/views/auth_view/login_page.dart';
import 'package:shield_box/widgets/field.dart';
import 'package:shield_box/widgets/text_button.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Reset Password Sekarang",
              style: whiteTextStyle.copyWith(
                fontSize: 30,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomField(
              isTrue: false,
              drawerIcons: Icons.logout,
              hint: 'Email',
            ),
            CustomTextButton(
              title: 'Reset Password',
              margin: EdgeInsets.only(top: 50),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 74,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()),
                      );
                    },
                    child: Text(
                      "Kembali Ke Halaman Login",
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
