// To parse this JSON data, do
//
//     final pointUser = pointUserFromMap(jsonString);

import 'dart:convert';

class PointUser {
  PointUser({
    required this.status,
    required this.message,
    required this.skor,
  });

  int status;
  String message;
  int skor;

  factory PointUser.fromJson(String str) => PointUser.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory PointUser.fromMap(Map<String, dynamic> json) {
    return PointUser(
      status: json["status"],
      message: json["message"],
      skor: json["data"]["skor"],
    );
  }
  // Map<String, dynamic> toMap() => {
  //       "status": status,
  //       "message": message,
  //       "data": data.toMap(),
  //     };
}

// class Data {
//   Data({
//     required this.skor,
//   });

//   int skor;

//   factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Data.fromMap(Map<String, dynamic> json) => Data(
//         skor: json["skor"],
//       );

//   Map<String, dynamic> toMap() => {
//         "skor": skor,
//       };
// }
