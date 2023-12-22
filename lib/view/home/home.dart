import 'package:flutter/material.dart';
import 'package:flutter_piton/product/widget/appbar/appbar.dart';
import 'package:flutter_piton/product/widget/search/search.dart';
import 'package:flutter_piton/view/home/widget/categories_list.dart';
import 'package:flutter_piton/view/home/widget/category_top_list.dart';
import 'package:kartal/kartal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(context, "Catalog"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            context.sized.emptySizedHeightBoxLow,
            const CategoryTopList(),
            const AppSearchBar(),
            context.sized.emptySizedHeightBoxLow,
            const CategoriesList(),
            context.sized.emptySizedHeightBoxHigh,
          ],
        ),
      ),
    );
  }
}
