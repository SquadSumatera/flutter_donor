// To parse this JSON data, do
//
//     final eventRegisterModel = eventRegisterModelFromMap(jsonString);

import 'dart:convert';

class EventRegisterModel {
  EventRegisterModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory EventRegisterModel.fromJson(String str) =>
      EventRegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventRegisterModel.fromMap(Map<String, dynamic> json) =>
      EventRegisterModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  Data({
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
  String? idDonorEvents;
  String? titleDonorEvents;
  String? idInstitutions;
  String? nameInstitutions;
  String? bloodTypeDonorNotes;
  String? bloodRhesusDonorNotes;
  bool? certificateDonorNotes;
  DateTime? scheduleDonorNotes;
  String? statusDonorNotes;
  String? locationAddress;
  dynamic latitudeAddress;
  dynamic longitudeAddress;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
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

  Map<String, dynamic> toMap() => {
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
