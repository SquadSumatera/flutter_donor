// To parse this JSON data, do
//
//     final donorCertificateModel = donorCertificateModelFromJson(jsonString?);

import 'dart:convert';

import 'package:intl/intl.dart';

import 'profile_model.dart';

class DonorCertificateModel {
  DonorCertificateModel({
    this.idDonorNotes,
    this.idDonators,
    this.nameDonators,
    this.genderDonators,
    this.idDonorEvents,
    this.titleDonorEvents,
    this.idInstitutions,
    this.nameInstitutions,
    this.bloodTypeDonorNotes,
    this.bloodRhesusDonorNotes,
    this.scheduleDonorNotes,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? idDonorNotes;
  String? idDonators;
  String? nameDonators;
  String? genderDonators;
  dynamic idDonorEvents;
  dynamic titleDonorEvents;
  String? idInstitutions;
  String? nameInstitutions;
  String? bloodTypeDonorNotes;
  String? bloodRhesusDonorNotes;
  DateTime? scheduleDonorNotes;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  String? get showGender {
    Map<String, String> _genderList = {
      ProfileGenderType.male: "Pria / Male",
      ProfileGenderType.female: "Wanita / Female",
    };
    return _genderList[genderDonators];
  }

  String? get showRhesus {
    Map<String, String> _rhesusList = {
      ProfileRhesusType.positive: "+",
      ProfileRhesusType.negative: "-",
    };
    return _rhesusList[bloodRhesusDonorNotes];
  }

  String? get showFullBloodType {
    return "$bloodTypeDonorNotes$showRhesus";
  }

  String get scheduleDonorNotesString {
    if (scheduleDonorNotes == null) {
      return "--/--/----";
    } else {
      return DateFormat("dd MMMM yyyy", "id").format(scheduleDonorNotes!);
    }
  }

  String get scheduleDonorNotesStringEn {
    if (scheduleDonorNotes == null) {
      return "--/--/----";
    } else {
      return DateFormat("MMMM dd, yyyy").format(scheduleDonorNotes!);
    }
  }

  DonorCertificateModel copyWith({
    String? idDonorNotes,
    String? idDonators,
    String? nameDonators,
    String? genderDonators,
    dynamic idDonorEvents,
    dynamic titleDonorEvents,
    String? idInstitutions,
    String? nameInstitutions,
    String? bloodTypeDonorNotes,
    String? bloodRhesusDonorNotes,
    DateTime? scheduleDonorNotes,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      DonorCertificateModel(
        idDonorNotes: idDonorNotes ?? this.idDonorNotes,
        idDonators: idDonators ?? this.idDonators,
        nameDonators: nameDonators ?? this.nameDonators,
        genderDonators: genderDonators ?? this.genderDonators,
        idDonorEvents: idDonorEvents ?? this.idDonorEvents,
        titleDonorEvents: titleDonorEvents ?? this.titleDonorEvents,
        idInstitutions: idInstitutions ?? this.idInstitutions,
        nameInstitutions: nameInstitutions ?? this.nameInstitutions,
        bloodTypeDonorNotes: bloodTypeDonorNotes ?? this.bloodTypeDonorNotes,
        bloodRhesusDonorNotes:
            bloodRhesusDonorNotes ?? this.bloodRhesusDonorNotes,
        scheduleDonorNotes: scheduleDonorNotes ?? this.scheduleDonorNotes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DonorCertificateModel.fromRawJson(String? str) =>
      DonorCertificateModel.fromJson(json.decode(str ?? ''));

  String? toRawJson() => json.encode(toJson());

  factory DonorCertificateModel.fromJson(Map<String?, dynamic> json) =>
      DonorCertificateModel(
        idDonorNotes: json["id_donor_notes"],
        idDonators: json["id_donators"],
        nameDonators: json["name_donators"],
        genderDonators: json["gender_donators"],
        idDonorEvents: json["id_donor_events"],
        titleDonorEvents: json["title_donor_events"],
        idInstitutions: json["id_institutions"],
        nameInstitutions: json["name_institutions"],
        bloodTypeDonorNotes: json["blood_type_donor_notes"],
        bloodRhesusDonorNotes: json["blood_rhesus_donor_notes"],
        scheduleDonorNotes: DateTime?.parse(json["schedule_donor_notes"]),
        createdAt: DateTime?.parse(json["created_at"]),
        updatedAt: DateTime?.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String?, dynamic> toJson() => {
        "id_donor_notes": idDonorNotes,
        "id_donators": idDonators,
        "name_donators": nameDonators,
        "gender_donators": genderDonators,
        "id_donor_events": idDonorEvents,
        "title_donor_events": titleDonorEvents,
        "id_institutions": idInstitutions,
        "name_institutions": nameInstitutions,
        "blood_type_donor_notes": bloodTypeDonorNotes,
        "blood_rhesus_donor_notes": bloodRhesusDonorNotes,
        "schedule_donor_notes":
            "${scheduleDonorNotes?.year.toString().padLeft(4, '0')}-${scheduleDonorNotes?.month.toString().padLeft(2, '0')}-${scheduleDonorNotes?.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
