import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/image_cubit.dart';
import 'package:flutter_piton/product/cubit/product_category_cubit.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ProductCategoryCubit()), BlocProvider(create: (context) => ImageCubit())],
      child: SizedBox(
        height: 17.w,
        child: Padding(
          padding: context.padding.onlyLeftNormal + context.padding.onlyTopLow + context.padding.onlyBottomLow + context.padding.onlyRightNormal,
          child: TextFormField(
            onEditingComplete: () {
              //context.read<ProductCategoryCubit>().fetchProductCategory();
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
        ),
      ),
    );
  }
}
