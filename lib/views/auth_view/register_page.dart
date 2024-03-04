// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shield_box/api/auth_api.dart';
import 'package:shield_box/colors.dart';
import 'package:shield_box/models/user_cubit.dart';
import 'package:shield_box/models/user_models.dart';
import 'package:shield_box/testy/theme.dart';
import 'package:shield_box/views/auth_view/login_page.dart';
import 'package:shield_box/widgets/error_container.dart';
import 'package:shield_box/widgets/field.dart';
import 'package:shield_box/widgets/text_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: containerColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: Image.asset(
              "images/logo.png",
              height: 200,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomField(
            isTrue: false,
            drawerIcons: Icons.account_circle,
            hint: 'Nickname',
            controller: nicknameController,
          ),
          CustomField(
            isTrue: false,
            drawerIcons: Icons.email,
            hint: 'Email',
            controller: emailController,
          ),
          CustomField(
            isTrue: false,
            drawerIcons: Icons.password,
            hint: 'Password',
            controller: passwordController,
          ),
          CustomField(
            isTrue: false,
            drawerIcons: Icons.password,
            hint: 'Confirm Password',
            controller: confirmController,
          ),
          CustomTextButton(
            title: 'Register',
            margin: const EdgeInsets.only(top: 50),
            onTap: () async {
              var authRes = await registerUser(
                emailController.text,
                passwordController.text,
                confirmController.text,
                nicknameController.text,
              );
              if (authRes.runtimeType == String) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: ContainerError(txt: authRes),
                    );
                  },
                );
              } else if (authRes.runtimeType == User) {
                User user = authRes as User;
                context.read<UserCubit>().emitUser(user);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignInPage();
                    },
                  ),
                );
              } else if (authRes[0] == 204) {
                // User user = authRes;
                // context.read<UserCubit>().emitUser(user);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignInPage();
                    },
                  ),
                );
                // } else if (authRes[0] < 200 || authRes[0] > 300) {
                // } else if (authRes[1]["1"] == String) {
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Dialog(
                      // child: ContainerError(
                      //   txt: authRes[1]["1"],
                      // ),
                      child: ContainerError(
                        txt: "Something is wrong!\n   Please try again.",
                      ),
                    );
                  },
                );
              }
            },
            // onTap: () async {
            //   var authRes = await registerUser(
            //     emailController.text,
            //     // nicknameController.text,
            //     passwordController.text,
            //     confirmController.text,
            //   );

            //   if (authRes.runtimeType == String) {
            //     showDialog(
            //       context: context,
            //       builder: (context) {
            //         return Dialog(
            //           child: ContainerError(txt: authRes),
            //         );
            //       },
            //     );
            //   } else if (authRes.runtimeType == User) {
            //     User user = authRes;
            //     context.read<UserCubit>().emitUser(user);
            //     Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) {
            //         return const SignInPage();
            //       },
            //     ));
            //   }
            // },
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 40,
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
                    "Do you want to login?",
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
    );
  }
}
