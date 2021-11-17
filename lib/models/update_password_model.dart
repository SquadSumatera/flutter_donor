// To parse this JSON data, do
//
//     final updatePasswordModel = updatePasswordModelFromJson(jsonString);

import 'dart:convert';

class UpdatePasswordModel {
    UpdatePasswordModel({
        this.lastPassword,
        this.newPassword,
        this.confirmPassword,
    });

    String? lastPassword;
    String? newPassword;
    String? confirmPassword;

    UpdatePasswordModel copyWith({
        String? lastPassword,
        String? newPassword,
        String? confirmPassword,
    }) => 
        UpdatePasswordModel(
            lastPassword: lastPassword ?? this.lastPassword,
            newPassword: newPassword ?? this.newPassword,
            confirmPassword: confirmPassword ?? this.confirmPassword,
        );

    factory UpdatePasswordModel.fromRawJson(String str) => UpdatePasswordModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) => UpdatePasswordModel(
        lastPassword: json["last_password"],
        newPassword: json["new_password"],
        confirmPassword: json["confirm_password"],
    );

    Map<String, dynamic> toJson() => {
        "last_password": lastPassword,
        "new_password": newPassword,
        "confirm_password": confirmPassword,
    };
}
