// To parse this JSON data, do
//
//     final statisticDonorModel = statisticDonorModelFromMap(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

class DonorStatisticModel {
  DonorStatisticModel({
    this.status,
    this.message,
    this.pointer,
    this.dataStatistics,
  });

  int? status;
  String? message;
  List<int>? pointer;
  List<DataStatistics>? dataStatistics;

  factory DonorStatisticModel.fromJson(String str) =>
      DonorStatisticModel.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory DonorStatisticModel.fromMap(Map<String, dynamic> json) =>
      DonorStatisticModel(
        status: json["status"],
        message: json["message"],
        pointer: List<int>.from(
          json["data"]["pointers"].map((x) => x),
        ),
        dataStatistics: List<DataStatistics>.from(
          json["data"]["statistics"].map(
            (x) => DataStatistics.fromMap(x),
          ),
        ),
      );

  // Map<String, dynamic> toMap() => {
  //     "status": status,
  //     "message": message,
  //     "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  // };
}

class DataStatistics {
  DataStatistics({
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

  factory DataStatistics.fromJson(String str) =>
      DataStatistics.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory DataStatistics.fromMap(Map<String, dynamic> json) => DataStatistics(
        periods: DateTime.parse(json["periods"]),
        counts: json["counts"],
      );

  // Map<String, dynamic> toMap() => {
  //     "periods": "${periods.year.toString().padLeft(4, '0')}-${periods.month.toString().padLeft(2, '0')}-${periods.day.toString().padLeft(2, '0')}",
  //     "counts": counts,
  // };
}
