import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/product_category_cubit.dart';
import 'package:flutter_piton/product/entities/product.dart';
import 'package:flutter_piton/product/entities/product_category.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:flutter_piton/product/widget/card/card.dart';
import 'package:flutter_piton/product/widget/image/image.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class ProductCategoryList extends StatelessWidget {
  const ProductCategoryList({super.key, required this.catId});
  final int catId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCategoryCubit()..fetchProductCategories(catId),
      child: const ProductCategoryListBuilder(),
    );
  }
}

class ProductCategoryListBuilder extends StatelessWidget {
  const ProductCategoryListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCategoryCubit, ProductCategoryModel>(
      builder: (context, state) {
        return ListView.builder(
          cacheExtent: 1000,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: state.product.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                debugPrint("Product Id: ${state.product[index].id}");
              },
              child: SizedBox(
                width: 55.w,
                child: Products(
                  product: state.product[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Products extends StatelessWidget {
  const Products({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImage(imgPath: product.cover ?? "", width: 26),
          Container(
            margin: context.padding.onlyTopMedium + context.padding.onlyBottomMedium,
            width: 25.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppConstants.capitalize(product.name ?? ""),
                  style: context.general.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
                Expanded(
                  child: Text(
                    product.author ?? "",
                    style: context.general.textTheme.bodySmall?.copyWith(color: Colors.grey.shade600, fontWeight: FontWeight.w600, fontSize: 7.sp),
                  ),
                ),
                Expanded(
                  child: Text(
                    "${product.price} \$",
                    style: context.general.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppConstants.widgetSelectedBg,
                    ),
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