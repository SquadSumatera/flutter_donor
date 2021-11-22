// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'dart:convert';

class FaqModel {
    FaqModel({
        this.idFaqs,
        this.titleFaqs,
        this.contentFaqs,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    String? idFaqs;
    String? titleFaqs;
    String? contentFaqs;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    FaqModel copyWith({
        String? idFaqs,
        String? titleFaqs,
        String? contentFaqs,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic deletedAt,
    }) => 
        FaqModel(
            idFaqs: idFaqs ?? this.idFaqs,
            titleFaqs: titleFaqs ?? this.titleFaqs,
            contentFaqs: contentFaqs ?? this.contentFaqs,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
        );

    factory FaqModel.fromRawJson(String str) => FaqModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        idFaqs: json["id_faqs"],
        titleFaqs: json["title_faqs"],
        contentFaqs: json["content_faqs"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id_faqs": idFaqs,
        "title_faqs": titleFaqs,
        "content_faqs": contentFaqs,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
