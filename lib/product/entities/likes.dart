import 'package:flutter_piton/product/entities/count.dart';

class Likes {
  Likes({
    required this.aggregate,
  });

  final Count? aggregate;

  Likes copyWith({
    Count? aggregate,
  }) {
    return Likes(
      aggregate: aggregate ?? this.aggregate,
    );
  }

  factory Likes.fromJson(Map<String, dynamic> json) {
    return Likes(
      aggregate: json["aggregate"] == null ? null : Count.fromJson(json["aggregate"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "aggregate": aggregate?.toJson(),
      };
}
