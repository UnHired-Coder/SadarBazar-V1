// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Review {
  Review({
    @required this.reviewId,
    @required this.reviews,
  });

  final String reviewId;
  final List<ReviewElement> reviews;

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    reviewId: json["reviewId"],
    reviews: List<ReviewElement>.from(json["reviews"].map((x) => ReviewElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "reviewId": reviewId,
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
  };
}

class ReviewElement {
  ReviewElement({
    @required this.reviewTitle,
    @required this.reviewName,
    @required this.reviewDesc,
    @required this.usefulCount,
    @required this.totalCount,
  });

  final String reviewTitle;
  final String reviewName;
  final String reviewDesc;
  final int usefulCount;
  final int totalCount;

  factory ReviewElement.fromRawJson(String str) => ReviewElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewElement.fromJson(Map<String, dynamic> json) => ReviewElement(
    reviewTitle: json["reviewTitle"],
    reviewName: json["reviewName"],
    reviewDesc: json["reviewDesc"],
    usefulCount: json["usefulCount"],
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "reviewTitle": reviewTitle,
    "reviewName": reviewName,
    "reviewDesc": reviewDesc,
    "usefulCount": usefulCount,
    "totalCount": totalCount,
  };
}
