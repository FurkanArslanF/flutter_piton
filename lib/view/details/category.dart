import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/product_category_cubit.dart';
import 'package:flutter_piton/product/entities/category.dart';
import 'package:flutter_piton/product/entities/product.dart';
import 'package:flutter_piton/product/entities/product_category.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:flutter_piton/product/widget/appbar/appbar.dart';
import 'package:flutter_piton/product/widget/card/card.dart';
import 'package:flutter_piton/product/widget/image/image.dart';
import 'package:flutter_piton/product/widget/search/search.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCategoryCubit>(
      create: (_) => ProductCategoryCubit()..fetchProductCategories(category.id),
      child: CategoryDetailsScreenBuilder(category: category),
    );
  }
}

class CategoryDetailsScreenBuilder extends StatelessWidget {
  const CategoryDetailsScreenBuilder({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(context, category.name, isBack: true),
      body: BlocBuilder<ProductCategoryCubit, ProductCategoryModel>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              height: 120.h,
              child: Column(
                children: [
                  context.sized.emptySizedHeightBoxLow,
                  const AppSearchBar(),
                  SizedBox(
                    height: 110.h,
                    child: GridView.builder(
                      cacheExtent: 1000,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: context.padding.onlyLeftNormal + context.padding.onlyRightNormal,
                      itemCount: state.product.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            debugPrint("Product Id: ${state.product[index].id}");
                          },
                          child: Products(
                            product: state.product[index],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Products extends StatelessWidget {
  const Products({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //context.sized.emptySizedHeightBoxLow,
          AppImage(imgPath: product.cover ?? "", width: 45),
          Padding(
            padding: context.padding.onlyLeftNormal,
            child: Text(
              AppConstants.capitalize(product.name ?? ""),
              style: context.general.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, fontSize: 7.sp),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: context.padding.onlyLeftNormal + context.padding.onlyRightNormal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  product.author ?? "",
                  style: context.general.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600, fontWeight: FontWeight.w600, fontSize: 5.5.sp),
                ),
                Text(
                  "${product.price} \$",
                  style: context.general.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppConstants.widgetSelectedBg,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
