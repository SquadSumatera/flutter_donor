// To parse this JSON data, do
//
//     final eventSearchModel = eventSearchModelFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventSearchModel {
  EventSearchModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory EventSearchModel.fromJson(String str) =>
      EventSearchModel.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory EventSearchModel.fromMap(Map<String, dynamic> json) =>
      EventSearchModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(
          json["data"].map(
            (x) => Datum.fromMap(x),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(
                data!.map(
                  (x) => x.toMap(),
                ),
              ),
      };
}

class Datum {
  Datum({
    this.idDonorEvents,
    this.idInstitutions,
    this.nameInstitutions,
    this.emailInstitutions,
    this.contactInstitutions,
    this.titleDonorEvents,
    this.pictureDonorEvents,
    this.startDonorEvents,
    this.endDonorEvents,
    this.descDonorEvents,
    this.addressDonorEvents,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? idDonorEvents;
  String? idInstitutions;
  String? nameInstitutions;
  String? emailInstitutions;
  String? contactInstitutions;
  String? titleDonorEvents;
  String? pictureDonorEvents;
  DateTime? startDonorEvents;
  DateTime? endDonorEvents;
  String? descDonorEvents;
  String? addressDonorEvents;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  ImageProvider? get imageDecode {
    if (pictureDonorEvents != "") {
      return MemoryImage(base64Decode(pictureDonorEvents!));
    } else {
      return null;
    }
  }

  String get schedule {
    if (startDonorEvents == null) {
      return "--/--/----";
    } else {
      return DateFormat("yyyy-M-d", "id").format(startDonorEvents!);
    }
  }

  String get created {
    if (createdAt == null) {
      return "--/--/----";
    } else {
      return DateFormat("dd MMMM yyyy", "id").format(createdAt!);
    }
  }

  String get start {
    if (startDonorEvents == null) {
      return "--/--/----";
    } else {
      return DateFormat("dd MMMM yyyy", "id").format(startDonorEvents!);
    }
  }

  String get end {
    if (endDonorEvents == null) {
      return "--/--/----";
    } else {
      return DateFormat("dd MMMM yyyy", "id").format(endDonorEvents!);
    }
  }

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        idDonorEvents: json["id_donor_events"],
        idInstitutions: json["id_institutions"],
        nameInstitutions: json["name_institutions"],
        emailInstitutions: json["email_institutions"],
        contactInstitutions: json["contact_institutions"],
        titleDonorEvents: json["title_donor_events"],
        pictureDonorEvents: json["picture_donor_events"],
        startDonorEvents: DateTime.parse(json["start_donor_events"]),
        endDonorEvents: DateTime.parse(json["end_donor_events"]),
        descDonorEvents: json["desc_donor_events"],
        addressDonorEvents: json["address_donor_events"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toMap() => {
        "id_donor_events": idDonorEvents,
        "id_institutions": idInstitutions,
        "name_institutions": nameInstitutions,
        "email_institutions": emailInstitutions,
        "contact_institutions": contactInstitutions,
        "title_donor_events": titleDonorEvents,
        "picture_donor_events": pictureDonorEvents,
        "start_donor_events": startDonorEvents?.toIso8601String(),
        "end_donor_events": endDonorEvents?.toIso8601String(),
        "desc_donor_events": descDonorEvents,
        "address_donor_events": addressDonorEvents,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
