// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromMap(jsonString);

import 'dart:convert';

class TokenModel {
  TokenModel({
    this.status,
  });

  int? status;

  factory TokenModel.fromJson(String str) =>
      TokenModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TokenModel.fromMap(Map<String, dynamic> json) => TokenModel(
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
      };
}
