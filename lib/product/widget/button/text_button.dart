import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NormalTextButton extends StatelessWidget {
  const NormalTextButton({super.key, this.onPressed, required this.buttonText, this.color = const Color(0xFF6251DD)});
  final void Function()? onPressed;
  final String buttonText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: context.general.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
