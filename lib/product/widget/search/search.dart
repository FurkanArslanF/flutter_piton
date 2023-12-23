import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/product_category_cubit.dart';
import 'package:flutter_piton/product/entities/product_category.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCategoryCubit(),
      child: SizedBox(
        height: 17.w,
        child: Padding(
          padding: context.padding.onlyLeftNormal + context.padding.onlyTopLow + context.padding.onlyBottomLow + context.padding.onlyRightNormal,
          child: BlocBuilder<ProductCategoryCubit, ProductCategoryModel>(
            builder: (context, state) {
              return TextFormField(
                onFieldSubmitted: (value) {
                  debugPrint(value);
                  if (value.ext.isNotNullOrNoEmpty) {
                    var product = state.product.firstWhere((element) => element.name == value.toLowerCase());
                    context.push(RouterManager.productDetails, extra: product);
                  }
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  fillColor: AppConstants.widgetBg,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Transform.rotate(angle: 3.14 / 2, child: IconButton(onPressed: () {}, icon: const Icon(Icons.tune_outlined))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
