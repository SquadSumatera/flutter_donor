// To parse this JSON data, do
//
//     final donorRequestModel = donorRequestModelFromMap(jsonString);

import 'dart:convert';

class DonorRequestModel {
  DonorRequestModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory DonorRequestModel.fromJson(String str) => DonorRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DonorRequestModel.fromMap(Map<String, dynamic> json) => DonorRequestModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data == null ? null : data!.toMap(),
  };
}

class Data {
  Data({
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
    this.documentDonorSubmissions,
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
  String? scheduleDonorSubmissions;
  dynamic forDonators;
  dynamic forInstitution;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? deletedAt;
  List<DocumentDonorSubmission?>? documentDonorSubmissions;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    idDonorSubmissions: json["id_donor_submissions"],
    idDonators: json["id_donators"],
    idInstitutions: json["id_institutions"],
    recipientDonorSubmissions: json["recipient_donor_submissions"],
    applicantDonorSubmissions: json["applicant_donor_submissions"],
    bloodTypeDonorSubmissions: json["blood_type_donor_submissions"],
    bloodRhesusDonorSubmissions: json["blood_rhesus_donor_submissions"],
    quantityDonorSubmissions: json["quantity_donor_submissions"],
    statusDonorSubmissions: json["status_donor_submissions"],
    scheduleDonorSubmissions: json["schedule_donor_submissions"],
    forDonators: json["ForDonators"],
    forInstitution: json["ForInstitution"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    documentDonorSubmissions: json["document_donor_submissions"] == null ? null : List<DocumentDonorSubmission>.from(json["document_donor_submissions"].map((x) => DocumentDonorSubmission.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id_donor_submissions": idDonorSubmissions,
    "id_donators": idDonators,
    "id_institutions": idInstitutions,
    "recipient_donor_submissions": recipientDonorSubmissions,
    "applicant_donor_submissions": applicantDonorSubmissions,
    "blood_type_donor_submissions": bloodTypeDonorSubmissions,
    "blood_rhesus_donor_submissions": bloodRhesusDonorSubmissions,
    "quantity_donor_submissions": quantityDonorSubmissions,
    "status_donor_submissions": statusDonorSubmissions,
    "schedule_donor_submissions": scheduleDonorSubmissions,
    "ForDonators": forDonators,
    "ForInstitution": forInstitution,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
    "document_donor_submissions": documentDonorSubmissions == null ? null : List<dynamic>.from(documentDonorSubmissions!.map((x) => x!.toMap())),
  };
}

class DocumentDonorSubmission {
  DocumentDonorSubmission({
    this.idDocumentDonorSubmissions,
    this.idDonorSubmissions,
    this.fileDocumentDonorSubmissions,
    this.typeDocumentDonorSubmissions,
    this.forSubmissions,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? idDocumentDonorSubmissions;
  String? idDonorSubmissions;
  String? fileDocumentDonorSubmissions;
  String? typeDocumentDonorSubmissions;
  dynamic forSubmissions;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? deletedAt;

  factory DocumentDonorSubmission.fromJson(String str) => DocumentDonorSubmission.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DocumentDonorSubmission.fromMap(Map<String, dynamic> json) => DocumentDonorSubmission(
    idDocumentDonorSubmissions: json["id_document_donor_submissions"],
    idDonorSubmissions: json["id_donor_submissions"],
    fileDocumentDonorSubmissions: json["file_document_donor_submissions"],
    typeDocumentDonorSubmissions: json["type_document_donor_submissions"],
    forSubmissions: json["ForSubmissions"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toMap() => {
    "id_document_donor_submissions": idDocumentDonorSubmissions,
    "id_donor_submissions": idDonorSubmissions,
    "file_document_donor_submissions": fileDocumentDonorSubmissions,
    "type_document_donor_submissions": typeDocumentDonorSubmissions,
    "ForSubmissions": forSubmissions,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
