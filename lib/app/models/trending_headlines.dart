// To parse this JSON data, do
//
//     final trendingHeadline = trendingHeadlineFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

TrendingHeadline trendingHeadlineFromJson(String str) =>
    TrendingHeadline.fromJson(json.decode(str));

String trendingHeadlineToJson(TrendingHeadline data) =>
    json.encode(data.toJson());

class TrendingHeadline {
  List<Datum>? data;

  TrendingHeadline({
    this.data,
  });

  TrendingHeadline copyWith({
    List<Datum>? data,
  }) =>
      TrendingHeadline(
        data: data ?? this.data,
      );

  factory TrendingHeadline.fromJson(Map<String, dynamic> json) =>
      TrendingHeadline(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? headline;
  String? text;
  int? newsId;
  Sentiment? sentiment;
  String? date;
  List<dynamic>? currency;

  Datum({
    this.id,
    this.headline,
    this.text,
    this.newsId,
    this.sentiment,
    this.date,
    this.currency,
  });

  Datum copyWith({
    int? id,
    String? headline,
    String? text,
    int? newsId,
    Sentiment? sentiment,
    String? date,
    List<dynamic>? currency,
  }) =>
      Datum(
        id: id ?? this.id,
        headline: headline ?? this.headline,
        text: text ?? this.text,
        newsId: newsId ?? this.newsId,
        sentiment: sentiment ?? this.sentiment,
        date: date ?? this.date,
        currency: currency ?? this.currency,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        headline: json["headline"],
        text: json["text"],
        newsId: json["news_id"],
        sentiment: sentimentValues.map[json["sentiment"]]!,
        date: json["date"],
        currency: json["currency"] == null
            ? []
            : List<dynamic>.from(json["currency"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "headline": headline,
        "text": text,
        "news_id": newsId,
        "sentiment": sentimentValues.reverse[sentiment],
        "date": date,
        "currency":
            currency == null ? [] : List<dynamic>.from(currency!.map((x) => x)),
      };
}

enum Sentiment { NEGATIVE, NEUTRAL, POSITIVE }

final sentimentValues = EnumValues({
  "Negative": Sentiment.NEGATIVE,
  "Neutral": Sentiment.NEUTRAL,
  "Positive": Sentiment.POSITIVE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
