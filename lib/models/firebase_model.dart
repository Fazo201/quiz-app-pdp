// To parse this JSON data, do
//
//     final firebaseModel = firebaseModelFromJson(jsonString);

import 'dart:convert';

FirebaseModel firebaseModelFromJson(String str) => FirebaseModel.fromJson(json.decode(str));

String firebaseModelToJson(FirebaseModel data) => json.encode(data.toJson());

class FirebaseModel {
    String fullName;
    String email;
    String password;

    FirebaseModel({
        required this.fullName,
        required this.email,
        required this.password,
    });

    factory FirebaseModel.fromJson(Map<String, dynamic> json) => FirebaseModel(
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "password": password,
    };
}
