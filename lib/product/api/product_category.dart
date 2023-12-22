import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_piton/product/api/dio_mixin.dart';
import 'package:flutter_piton/product/entities/product_category.dart';

abstract class IProductCategoryService {
  Future<ProductCategoryModel> getProductCategory(int catId);
}

class ProductCategoryApiService extends IProductCategoryService with DioServiceMixin {
  ProductCategoryApiService._();
  static final instance = ProductCategoryApiService._();
  static const apiBaseUrl = 'products/';

  late ProductCategoryModel _productCategory;

  @override
  Future<ProductCategoryModel> getProductCategory(int catId) async {
    try {
      final response = await dio.get("$apiBaseUrl$catId");
      if (response.statusCode == HttpStatus.ok) {
        //debugPrint(response.data.toString());
        final data = response.data;
        if (data is Map<String, dynamic>) {
          _productCategory = ProductCategoryModel.fromJson(data);
        }
      }
    } catch (e) {
      rethrow;
    }
    return _productCategory;
  }
}
