import 'package:flutter/material.dart';
import 'package:flutter_piton/product/entities/product.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:flutter_piton/product/widget/appbar/appbar.dart';
import 'package:flutter_piton/product/widget/button/eleveted_button.dart';
import 'package:flutter_piton/product/widget/image/image.dart';
import 'package:flutter_piton/product/widget/button/like.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(context, "Book Details", isBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.padding.onlyTopNormal + context.padding.onlyBottomNormal + context.padding.horizontalNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProductDisplay(product: product),
              context.sized.emptySizedHeightBoxLow3x,
              Text("Summary", style: context.general.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 15.sp)),
              context.sized.emptySizedHeightBoxLow,
              Text(product.description ?? "", style: context.general.textTheme.bodyLarge),
              context.sized.emptySizedHeightBoxLow3x,
              NormalElevetedButton(isDetail: true, buttonText: "${product.price} \$", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDisplay extends StatelessWidget {
  const ProductDisplay({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImage(imgPath: product.cover ?? "", width: 40),
            Text(
              //product.name.ext.toCapitalized(),
              AppConstants.capitalize(product.name ?? ""),
              style: context.general.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            context.sized.emptySizedHeightBoxLow,
            Text(
              product.author ?? "",
            ),
          ],
        ),
        const Align(
          alignment: Alignment.topRight,
          child: LikeButton(),
        )
      ],
    );
  }
}
