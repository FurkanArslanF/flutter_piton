import 'package:flutter/material.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppConstants.logoPath, width: width);
  }
}
