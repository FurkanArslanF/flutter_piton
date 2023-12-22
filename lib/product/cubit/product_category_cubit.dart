import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/api/product_category.dart';
import 'package:flutter_piton/product/entities/product_category.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryModel> {
  ProductCategoryCubit() : super(ProductCategoryModel(product: []));

  fetchProductCategories(int catId) async {
    try {
      final category = await ProductCategoryApiService.instance.getProductCategory(catId);
      emit(category);
    } catch (e) {
      rethrow;
    }
  }
}
