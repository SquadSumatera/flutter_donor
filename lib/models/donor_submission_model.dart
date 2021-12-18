

// To parse this JSON data, do
//
//     final donorSubmissionModel = donorSubmissionModelFromMap(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

class DonorSubmissionModel {
  DonorSubmissionModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  DataSubmission? data;

  factory DonorSubmissionModel.fromJson(String str) =>
      DonorSubmissionModel.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory DonorSubmissionModel.fromMap(Map<String, dynamic> json) =>
      DonorSubmissionModel(
        status: json["status"],
        message: json["message"],
        data: DataSubmission.fromMap(json["data"]),
      );

// Map<String, dynamic> toMap() => {
//     "status": status,
//     "message": message,
//     "data": data == null ? null : data!.toMap(),
// };
}

class DataSubmission {
  DataSubmission({
    this.startPeriods,
    this.endPeriods,
    this.donorSubmissions,
    this.bloodsCounts,
  });

  DateTime? startPeriods;
  DateTime? endPeriods;
  int? donorSubmissions;
  int? bloodsCounts;

  String get last {
    if (endPeriods == null) {
      return "--/--/----";
    } else {
      return DateFormat("dd/M/yyyy", "id").format(endPeriods!);
    }
  }

  factory DataSubmission.fromJson(String str) =>
      DataSubmission.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory DataSubmission.fromMap(Map<String, dynamic> json) => DataSubmission(
    startPeriods: DateTime.parse(json["start_periods"]),
    endPeriods: DateTime.parse(json["end_periods"]),
    donorSubmissions: json["donor_submissions"],
    bloodsCounts: json["bloods_counts"],
  );

// Map<String, dynamic> toMap() => {
//     "start_periods": "${startPeriods.year.toString().padLeft(4, '0')}-${startPeriods.month.toString().padLeft(2, '0')}-${startPeriods.day.toString().padLeft(2, '0')}",
//     "end_periods": "${endPeriods.year.toString().padLeft(4, '0')}-${endPeriods.month.toString().padLeft(2, '0')}-${endPeriods.day.toString().padLeft(2, '0')}",
//     "donor_submissions": donorSubmissions,
//     "bloods_counts": bloodsCounts,
// };
}