import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/categories_cubit.dart';
import 'package:flutter_piton/product/entities/categories.dart';
import 'package:flutter_piton/product/entities/category.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:flutter_piton/product/utility/constant/app_string.dart';
import 'package:flutter_piton/product/widget/button/text_button.dart';
import 'package:flutter_piton/view/home/widget/product_category_list.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (_) => CategoriesCubit()..fetchCategories(),
      child: const CategoriesListBuilder(),
    );
  }
}

class CategoriesListBuilder extends StatelessWidget {
  const CategoriesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesModel>(
      builder: (context, state) {
        return SizedBox(
          height: 110.h,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: context.padding.onlyLeftNormal + context.padding.onlyRightNormal,
            scrollDirection: Axis.vertical,
            itemCount: state.category.length,
            itemBuilder: (context, index) {
              return Categories(category: state.category[index]);
            },
          ),
        );
      },
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key, required this.category});

  final Category category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.sized.emptySizedHeightBoxLow,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(category.name, style: context.general.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            NormalTextButton(
              onPressed: () {
                context.push(RouterManager.categoryDetails, extra: category);
              },
              buttonText: AppString.viewAll,
              color: AppConstants.orangeColor,
            ),
          ],
        ),
        SizedBox(
          height: 19.h,
          child: ProductCategoryList(
            catId: category.id,
          ),
        )
      ],
    );
  }
}
