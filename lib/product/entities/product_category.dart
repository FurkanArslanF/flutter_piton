import 'package:flutter_piton/product/entities/product.dart';

class ProductCategoryModel {
  ProductCategoryModel({
    required this.product,
  });

  final List<Product> product;

  ProductCategoryModel copyWith({
    List<Product>? product,
  }) {
    return ProductCategoryModel(
      product: product ?? this.product,
    );
  }

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      product: json["product"] == null ? [] : List<Product>.from(json["product"]!.map((x) => Product.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "product": product.map((x) => x.toJson()).toList(),
      };
}




