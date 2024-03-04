import 'package:flutter/material.dart';
import 'package:shield_box/colors.dart';

class ContainerError extends StatelessWidget {
  const ContainerError({
    super.key,
    required this.txt,
  });

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      height: 200,
      width: 600,
      decoration: const BoxDecoration(
        color: Colors.white,
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
            color: Colors.white,
            child: const Text(
              "Error",
              style: TextStyle(
                color: backGroundColor,
                fontWeight: FontWeight.w500,
                fontSize: 40,
              ),
            ),
          ),
          const Divider(
            color: backGroundColor,
          ),
          Text(
            txt,
            style: const TextStyle(
              color: backGroundColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
