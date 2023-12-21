import 'package:flutter/material.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:kartal/kartal.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<String> _list = ["All", "Classics", "Horror", "Romance", "Science Fiction"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: context.padding.onlyLeftNormal + context.padding.onlyTopLow + context.padding.onlyBottomLow + context.padding.onlyRightNormal,
      scrollDirection: Axis.horizontal,
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Card(
            color: selectedIndex == index ? AppConstants.widgetSelectedBg : AppConstants.widgetBg,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Center(
              child: Padding(
                padding: context.padding.onlyRightNormal + context.padding.onlyLeftNormal,
                child: Text(
                  _list[index],
                  style: context.general.textTheme.bodyLarge?.copyWith(
                    color: selectedIndex == index ? AppConstants.whiteColor : AppConstants.textColor,
                    fontWeight: selectedIndex == index ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
