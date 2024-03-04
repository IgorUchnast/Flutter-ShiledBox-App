// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shield_box/constants.dart';

// class ShiledBoxService {
//   Future<ListOfShieldBox> getShieldBox() async {
//     var response1 =
//         await http.get(Uri.parse("$baseUrl/shieldbox/devices/1/sensors"));
//     // var response2 = await http.get(Uri.parse("$baseUrl/shieldbox/devices/"));
//     // print(response2.body);
//     // print(response1.body);
//     return ListOfShieldBox.fromList(
//       jsonDecode(
//           // const Utf8Decoder().convert(response1.bodyBytes),
//           response1.body),
//     );
//   }
// }

class ShiledBoxService1 {
  final StreamController<ListOfShieldBox> _shieldBoxStreamController =
      StreamController();

  Stream<ListOfShieldBox> get shieldBoxStream =>
      _shieldBoxStreamController.stream;

  Future<ListOfShieldBox> getShieldBox() async {
    var response2 =
        await http.get(Uri.parse("$baseUrl/shieldbox/devices/2/sensors"));
    print("ShieldBox2 ${response2.body}");
    // print(response2.statusCode);
    return ListOfShieldBox.fromList(jsonDecode(response2.body));
  }

  Future<void> startListening() async {
    ListOfShieldBox initialData = await getShieldBox();
    _shieldBoxStreamController.add(initialData);

    Timer.periodic(const Duration(seconds: 1), (timer) async {
      ListOfShieldBox newData = await getShieldBox();
      _shieldBoxStreamController.add(newData);
    });
  }

  void dispose() {
    _shieldBoxStreamController.close();
  }
}

class ListOfShieldBox {
  List<ShieldBox1> shieldBoxes;
  ListOfShieldBox({required this.shieldBoxes});
  factory ListOfShieldBox.fromList(List list) {
    List<ShieldBox1> _shieldBoxes = [];
    list.forEach((element) {
      _shieldBoxes.add(ShieldBox1.fromJson(element));
    });
    return ListOfShieldBox(shieldBoxes: _shieldBoxes);
  }
}

class ShieldBox1 {
  // int id;
  // String shieldBoxName;
  String sensorName;
  double temperature;
  double smokeValue;

  ShieldBox1({
    // required this.id,
    // required this.shieldBoxName,
    required this.sensorName,
    required this.temperature,
    required this.smokeValue,
  });

  factory ShieldBox1.fromJson(map) {
    return ShieldBox1(
        // id: map["id"],
        // shieldBoxName: map["name"],
        sensorName: map["name"],
        temperature: map["value"],
        smokeValue: map["smoke_value"]);
  }
}
