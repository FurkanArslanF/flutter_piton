import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class NormalAndBoldText extends StatelessWidget {
  const NormalAndBoldText({super.key, required this.normalText, required this.boldText});
  final String normalText;
  final String boldText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          normalText,
          style: context.general.textTheme.bodyLarge,
        ),
        context.sized.emptySizedHeightBoxLow,
        Text(
          boldText,
          style: context.general.textTheme.bodyLarge?.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
