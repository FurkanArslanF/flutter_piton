import 'package:flutter/material.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:flutter_piton/product/utility/constant/app_string.dart';
import 'package:flutter_piton/product/widget/button/text_button.dart';
import 'package:flutter_piton/product/widget/textfield/texfield.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class RegisterTitleAndTextField extends StatelessWidget {
  const RegisterTitleAndTextField({super.key, required this.controller, required this.title, required this.valideText, this.valide = false, this.obscureText = false, this.height = 30});
  final String title;
  final TextEditingController controller;
  final bool valide;
  final String valideText;
  final bool obscureText;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.general.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          context.sized.emptySizedHeightBoxLow,
          AppTextFormField(
            controller: controller,
            obscureText: obscureText,
          ),
          valide
              ? Text(
                  valideText,
                  style: context.general.textTheme.bodySmall?.copyWith(
                    color: context.general.colorScheme.error,
                  ),
                )
              : const SizedBox(),
          obscureText
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NormalTextButton(
                      buttonText: AppString.login,
                      onPressed: () {
                        context.go(RouterManager.login);
                      },
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
