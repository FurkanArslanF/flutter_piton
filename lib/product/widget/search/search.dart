import 'package:flutter/material.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:kartal/kartal.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyLeftNormal + context.padding.onlyTopLow + context.padding.onlyBottomLow + context.padding.onlyRightNormal,
      child: TextFormField(
        onFieldSubmitted: (value) {
          print(value);
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
      ),
    );
  }
}
