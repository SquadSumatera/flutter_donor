// To parse this JSON data, do
//
//     final donatorProfile = donatorProfileFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ProfileRhesusType {
  static const String positive = "positive";
  static const String negative = "negative";
}

class ProfileGenderType {
  static const String male = "male";
  static const String female = "female";
}

class ProfileModel {
  ProfileModel({
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

  String? get showGender {
    Map<String, String> _genderList = {
      ProfileGenderType.male: "Pria",
      ProfileGenderType.female: "Wanita",
    };
    return _genderList[genderDonators];
  }

  String? get showRhesus {
    Map<String, String> _rhesusList = {
      ProfileRhesusType.positive: "+",
      ProfileRhesusType.negative: "-",
    };
    return _rhesusList[bloodRhesusDonators];
  }

  String get showJoined {
    if (createdAt == null) {
      return '--/--/----';
    }
    DateTime joinDate = createdAt!;
    return DateFormat("dd MMMM yyyy", "id").format(joinDate);
  }

  ImageProvider? get showProfilePhoto {
    if (profileImageDonators != "") {
      return MemoryImage(base64Decode(profileImageDonators!));
    } else {
      return null;
    }
  }

  ProfileModel copyWith({
    String? idDonators,
    String? nameDonators,
    String? emailDonators,
    String? passwordDonators,
    String? genderDonators,
    String? bloodTypeDonators,
    String? bloodRhesusDonators,
    String? contactDonators,
    String? addressDonators,
    String? profileImageDonators,
    DateTime? verifyDonators,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      ProfileModel(
        idDonators: idDonators ?? this.idDonators,
        nameDonators: nameDonators ?? this.nameDonators,
        emailDonators: emailDonators ?? this.emailDonators,
        passwordDonators: passwordDonators ?? this.passwordDonators,
        genderDonators: genderDonators ?? this.genderDonators,
        bloodTypeDonators: bloodTypeDonators ?? this.bloodTypeDonators,
        bloodRhesusDonators: bloodRhesusDonators ?? this.bloodRhesusDonators,
        contactDonators: contactDonators ?? this.contactDonators,
        addressDonators: addressDonators ?? this.addressDonators,
        profileImageDonators: profileImageDonators ?? this.profileImageDonators,
        verifyDonators: verifyDonators ?? this.verifyDonators,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory ProfileModel.fromRawJson(String str) =>
      ProfileModel.fromJson(json.decode(str)["data"]);

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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

  Map<String, dynamic> toJson() => {
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
