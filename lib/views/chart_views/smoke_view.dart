// import 'package:flutter/material.dart';

// class SmokeView extends StatefulWidget {
//   const SmokeView({
//     super.key,
//     required this.smokeValue,
//   });
//   final double smokeValue;
//   @override
//   State<SmokeView> createState() => SmokeVieweState();
// }

// class SmokeVieweState extends State<SmokeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text(
//                 "${widget.smokeValue}",
//                 style: const TextStyle(
//                   color: Colors.amber,
//                   fontSize: 40,
//                 ),
//               ),
//               const Text(
//                 "Smoke Not Detected",
//                 style: TextStyle(
//                   color: Colors.amber,
//                   fontSize: 25,
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shield_box/colors.dart';

class SmokeView extends StatefulWidget {
  const SmokeView({
    Key? key,
    required this.smokeValue,
  }) : super(key: key);

  final double smokeValue;

  @override
  State<SmokeView> createState() => SmokeVieweState();
}

class SmokeVieweState extends State<SmokeView> {
  @override
  Widget build(BuildContext context) {
    String detectionStatus =
        widget.smokeValue == 1 ? "Smoke Detected" : "Smoke Not Detected";
    Widget smokeStatus = widget.smokeValue == 1
        ? const Icon(
            Icons.fireplace,
            color: Colors.amber,
            size: 100,
          )
        : const Icon(
            Icons.smoke_free,
            color: Colors.amber,
            size: 100,
          );
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 30, 5, 20),
      padding: const EdgeInsets.all(20),
      height: 400,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: containerColor,
        boxShadow: [
          BoxShadow(
            color: Colors.white12,
            spreadRadius: 1,
            blurRadius: 15,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                detectionStatus,
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          smokeStatus
        ],
      ),
    );
  }
}
