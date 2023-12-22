class Category {
  Category({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  final int id;
  final String name;
  final DateTime createdAt;

  Category copyWith({
    required int id,
    required String name,
    required DateTime createdAt,
  }) {
    return Category(
      id: id,
      name: name,
      createdAt: createdAt,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
      createdAt: DateTime.tryParse(json["created_at"]) ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
      };
}
