class Count {
  Count({
    required this.count,
  });

  final int? count;

  Count copyWith({
    int? count,
  }) {
    return Count(
      count: count ?? this.count,
    );
  }

  factory Count.fromJson(Map<String, dynamic> json) {
    return Count(
      count: json["count"],
    );
  }

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}
