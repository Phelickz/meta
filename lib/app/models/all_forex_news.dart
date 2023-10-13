// To parse this JSON data, do
//
//     final allForexNews = allForexNewsFromJson(jsonString);

import 'dart:convert';

AllForexNews allForexNewsFromJson(String str) =>
    AllForexNews.fromJson(json.decode(str));

String allForexNewsToJson(AllForexNews data) => json.encode(data.toJson());

class AllForexNews {
  List<NewsData>? data;
  int? totalPages;

  AllForexNews({
    this.data,
    this.totalPages,
  });

  AllForexNews copyWith({
    List<NewsData>? data,
    int? totalPages,
  }) =>
      AllForexNews(
        data: data ?? this.data,
        totalPages: totalPages ?? this.totalPages,
      );

  factory AllForexNews.fromJson(Map<String, dynamic> json) => AllForexNews(
        data: json["data"] == null
            ? []
            : List<NewsData>.from(
                json["data"]!.map((x) => NewsData.fromJson(x))),
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "total_pages": totalPages,
      };
}

class NewsData {
  String? newsUrl;
  String? imageUrl;
  String? title;
  String? text;
  String? sourceName;
  String? date;
  List<String>? topics;
  String? sentiment;
  String? type;
  List<String>? currency;

  NewsData({
    this.newsUrl,
    this.imageUrl,
    this.title,
    this.text,
    this.sourceName,
    this.date,
    this.topics,
    this.sentiment,
    this.type,
    this.currency,
  });

  NewsData copyWith({
    String? newsUrl,
    String? imageUrl,
    String? title,
    String? text,
    String? sourceName,
    String? date,
    List<String>? topics,
    String? sentiment,
    String? type,
    List<String>? currency,
  }) =>
      NewsData(
        newsUrl: newsUrl ?? this.newsUrl,
        imageUrl: imageUrl ?? this.imageUrl,
        title: title ?? this.title,
        text: text ?? this.text,
        sourceName: sourceName ?? this.sourceName,
        date: date ?? this.date,
        topics: topics ?? this.topics,
        sentiment: sentiment ?? this.sentiment,
        type: type ?? this.type,
        currency: currency ?? this.currency,
      );

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        newsUrl: json["news_url"],
        imageUrl: json["image_url"],
        title: json["title"],
        text: json["text"],
        sourceName: json["source_name"],
        date: json["date"],
        topics: json["topics"] == null
            ? []
            : List<String>.from(json["topics"]!.map((x) => x)),
        sentiment: json["sentiment"],
        type: json["type"],
        currency: json["currency"] == null
            ? []
            : List<String>.from(json["currency"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "news_url": newsUrl,
        "image_url": imageUrl,
        "title": title,
        "text": text,
        "source_name": sourceName,
        "date": date,
        "topics":
            topics == null ? [] : List<dynamic>.from(topics!.map((x) => x)),
        "sentiment": sentiment,
        "type": type,
        "currency":
            currency == null ? [] : List<dynamic>.from(currency!.map((x) => x)),
      };
}
