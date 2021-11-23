// To parse this JSON data, do
//
//     final donorHistoryModel = donorHistoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:intl/intl.dart';

class DonorHistoryStatus {
  static const String canceled = 'canceled';
  static const String conditionsRejected = 'conditions_rejected';
  static const String finished = 'finished';
  static const String registered = 'registered';
  static const String scheduleRejected = 'schedule_rejected';
  static const String updateSchedule = 'update_schedule';
  static const String waitingConfirmation = 'waiting_confirmation';
}

class DonorHistoryModel {
  DonorHistoryModel({
    this.idDonorNotes,
    this.idDonators,
    this.nameDonators,
    this.idDonorEvents,
    this.titleDonorEvents,
    this.idInstitutions,
    this.nameInstitutions,
    this.bloodTypeDonorNotes,
    this.bloodRhesusDonorNotes,
    this.certificateDonorNotes,
    this.scheduleDonorNotes,
    this.statusDonorNotes,
    this.locationAddress,
    this.latitudeAddress,
    this.longitudeAddress,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? idDonorNotes;
  String? idDonators;
  String? nameDonators;
  dynamic idDonorEvents;
  dynamic titleDonorEvents;
  String? idInstitutions;
  String? nameInstitutions;
  String? bloodTypeDonorNotes;
  String? bloodRhesusDonorNotes;
  bool? certificateDonorNotes;
  DateTime? scheduleDonorNotes;
  String? statusDonorNotes;
  String? locationAddress;
  String? latitudeAddress;
  String? longitudeAddress;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  // waiting_confirmation -> pas daftar langsung gini
  // schedule_rejected -> ditolak karna jadwal
  // registered -> terdaftar
  // conditions_rejected -> ditolak karna kondisi kesehatan saat pemeriksaan
  // canceled -> pembataalan jadwal (cuma bisa saat kondisi waiting_confirmation & schedule_rejected)
  // finished -> selesai

  Color get designatedColor {
    switch (statusDonorNotes) {
      case DonorHistoryStatus.waitingConfirmation:
        return AppColor.carnelian;
      case DonorHistoryStatus.scheduleRejected:
        return AppColor.bloodRed;
      case DonorHistoryStatus.registered:
        return AppColor.imperialRed;
      case DonorHistoryStatus.conditionsRejected:
        return AppColor.bloodRed;
      case DonorHistoryStatus.canceled:
        return AppColor.bloodRed;
      case DonorHistoryStatus.finished:
        return AppColor.imperialRed;
      default:
        return Colors.grey;
    }
  }

  String dateFormatterString(DateTime? date) {
    if (date == null) {
      return "--/--/----";
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  String get scheduleDonorNotesString {
    if (scheduleDonorNotes == null) {
      return "--/--/----";
    } else {
      return DateFormat("dd MMMM yyyy", "id").format(scheduleDonorNotes!);
    }
  }

  String get showStatus {
    Map<String, String> _status = {
      DonorHistoryStatus.canceled: 'Dibatalkan',
      DonorHistoryStatus.conditionsRejected: 'Ditolak karena kondisi kesehatan',
      DonorHistoryStatus.finished: 'Selesai',
      DonorHistoryStatus.registered:
          'Terjadwalkan Tanggal $scheduleDonorNotesString',
      DonorHistoryStatus.scheduleRejected: 'Jadwal Ditolak',
      DonorHistoryStatus.waitingConfirmation: 'Menunggu Konfirmasi',
    };

    return _status[statusDonorNotes] ?? "-";
  }

  DonorHistoryModel copyWith({
    String? idDonorNotes,
    String? idDonators,
    String? nameDonators,
    dynamic idDonorEvents,
    dynamic titleDonorEvents,
    String? idInstitutions,
    String? nameInstitutions,
    String? bloodTypeDonorNotes,
    String? bloodRhesusDonorNotes,
    bool? certificateDonorNotes,
    DateTime? scheduleDonorNotes,
    String? statusDonorNotes,
    String? locationAddress,
    String? latitudeAddress,
    String? longitudeAddress,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      DonorHistoryModel(
        idDonorNotes: idDonorNotes ?? this.idDonorNotes,
        idDonators: idDonators ?? this.idDonators,
        nameDonators: nameDonators ?? this.nameDonators,
        idDonorEvents: idDonorEvents ?? this.idDonorEvents,
        titleDonorEvents: titleDonorEvents ?? this.titleDonorEvents,
        idInstitutions: idInstitutions ?? this.idInstitutions,
        nameInstitutions: nameInstitutions ?? this.nameInstitutions,
        bloodTypeDonorNotes: bloodTypeDonorNotes ?? this.bloodTypeDonorNotes,
        bloodRhesusDonorNotes:
            bloodRhesusDonorNotes ?? this.bloodRhesusDonorNotes,
        certificateDonorNotes:
            certificateDonorNotes ?? this.certificateDonorNotes,
        scheduleDonorNotes: scheduleDonorNotes ?? this.scheduleDonorNotes,
        statusDonorNotes: statusDonorNotes ?? this.statusDonorNotes,
        locationAddress: locationAddress ?? this.locationAddress,
        latitudeAddress: latitudeAddress ?? this.latitudeAddress,
        longitudeAddress: longitudeAddress ?? this.longitudeAddress,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DonorHistoryModel.fromRawJson(String str) =>
      DonorHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DonorHistoryModel.fromJson(Map<String, dynamic> json) =>
      DonorHistoryModel(
        idDonorNotes: json["id_donor_notes"],
        idDonators: json["id_donators"],
        nameDonators: json["name_donators"],
        idDonorEvents: json["id_donor_events"],
        titleDonorEvents: json["title_donor_events"],
        idInstitutions: json["id_institutions"],
        nameInstitutions: json["name_institutions"],
        bloodTypeDonorNotes: json["blood_type_donor_notes"],
        bloodRhesusDonorNotes: json["blood_rhesus_donor_notes"],
        certificateDonorNotes: json["certificate_donor_notes"],
        scheduleDonorNotes: DateTime.parse(json["schedule_donor_notes"]),
        statusDonorNotes: json["status_donor_notes"],
        locationAddress: json["location_address"],
        latitudeAddress: json["latitude_address"],
        longitudeAddress: json["longitude_address"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id_donor_notes": idDonorNotes,
        "id_donators": idDonators,
        "name_donators": nameDonators,
        "id_donor_events": idDonorEvents,
        "title_donor_events": titleDonorEvents,
        "id_institutions": idInstitutions,
        "name_institutions": nameInstitutions,
        "blood_type_donor_notes": bloodTypeDonorNotes,
        "blood_rhesus_donor_notes": bloodRhesusDonorNotes,
        "certificate_donor_notes": certificateDonorNotes,
        "schedule_donor_notes":
            "${scheduleDonorNotes?.year.toString().padLeft(4, '0')}-${scheduleDonorNotes?.month.toString().padLeft(2, '0')}-${scheduleDonorNotes?.day.toString().padLeft(2, '0')}",
        "status_donor_notes": statusDonorNotes,
        "location_address": locationAddress,
        "latitude_address": latitudeAddress,
        "longitude_address": longitudeAddress,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
