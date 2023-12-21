import 'package:flutter/material.dart';
import 'package:flutter_piton/product/widget/appbar/appbar.dart';
import 'package:flutter_piton/view/home/widget/category_list.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(context, "Catalog"),
      body: Column(
        children: [
          context.sized.emptySizedHeightBoxLow, 
          SizedBox(width: 100.w, height: 18.w, child: const CategoryList()),
        ],
      ),
    );
  }
}
