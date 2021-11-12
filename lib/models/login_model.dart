// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) {
    if (json["status"] == 201) {
      return LoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );
    } else {
      return LoginModel(status: json["status"]);
    }
  }
  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  Data({
    this.idDonators,
    this.nameDonators,
    this.emailDonators,
    required this.jwtTokenDonators,
  });

  String? idDonators;
  String? nameDonators;
  String? emailDonators;
  String jwtTokenDonators;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        idDonators: json["id_donators"],
        nameDonators: json["name_donators"],
        emailDonators: json["email_donators"],
        jwtTokenDonators: json["jwt_token_donators"],
      );

  Map<String, dynamic> toMap() => {
        "id_donators": idDonators,
        "name_donators": nameDonators,
        "email_donators": emailDonators,
        "jwt_token_donators": jwtTokenDonators,
      };
}
