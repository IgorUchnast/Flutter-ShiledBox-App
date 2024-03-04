// import 'package:flutter/material.dart';
// import 'package:shield_box/api/sensors_api.dart';

// class ShieldBoxView extends StatefulWidget {
//   const ShieldBoxView({super.key});

//   @override
//   State<ShieldBoxView> createState() => _ShieldBoxViewState();
// }

// class _ShieldBoxViewState extends State<ShieldBoxView> {
//   ShiledBoxService shieldBoxService = ShiledBoxService();
//   late List<ShieldBox> shieldBoxes;

// ignore_for_file: library_private_types_in_public_api

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: FutureBuilder<ListOfShieldBox>(
//           future: shieldBoxService.getShieldBox(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               List<ShieldBox> shieldBoxes = snapshot.data!.shieldBoxes;
//               return Container(
//                 margin: const EdgeInsets.all(20),
//                 height: size.height,
//                 width: double.infinity,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     ...shieldBoxes.map((shieldbox) {
//                       // shieldbox.id;
//                       // shieldbox.shieldBoxName;
//                       shieldbox.temperature;
//                       shieldbox.sensorName;
//                       return Container(
//                         margin: const EdgeInsets.all(10.0),
//                         height: size.height * 0.4,
//                         width: size.width * 0.4,
//                         child: Column(children: [
//                           Text(
//                             shieldbox.sensorName,
//                             style: const TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w800),
//                             textAlign: TextAlign.center,
//                           ),
//                           Text(
//                             "${shieldbox.temperature}",
//                             style: const TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w800),
//                             textAlign: TextAlign.center,
//                           ),
//                         ]),
//                       );
//                     }).toList(),
//                   ],
//                 ),
//               );
//             }
//             return Container(
//               margin: const EdgeInsets.all(20),
//               height: size.height,
//               width: double.infinity,
//               color: Colors.white,
//               child: const CircularProgressIndicator(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shield_box/api/sensors_api.dart';

class ShieldBoxScreen extends StatefulWidget {
  const ShieldBoxScreen({super.key});
  @override
  _ShieldBoxScreenState createState() => _ShieldBoxScreenState();
}

class _ShieldBoxScreenState extends State<ShieldBoxScreen> {
  final ShiledBoxService _shieldBoxService = ShiledBoxService();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shield Box Data'),
      ),
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
              itemCount: snapshot.data!.shieldBoxes.length,
              itemBuilder: (context, index) {
                var shieldBox = snapshot.data!.shieldBoxes[index];
                return ListTile(
                  title: Text(shieldBox.sensorName),
                  subtitle: Text('Temperature: ${shieldBox.temperature}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
      // body: FutureBuilder<ListOfShieldBox>(
      //   future: _shieldBoxService.getShieldBox(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Center(
      //         child: Text('Error: ${snapshot.error}'),
      //       );
      //     } else {
      //       return ListView.builder(
      //         itemCount: snapshot.data!.shieldBoxes.length,
      //         itemBuilder: (context, index) {
      //           var shieldBox = snapshot.data!.shieldBoxes[index];
      //           return ListTile(
      //             title: Text(shieldBox.sensorName),
      //             subtitle: Text('Temperature: ${shieldBox.temperature}'),
      //           );
      //         },
      //       );
      //     }
      //   },
      // ),