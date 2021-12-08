// To parse this JSON data, do
//
//     final requestHistoryModel = requestHistoryModelFromJson(jsonString?);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/theme.dart';
import 'profile_model.dart';

// 'waiting_confirmation', -> saat ketika melakukan pendaftaran donor request
// 'registered', -> kondisi ketika diterima oleh admin dan dijadwalkan pengambilan
// 'conditions_rejected', -> kondisi ketika ditolak admin karna perlu revisi pada data dan syarat
// 'canceled', -> kondisi dibatalkan (bisa oleh admin atau user)
// 'finished' -> ketika sudah diambil

class SubmissionHistoryStatus {
  static const String canceled = 'canceled';
  static const String conditionsRejected = 'conditions_rejected';
  static const String finished = 'finished';
  static const String registered = 'registered';
  static const String waitingConfirmation = 'waiting_confirmation';
}

class SubmissionHistoryModel {
  SubmissionHistoryModel({
    this.idDonorSubmissions,
    this.idDonators,
    this.idInstitutions,
    this.recipientDonorSubmissions,
    this.applicantDonorSubmissions,
    this.bloodTypeDonorSubmissions,
    this.bloodRhesusDonorSubmissions,
    this.quantityDonorSubmissions,
    this.statusDonorSubmissions,
    this.scheduleDonorSubmissions,
    this.forDonators,
    this.forInstitution,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? idDonorSubmissions;
  String? idDonators;
  String? idInstitutions;
  String? recipientDonorSubmissions;
  String? applicantDonorSubmissions;
  String? bloodTypeDonorSubmissions;
  String? bloodRhesusDonorSubmissions;
  int? quantityDonorSubmissions;
  String? statusDonorSubmissions;
  DateTime? scheduleDonorSubmissions;
  dynamic forDonators;
  dynamic forInstitution;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Color get designatedColor {
    switch (statusDonorSubmissions) {
      case SubmissionHistoryStatus.waitingConfirmation:
        return AppColor.imperialRed;
      case SubmissionHistoryStatus.registered:
        return AppColor.cBlue;
      case SubmissionHistoryStatus.conditionsRejected:
        return AppColor.camelotRed;
      case SubmissionHistoryStatus.canceled:
        return AppColor.camelotRed;
      case SubmissionHistoryStatus.finished:
        return AppColor.cGreen;
      default:
        return Colors.grey;
    }
  }

  String? get showRhesus {
    Map<String, String> _rhesusList = {
      ProfileRhesusType.positive: "+",
      ProfileRhesusType.negative: "-",
    };
    return _rhesusList[bloodRhesusDonorSubmissions];
  }

  String? get showRhesusText {
    Map<String, String> _rhesusList = {
      ProfileRhesusType.positive: "Positif",
      ProfileRhesusType.negative: "Negatif",
    };
    return _rhesusList[bloodRhesusDonorSubmissions];
  }

  String get showBloodType {
    return "$bloodTypeDonorSubmissions$showRhesus";
  }

  String dateFormatterString(DateTime? date) {
    if (date == null) {
      return "--/--/----";
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  String dateFormatterString2(DateTime? date) {
    if (date == null) {
      return "--/--/----";
    } else {
      return DateFormat('dd MMMM yyyy', 'id').format(date);
    }
  }

  String get showCreatedDate {
    return dateFormatterString(createdAt);
  }

  String get showScheduledDate {
    return dateFormatterString2(scheduleDonorSubmissions);
  }

  String get showStatus {
    Map<String, String> _status = {
      SubmissionHistoryStatus.canceled: 'Dibatalkan',
      SubmissionHistoryStatus.conditionsRejected:
          'Ditolak karena tidak memenuhi persyaratan',
      SubmissionHistoryStatus.finished: 'Selesai',
      SubmissionHistoryStatus.registered:
          'Terjadwalkan Tanggal $showScheduledDate',
      SubmissionHistoryStatus.waitingConfirmation: 'Menunggu Konfirmasi',
    };

    return _status[statusDonorSubmissions] ?? "-";
  }

  SubmissionHistoryModel copyWith({
    String? idDonorSubmissions,
    String? idDonators,
    String? idInstitutions,
    String? recipientDonorSubmissions,
    String? applicantDonorSubmissions,
    String? bloodTypeDonorSubmissions,
    String? bloodRhesusDonorSubmissions,
    int? quantityDonorSubmissions,
    String? statusDonorSubmissions,
    DateTime? scheduleDonorSubmissions,
    dynamic forDonators,
    dynamic forInstitution,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      SubmissionHistoryModel(
        idDonorSubmissions: idDonorSubmissions ?? this.idDonorSubmissions,
        idDonators: idDonators ?? this.idDonators,
        idInstitutions: idInstitutions ?? this.idInstitutions,
        recipientDonorSubmissions:
            recipientDonorSubmissions ?? this.recipientDonorSubmissions,
        applicantDonorSubmissions:
            applicantDonorSubmissions ?? this.applicantDonorSubmissions,
        bloodTypeDonorSubmissions:
            bloodTypeDonorSubmissions ?? this.bloodTypeDonorSubmissions,
        bloodRhesusDonorSubmissions:
            bloodRhesusDonorSubmissions ?? this.bloodRhesusDonorSubmissions,
        quantityDonorSubmissions:
            quantityDonorSubmissions ?? this.quantityDonorSubmissions,
        statusDonorSubmissions:
            statusDonorSubmissions ?? this.statusDonorSubmissions,
        scheduleDonorSubmissions:
            scheduleDonorSubmissions ?? this.scheduleDonorSubmissions,
        forDonators: forDonators ?? this.forDonators,
        forInstitution: forInstitution ?? this.forInstitution,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory SubmissionHistoryModel.fromRawJson(String str) =>
      SubmissionHistoryModel.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory SubmissionHistoryModel.fromJson(Map<String?, dynamic> json) =>
      SubmissionHistoryModel(
        idDonorSubmissions: json["id_donor_submissions"],
        idDonators: json["id_donators"],
        idInstitutions: json["id_institutions"],
        recipientDonorSubmissions: json["recipient_donor_submissions"],
        applicantDonorSubmissions: json["applicant_donor_submissions"],
        bloodTypeDonorSubmissions: json["blood_type_donor_submissions"],
        bloodRhesusDonorSubmissions: json["blood_rhesus_donor_submissions"],
        quantityDonorSubmissions: json["quantity_donor_submissions"],
        statusDonorSubmissions: json["status_donor_submissions"],
        scheduleDonorSubmissions:
            DateTime?.tryParse(json["schedule_donor_submissions"]),
        forDonators: json["ForDonators"],
        forInstitution: json["ForInstitution"],
        createdAt: DateTime?.tryParse(json["created_at"]),
        updatedAt: DateTime?.tryParse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String?, dynamic> toJson() => {
        "id_donor_submissions": idDonorSubmissions,
        "id_donators": idDonators,
        "id_institutions": idInstitutions,
        "recipient_donor_submissions": recipientDonorSubmissions,
        "applicant_donor_submissions": applicantDonorSubmissions,
        "blood_type_donor_submissions": bloodTypeDonorSubmissions,
        "blood_rhesus_donor_submissions": bloodRhesusDonorSubmissions,
        "quantity_donor_submissions": quantityDonorSubmissions,
        "status_donor_submissions": statusDonorSubmissions,
        "schedule_donor_submissions":
            scheduleDonorSubmissions?.toIso8601String(),
        "ForDonators": forDonators,
        "ForInstitution": forInstitution,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
