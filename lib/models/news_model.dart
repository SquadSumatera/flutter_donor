// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

class NewsModel {
    NewsModel({
        this.description,
        this.enclosure,
        this.guid,
        this.link,
        this.pubDate,
        this.title,
    });

    String? description;
    Enclosure? enclosure;
    String? guid;
    String? link;
    String? pubDate;
    String? title;

    NewsModel copyWith({
        String? description,
        Enclosure? enclosure,
        String? guid,
        String? link,
        String? pubDate,
        String? title,
    }) => 
        NewsModel(
            description: description ?? this.description,
            enclosure: enclosure ?? this.enclosure,
            guid: guid ?? this.guid,
            link: link ?? this.link,
            pubDate: pubDate ?? this.pubDate,
            title: title ?? this.title,
        );

    factory NewsModel.fromRawJson(String str) => NewsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        description: json["description"],
        enclosure: Enclosure.fromJson(json["enclosure"]),
        guid: json["guid"],
        link: json["link"],
        pubDate: json["pubDate"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "enclosure": enclosure?.toJson(),
        "guid": guid,
        "link": link,
        "pubDate": pubDate,
        "title": title,
    };
}

class Enclosure {
    Enclosure({
        this.length,
        this.type,
        this.url,
    });

    String? length;
    String? type;
    String? url;

    Enclosure copyWith({
        String? length,
        String? type,
        String? url,
    }) => 
        Enclosure(
            length: length ?? this.length,
            type: type ?? this.type,
            url: url ?? this.url,
        );

    factory Enclosure.fromRawJson(String str) => Enclosure.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Enclosure.fromJson(Map<String, dynamic> json) => Enclosure(
        length: json["-length"],
        type: json["-type"],
        url: json["-url"],
    );

    Map<String, dynamic> toJson() => {
        "-length": length,
        "-type": type,
        "-url": url,
    };
}
