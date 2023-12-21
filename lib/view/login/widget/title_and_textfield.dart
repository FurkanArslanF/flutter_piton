import 'package:flutter/material.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:flutter_piton/product/widget/button/text_button.dart';
import 'package:flutter_piton/product/widget/textfield/texfield.dart';
import 'package:flutter_piton/view/login/widget/checkbox.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class LoginTitleAndTextField extends StatelessWidget {
  const LoginTitleAndTextField({super.key, required this.controller, required this.title, required this.valideText, this.valide = false, this.obscureText = false, this.height = 30});
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LoginCheckBox(),
                    NormalTextButton(
                      buttonText: "Register",
                      onPressed: () {
                        context.go(RouterManager.register);
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