import 'package:flutter/material.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';

import 'package:kartal/kartal.dart';

class NormalTextButton extends StatelessWidget {
  const NormalTextButton({super.key, this.onPressed, required this.buttonText});
  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: context.general.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppConstants.textButtonColor,
        ),
      ),
    );
  }
}
