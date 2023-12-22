import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_piton/product/entities/product.dart';
import 'package:flutter_piton/product/widget/appbar/appbar.dart';
import 'package:flutter_piton/product/widget/button/eleveted_button.dart';
import 'package:flutter_piton/product/widget/image/image.dart';
import 'package:flutter_piton/product/widget/button/like.dart';
import 'package:kartal/kartal.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(context, "Book Details", isBack: true),
      body: Padding(
        padding: context.padding.onlyTopNormal + context.padding.horizontalNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDisplay(product: product),
            context.sized.emptySizedHeightBoxLow3x,
            const Text("Summary"),
            context.sized.emptySizedHeightBoxLow,
            Text(product.description ?? ""),
            context.sized.emptySizedHeightBoxHigh,
            NormalElevetedButton(buttonText: "buttonText", onPressed: () {}),
          ],
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
            AppImage(imgPath: product.cover ?? "", width: 45),
            Text(
              product.name.ext.toCapitalized(),
            ),
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
