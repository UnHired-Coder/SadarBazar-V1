// To parse this JSON data, do
//
//     final productMetaData = productMetaDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ProductMetaData {
  ProductMetaData({
    @required this.reviewId,
    @required this.pictureUrls,
    @required this.infoPoints,
    @required this.highlightsPoints,
    @required this.rating,
    @required this.highlights,
    @required this.productMetaDataId,
  });

  final String reviewId;
  final List<String> pictureUrls;
  final List<String> infoPoints;
  final List<String> highlightsPoints;
  final double rating;
  final List<Highlight> highlights;
  final String productMetaDataId;

  factory ProductMetaData.fromRawJson(String str) => ProductMetaData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductMetaData.fromJson(Map<String, dynamic> json) => ProductMetaData(
    reviewId: json["reviewID"],
    pictureUrls: List<String>.from(json["pictureUrls"].map((x) => x)),
    infoPoints: List<String>.from(json["infoPoints"].map((x) => x)),
    highlightsPoints: List<String>.from(json["highlightsPoints"].map((x) => x)),
    rating: json["rating"],
    highlights: List<Highlight>.from(json["highlights"].map((x) => highlightValues.map[x])),
    productMetaDataId: json["productMetaDataId"],
  );

  Map<String, dynamic> toJson() => {
    "reviewID": reviewId,
    "pictureUrls": List<dynamic>.from(pictureUrls.map((x) => x)),
    "infoPoints": List<dynamic>.from(infoPoints.map((x) => x)),
    "highlightsPoints": List<dynamic>.from(highlightsPoints.map((x) => x)),
    "rating": rating,
    "highlights": List<dynamic>.from(highlights.map((x) => highlightValues.reverse[x])),
    "productMetaDataId": productMetaDataId,
  };
}

enum Highlight { SAFE, TESTED, APPROVED, BEST_QUALITY, VERIFIED, INSTANT_DELIVERY, NO_COST_EMI, BANK_OFFER }

final highlightValues = EnumValues({
  "APPROVED": Highlight.APPROVED,
  "BANK_OFFER": Highlight.BANK_OFFER,
  "BEST_QUALITY": Highlight.BEST_QUALITY,
  "INSTANT_DELIVERY": Highlight.INSTANT_DELIVERY,
  "NO_COST_EMI": Highlight.NO_COST_EMI,
  "SAFE": Highlight.SAFE,
  "TESTED": Highlight.TESTED,
  "VERIFIED": Highlight.VERIFIED
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}










