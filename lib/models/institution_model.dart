// To parse this JSON data, do
//
//     final institutionsModel = institutionsModelFromMap(jsonString);

import 'dart:convert';

class InstitutionsModel {
  InstitutionsModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory InstitutionsModel.fromJson(String str) => InstitutionsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InstitutionsModel.fromMap(Map<String, dynamic> json) => InstitutionsModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    this.idInstitutions,
    this.idInstitutionRoles,
    required this.nameInstitutions,
    this.emailInstitutions,
    this.contactInstitutions,
    this.addressInstitutions,
    this.latitudeInstitutions,
    this.longitudeInstitutions,
    this.forInstitutionRoles,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? idInstitutions;
  String? idInstitutionRoles;
  String nameInstitutions;
  String? emailInstitutions;
  String? contactInstitutions;
  String? addressInstitutions;
  String? latitudeInstitutions;
  String? longitudeInstitutions;
  String? forInstitutionRoles;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? deletedAt;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    idInstitutions: json["id_institutions"],
    idInstitutionRoles: json["id_institution_roles"],
    nameInstitutions: json["name_institutions"],
    emailInstitutions: json["email_institutions"],
    contactInstitutions: json["contact_institutions"],
    addressInstitutions: json["address_institutions"],
    latitudeInstitutions: json["latitude_institutions"],
    longitudeInstitutions: json["longitude_institutions"],
    forInstitutionRoles: json["ForInstitutionRoles"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toMap() => {
    "id_institutions": idInstitutions,
    "id_institution_roles": idInstitutionRoles,
    "name_institutions": nameInstitutions,
    "email_institutions": emailInstitutions,
    "contact_institutions": contactInstitutions,
    "address_institutions": addressInstitutions,
    "latitude_institutions": latitudeInstitutions,
    "longitude_institutions": longitudeInstitutions,
    "ForInstitutionRoles": forInstitutionRoles,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
