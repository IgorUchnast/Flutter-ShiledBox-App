import 'package:flutter/material.dart';
import 'package:shield_box/testy/theme.dart';

class CustomField extends StatelessWidget {
  final IconData drawerIcons;
  final String hint;
  final TextEditingController? controller;
  final bool isTrue;

  const CustomField({
    super.key,
    this.controller,
    required this.drawerIcons,
    this.hint = '',
    required this.isTrue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(
          color: kWhiteColor,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Container(
            height: 26,
            width: 26,
            margin: const EdgeInsets.only(right: 18),
            child: Icon(
              drawerIcons,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: TextFormField(
              obscureText: isTrue,
              controller: controller,
              decoration: InputDecoration.collapsed(
                hintText: hint,
                hintStyle: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
