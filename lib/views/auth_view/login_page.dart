// ignore_for_file: use_build_context_synchronously,

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shield_box/api/auth_api.dart';
import 'package:shield_box/colors.dart';
import 'package:shield_box/models/user_cubit.dart';
import 'package:shield_box/models/user_models.dart';
import 'package:shield_box/testy/theme.dart';
import 'package:shield_box/views/auth_view/forgot_password_page.dart';
import 'package:shield_box/views/auth_view/register_page.dart';
import 'package:shield_box/widgets/error_container.dart';
import 'package:shield_box/views/drawer_view.dart';
import 'package:shield_box/widgets/field.dart';
import 'package:shield_box/widgets/text_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontrollers = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: containerColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            "images/logo.png",
            height: 200,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomField(
            isTrue: false,
            controller: emailcontroller,
            drawerIcons: Icons.email,
            hint: 'Email',
          ),
          CustomField(
            isTrue: true,
            controller: passwordcontrollers,
            drawerIcons: Icons.password_sharp,
            hint: 'Password',
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPassPage(),
                  ),
                );
              },
              child: Text(
                "Did you forget your password?",
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
          //Login
          CustomTextButton(
            onTap: () async {
              var authRes = await userAuth(
                  emailcontroller.text, passwordcontrollers.text);
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
                User user = authRes;
                context.read<UserCubit>().emitUser(user);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const DrawerView();
                    },
                  ),
                );
              }
            },
            title: 'Login',
            margin: const EdgeInsets.only(top: 50),
          ),
          //
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
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Do you want to register?",
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


// class UserCubit extends Cubit<User> {
//   UserCubit(super.initialState);
//   void emitUser(user) => emit(user);
//   // UserCubit(User initialState) : super(initialState);
// }
