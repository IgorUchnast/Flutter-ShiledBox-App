// ignore_for_file: non_constant_identifier_names

class User {
  int? id;
  String? token;
  String? username;
  String? email;
  String? first_name;
  String? last_name;

  User({
    this.email,
    this.first_name,
    this.last_name,
    this.id,
    this.username,
  });

//{"pk":2,"username":"","email":"example1@gmail.com","first_name":"First","last_name":"Last"}
  factory User.fromJson(json) {
    return User(
      email: json["email"],
      first_name: json["first_name"],
      id: json["pk"],
      last_name: json["last_name"],
      username: json["username"],
    );
  }
}
