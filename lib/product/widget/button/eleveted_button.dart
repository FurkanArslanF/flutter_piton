import 'package:flutter/material.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class NormalElevetedButton extends StatelessWidget {
  const NormalElevetedButton({super.key, required this.buttonText, this.onPressed, this.isDetail = false, this.state = ""});
  final String buttonText;
  final void Function()? onPressed;
  final bool isDetail;
  final String state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 7.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.elevetedButtonBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: state == "loading"
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: isDetail ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                children: [
                  Text(
                    buttonText,
                    style: context.general.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppConstants.whiteColor,
                    ),
                  ),
                  Text(
                    isDetail ? "Buy Now" : "",
                    style: context.general.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppConstants.whiteColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
