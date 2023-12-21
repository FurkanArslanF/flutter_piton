import 'package:flutter/material.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class ToastrMsg {
  ToastrMsg._();
  static final instance = ToastrMsg._();

  void showToastrMsg(BuildContext context, String message) {
    FToast fToast = FToast();
    fToast.init(context);
    fToast.showToast(
      child: Padding(
        padding: context.padding.onlyBottomNormal,
        child: SizedBox(
          width: 100.w,
          height: 15.w,
          child: Card(
            color: AppConstants.elevetedButtonBgColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                message,
                style: context.general.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
