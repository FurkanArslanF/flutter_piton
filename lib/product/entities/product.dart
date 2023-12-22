import 'package:flutter_piton/product/entities/likes.dart';

class Product {
  Product({
    required this.author,
    required this.cover,
    required this.createdAt,
    required this.description,
    required this.id,
    required this.name,
    required this.price,
    required this.sales,
    required this.slug,
    required this.likesAggregate,
  });

  final String? author;
  final String? cover;
  final String? createdAt;
  final String? description;
  final int? id;
  final String? name;
  final num? price;
  final int? sales;
  final String? slug;
  final Likes? likesAggregate;

  Product copyWith({
    String? author,
    String? cover,
    String? createdAt,
    String? description,
    int? id,
    String? name,
    num? price,
    int? sales,
    String? slug,
    Likes? likesAggregate,
  }) {
    return Product(
      author: author ?? this.author,
      cover: cover ?? this.cover,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      sales: sales ?? this.sales,
      slug: slug ?? this.slug,
      likesAggregate: likesAggregate ?? this.likesAggregate,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      author: json["author"],
      cover: json["cover"],
      createdAt: json["createdAt"],
      description: json["description"],
      id: json["id"],
      name: json["name"],
      price: json["price"],
      sales: json["sales"],
      slug: json["slug"],
      likesAggregate: json["likes_aggregate"] == null ? null : Likes.fromJson(json["likes_aggregate"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "author": author,
        "cover": cover,
        "created_at": createdAt,
        "description": description,
        "id": id,
        "name": name,
        "price": price,
        "sales": sales,
        "slug": slug,
        "likes_aggregate": likesAggregate?.toJson(),
      };
}
