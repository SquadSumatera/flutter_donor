// To parse this JSON data, do
//
//     final googleSignInModel = googleSignInModelFromMap(jsonString);

import 'dart:convert';

class GoogleSignInModel {
  GoogleSignInModel({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  int? status;
  String? message;
  Data? data;
  String? token;

  factory GoogleSignInModel.fromJson(String str) =>
      GoogleSignInModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GoogleSignInModel.fromMap(Map<String, dynamic> json) {
    if (json["status"] == 201) {
      return GoogleSignInModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
        token: json["data"]["jwt_token_donators"],
      );
    } else {
      return GoogleSignInModel(
        status: json["status"],
        message: json["message"],
      );
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
    this.jwtTokenDonators,
  });

  String? idDonators;
  String? nameDonators;
  String? emailDonators;
  String? jwtTokenDonators;

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
