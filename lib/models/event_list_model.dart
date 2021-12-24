import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class EventListModel {
  EventListModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<DataEvent>? data;

  factory EventListModel.fromJson(String str) =>
      EventListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventListModel.fromMap(Map<String, dynamic> json) {
    if (json["status"] == 200) {
      return EventListModel(
        status: json["status"],
        message: json["message"],
        data:
            List<DataEvent>.from(json["data"].map((x) => DataEvent.fromMap(x))),
      );
    } else {
      return EventListModel(
        status: json["status"],
      );
    }
  }

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class DataEvent {
  DataEvent({
    this.idDonorEvents,
    this.idInstitutions,
    this.nameInstitutions,
    this.titleDonorEvents,
    this.emailConstitutions,
    this.contactConstitutions,
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
  String? titleDonorEvents;
  String? emailConstitutions;
  String? contactConstitutions;
  String? pictureDonorEvents;
  DateTime? startDonorEvents;
  DateTime? endDonorEvents;
  String? descDonorEvents;
  String? addressDonorEvents;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? deletedAt;

  ImageProvider? get imageDecode {
    if (pictureDonorEvents != "") {
      return MemoryImage(base64Decode(pictureDonorEvents!));
    } else {
      return null;
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

  String get schedule {
    if (startDonorEvents == null) {
      return "--/--/----";
    } else {
      return DateFormat("yyyy-M-d", "id").format(startDonorEvents!);
    }
  }

  String get end {
    if (endDonorEvents == null) {
      return "--/--/----";
    } else {
      return DateFormat("dd MMMM yyyy", "id").format(endDonorEvents!);
    }
  }

  factory DataEvent.fromJson(String str) => DataEvent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataEvent.fromMap(Map<String, dynamic> json) => DataEvent(
        idDonorEvents: json["id_donor_events"],
        idInstitutions: json["id_institutions"],
        nameInstitutions: json["name_institutions"],
        titleDonorEvents: json["title_donor_events"],
        emailConstitutions: json["email_institutions"],
        contactConstitutions: json["contact_institutions"],
        pictureDonorEvents: json["picture_donor_events"],
        startDonorEvents: DateTime.parse(json["start_donor_events"]),
        endDonorEvents: DateTime.parse(json["end_donor_events"]),
        descDonorEvents: json["desc_donor_events"],
        addressDonorEvents: json["address_donor_events"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toMap() => {
        "id_donor_events": idDonorEvents,
        "id_institutions": idInstitutions,
        "name_institutions": nameInstitutions,
        "title_donor_events": titleDonorEvents,
        "picture_donor_events": pictureDonorEvents,
        "start_donor_events": startDonorEvents == null
            ? null
            : startDonorEvents!.toIso8601String(),
        "end_donor_events":
            endDonorEvents == null ? null : endDonorEvents!.toIso8601String(),
        "desc_donor_events": descDonorEvents,
        "address_donor_events": addressDonorEvents,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
