import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/api/category.dart';
import 'package:flutter_piton/product/entities/categories.dart';

class CategoriesCubit extends Cubit<CategoriesModel> {
  CategoriesCubit() : super(CategoriesModel(category: []));

  fetchCategories() async {
    try {
      final categories = await CategoryApiService.instance.getCategory();
      emit(categories);
    } catch (e) {
      rethrow;
    }
  }
}
