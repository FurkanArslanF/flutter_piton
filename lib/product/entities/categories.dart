import 'package:flutter_piton/product/entities/category.dart';

class CategoriesModel {
  CategoriesModel({
    required this.category,
  });

  final List<Category> category;

  CategoriesModel copyWith({
    required List<Category> category,
  }) {
    return CategoriesModel(category: category);
  }

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      category: List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "category": category.map((x) => x.toJson()).toList(),
      };
}

