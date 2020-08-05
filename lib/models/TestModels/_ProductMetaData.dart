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

  final List<String> reviewId;
  final List<String> pictureUrls;
  final List<String> infoPoints;
  final List<String> highlightsPoints;
  final String rating;
  final List<Highlight> highlights;
  final String productMetaDataId;

  factory ProductMetaData.fromRawJson(String str) => ProductMetaData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductMetaData.fromJson(Map<String, dynamic> json) => ProductMetaData(
    reviewId: List<String>.from(json["reviewID"].map((x) => x)),
    pictureUrls: List<String>.from(json["pictureUrls"].map((x) => x)),
    infoPoints: List<String>.from(json["infoPoints"].map((x) => x)),
    highlightsPoints: List<String>.from(json["highlightsPoints"].map((x) => x)),
    rating: json["rating"],
    highlights: List<Highlight>.from(json["highlights"].map((x) => highlightValues.map[x])),
    productMetaDataId: json["productMetaDataId"],
  );

  Map<String, dynamic> toJson() => {
    "reviewID": List<dynamic>.from(reviewId.map((x) => x)),
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












//
//// To parse this JSON data, do
////
////     final productMetaData = productMetaDataFromJson(jsonString);
//
//import 'package:meta/meta.dart';
//import 'dart:convert';
//
//class ProductMetaData {
//  ProductMetaData({
//    @required this.reviewId,
//    @required this.pictureUrls,
//    @required this.infoPoints,
//    @required this.highlightsPoints,
//    @required this.rating,
//    @required this.highlights,
//    @required this.productMetaDataId,
//  });
//
//  final String reviewId;
//  final String pictureUrls;
//  final String infoPoints;
//  final String highlightsPoints;
//  final String rating;
//  final List<Highlights> highlights;
//  final String productMetaDataId;
//
//  factory ProductMetaData.fromRawJson(String str) =>
//      ProductMetaData.fromJson(json.decode(str));
//
//  String toRawJson() => json.encode(toJson());
//
//  factory ProductMetaData.fromJson(Map<String, dynamic> json) =>
//      ProductMetaData(
//        reviewId: json["reviewID"],
//        pictureUrls: json["pictureUrls"],
//        infoPoints: json["infoPoints"],
//        highlightsPoints: json["highlightsPoints"],
//        rating: json["rating"],
//        highlights: [highlightsValues.map[json["highlights"]]],
//        productMetaDataId: json["productMetaDataId"],
//      );
//
//  Map<String, dynamic> toJson() =>
//      {
//        "reviewID": reviewId,
//        "pictureUrls": pictureUrls,
//        "infoPoints": infoPoints,
//        "highlightsPoints": highlightsPoints,
//        "rating": rating,
//        "highlights": highlights,
//        "productMetaDataId": productMetaDataId,
//      };
//}
//
//enum Highlights { SAFE, TESTED, APPROVED, BEST_QUALITY, VERIFIED, INSTANT_DELIVERY, NO_COST_EMI, BANK_OFFER }
//
//final highlightsValues = EnumValues({
//  "APPROVED": Highlights.APPROVED,
//  "BANK_OFFER": Highlights.BANK_OFFER,
//  "BEST_QUALITY": Highlights.BEST_QUALITY,
//  "INSTANT_DELIVERY": Highlights.INSTANT_DELIVERY,
//  "NO_COST_EMI": Highlights.NO_COST_EMI,
//  "SAFE": Highlights.SAFE,
//  "TESTED": Highlights.TESTED,
//  "VERIFIED": Highlights.VERIFIED
//});
//
//class EnumValues<T> {
//  Map<String, T> map;
//  Map<T, String> reverseMap;
//
//  EnumValues(this.map);
//
//  Map<T, String> get reverse {
//    if (reverseMap == null) {
//      reverseMap = map.map((k, v) => new MapEntry(v, k));
//    }
//    return reverseMap;
//  }
//}
//
