import 'dart:io';

import 'package:flutter_piton/product/api/dio_mixin.dart';
import 'package:flutter_piton/product/entities/categories.dart';

abstract class ICategoryService {
  Future<CategoriesModel> getCategory();
}

class CategoryApiService extends ICategoryService with DioServiceMixin {
  CategoryApiService._();
  static final instance = CategoryApiService._();
  static const apiBaseUrl = 'categories';

  late CategoriesModel _categories;

  @override
  Future<CategoriesModel> getCategory() async {
    try {
      final response = await dio.get(apiBaseUrl);
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          _categories = CategoriesModel.fromJson(data);
        }
      }
    } catch (e) {
      rethrow;
    }
    return _categories;
  }
}
