// To parse this JSON data, do
//
//     final registerModel = registerModelFromMap(jsonString);

import 'dart:convert';

class RegisterModel {
  RegisterModel({
    required this.status,
    this.message,
    //this.data,
  });

  int status;
  String? message;
  //Data? data;

  factory RegisterModel.fromJson(String str) =>
      RegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromMap(Map<String, dynamic> json) {
    if (json["status"] == 201) {
      return RegisterModel(
        status: json["status"],
        message: json["message"],
        //data: Data.fromMap(json["data"]),
      );
    } else {
      return RegisterModel(
        status: json["status"],
      );
    }
  }

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        //"data": data?.toMap(),
      };
}

class Data {
  Data({
    this.idDonators,
    this.nameDonators,
    this.emailDonators,
    this.passwordDonators,
    this.genderDonators,
    this.bloodTypeDonators,
    this.bloodRhesusDonators,
    this.contactDonators,
    this.addressDonators,
    this.profileImageDonators,
    this.verifyDonators,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String? idDonators;
  String? nameDonators;
  String? emailDonators;
  String? passwordDonators;
  String? genderDonators;
  String? bloodTypeDonators;
  String? bloodRhesusDonators;
  String? contactDonators;
  String? addressDonators;
  String? profileImageDonators;
  DateTime? verifyDonators;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        idDonators: json["id_donators"],
        nameDonators: json["name_donators"],
        emailDonators: json["email_donators"],
        passwordDonators: json["password_donators"],
        genderDonators: json["gender_donators"],
        bloodTypeDonators: json["blood_type_donators"],
        bloodRhesusDonators: json["blood_rhesus_donators"],
        contactDonators: json["contact_donators"],
        addressDonators: json["address_donators"],
        profileImageDonators: json["profile_image_donators"],
        verifyDonators: DateTime.parse(json["verify_donators"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toMap() => {
        "id_donators": idDonators,
        "name_donators": nameDonators,
        "email_donators": emailDonators,
        "password_donators": passwordDonators,
        "gender_donators": genderDonators,
        "blood_type_donators": bloodTypeDonators,
        "blood_rhesus_donators": bloodRhesusDonators,
        "contact_donators": contactDonators,
        "address_donators": addressDonators,
        "profile_image_donators": profileImageDonators,
        "verify_donators": verifyDonators?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
