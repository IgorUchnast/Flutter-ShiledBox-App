// ignore_for_file: unused_local_variable, avoid_print, non_constant_identifier_names
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shield_box/constants.dart';
import 'package:shield_box/models/user_models.dart';

// const baseUrl = "http://127.0.0.1:8000";

Future<dynamic> userAuth(String email, String password) async {
  Map body = {
    // "username": "",
    "email": email,
    "password": password,
  };
  var url = Uri.parse("$baseUrl/user/auth/login/");
  var res = await http.post(url, body: body);

  print(res.body);
  print(res.statusCode);

  if (res.statusCode == 200) {
    Map json = jsonDecode(res.body);
    String token = json['key'];
    var box = await Hive.openBox(authBox);
    box.put("token", token);
    User? user = await getUser(token);
    return user;
  } else {
    Map json = jsonDecode(res.body);
    if (json.containsKey("email")) {
      return json["email"][0];
    }
    if (json.containsKey("password")) {
      return json["password"][0];
    }
    if (json.containsKey("non_field_errors")) {
      return json["non_field_errors"][0];
    }
  }
}

Future<User?> getUser(String token) async {
  var url = Uri.parse("$baseUrl/user/auth/user/");
  var res = await http.get(
    url,
    headers: {
      "Authorization": "Token $token",
    },
  );
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);

    User user = User.fromJson(json);
    user.token = token;
    return user;
  } else {
    return null;
  }
}

Future<dynamic> registerUser(
  String email,
  String password,
  String confirm_password,
  String nickname,
) async {
  Map<String, dynamic> data = {
    "email": email,
    "password1": password,
    "password2": confirm_password,
    "nickname": nickname,
  };

  var url = Uri.parse("$baseUrl/user/auth/registration/");
  var res = await http.post(url, body: data);
  // res.statusCode == 204?
  print(data);
  print(res.statusCode);
  print(res.body);
  if (res.statusCode == 200 || res.statusCode == 201) {
    Map json = jsonDecode(res.body);
    if (json.containsKey("key")) {
      String token = json["key"];
      var temp_user = await getUser(token);
      if (temp_user != null) {
        User user = temp_user;
        return user;
      } else {
        return null;
      }
    }
  } else if (res.statusCode == 204) {
    return [res.statusCode, data];
  } else if (res.statusCode == 400) {
    // Map json = jsonDecode(res.body);
    // if (json.containsKey("email")) {
    //   return json["email"][0];
    // } else if (json.containsKey("password")) {
    //   return json["password"][0];
    // }

    Map<String, dynamic> data1 = {};
    data1["1"] = res.body;
    print(data1["1"]);
    return [res.statusCode, data1];
  } else {
    print(res.statusCode);
    return null;
  }
}
// Future<dynamic> registerUser(
//   String email,
//   String password,
//   String confirm_password,
//   String nickname,
// ) async {
//   Map<String, dynamic> data = {
//     "email": email,
//     "password1": password,
//     "password2": confirm_password,
//     "nickname": nickname,
//   };

//   var url = Uri.parse("$baseUrl/user/auth/registration/");
//   var res = await http.post(url, body: data);
//   // res.statusCode == 204?
//   print(data);
//   print(res.statusCode);
//   print(res.body);
//   if (res.statusCode == 200 || res.statusCode == 201) {
//     Map json = jsonDecode(res.body);
//     if (json.containsKey("key")) {
//       String token = json["key"];
//       var temp_user = await getUser(token);
//       if (temp_user != null) {
//         User user = temp_user;
//         return user;
//       } else {
//         return null;
//       }
//     }
//   } else if (res.statusCode == 400) {
//     Map json = jsonDecode(res.body);
//     if (json.containsKey("email")) {
//       return json["email"][0];
//     } else if (json.containsKey("password")) {
//       return json["password"][0];
//     }
//   } else {
//     print(res.statusCode);
//     return null;
//   }
// }

// 3f368deb84975b5ab0dfe97eed899ad367489c60
// {"pk":3,"username":"","email":"testy.aplikacji.ma@gmail.com","first_name":"igor","last_name":"Olgierd"}
// emial: testy.aplikacji.ma@gmail.com
// haslo: ShieldBox2023