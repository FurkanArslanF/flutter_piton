import 'package:flutter/material.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppConstants.widgetBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: child,
    );
  }
}
