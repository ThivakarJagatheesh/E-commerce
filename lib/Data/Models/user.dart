// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        this.username,
        this.password,
        this.token
    });

    final String? username;
    final String? password;
    final String? token;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        // username: json["username"],
        // password: json["password"],
        token: json["token"]
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
