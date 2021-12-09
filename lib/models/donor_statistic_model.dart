// To parse this JSON data, do
//
//     final statisticDonorModel = statisticDonorModelFromMap(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

class DonorStatisticModel {
  DonorStatisticModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<ListData>? data;

  factory DonorStatisticModel.fromJson(String str) =>
      DonorStatisticModel.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory DonorStatisticModel.fromMap(Map<String, dynamic> json) =>
      DonorStatisticModel(
        status: json["status"],
        message: json["message"],
        data: List<ListData>.from(json["data"].map((x) => ListData.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //     "status": status,
  //     "message": message,
  //     "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  // };
}

class ListData {
  ListData({
    this.periods,
    this.counts,
  });

  DateTime? periods;
  int? counts;

  String get months {
    if (periods == null) {
      return "--/--/----";
    } else {
      return DateFormat("MMM", "id").format(periods!);
    }
  }

  factory ListData.fromJson(String str) => ListData.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory ListData.fromMap(Map<String, dynamic> json) => ListData(
        periods: DateTime.parse(json["periods"]),
        counts: json["counts"],
      );

  // Map<String, dynamic> toMap() => {
  //     "periods": "${periods.year.toString().padLeft(4, '0')}-${periods.month.toString().padLeft(2, '0')}-${periods.day.toString().padLeft(2, '0')}",
  //     "counts": counts,
  // };
}
