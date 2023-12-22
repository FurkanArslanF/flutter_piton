import 'package:flutter/material.dart';
import 'package:flutter_piton/product/widget/logo.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget appAppbar(BuildContext context, String title, {bool isBack = false}) {
  return AppBar(
    elevation: 0.5,
    iconTheme: const IconThemeData(color: Colors.black),
    foregroundColor: Colors.white,
    backgroundColor: Colors.white,
    shadowColor: Colors.black,
    toolbarHeight: 17.w,
    leading: isBack
        ? null
        : Padding(
            padding: context.padding.onlyLeftNormal,
            child: AppLogo(width: 20.w),
          ),
    leadingWidth: 17.w,
    actions: [
      Padding(
        padding: context.padding.onlyRightNormal,
        child: Text(
          title,
          style: context.general.textTheme.bodyLarge?.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
