import 'package:flutter/material.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:flutter_piton/product/widget/button/eleveted_button.dart';
import 'package:flutter_piton/product/widget/button/text_button.dart';
import 'package:flutter_piton/product/widget/logo.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void redirect() {
    Future.delayed(const Duration(seconds: 3), () {
      context.go(RouterManager.login);
    });
  }

  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.splashBgColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(margin: EdgeInsets.only(top: 34.h), child: AppLogo(width: 51.w)),
          Container(
            margin: EdgeInsets.only(top: 82.h),
            padding: context.padding.horizontalNormal,
            child: Column(
              children: [
                NormalElevetedButton(
                  buttonText: "Login",
                  onPressed: () {
                    context.go(RouterManager.login);
                  },
                ),
                context.sized.emptySizedHeightBoxLow,
                NormalTextButton(buttonText: "Skip", onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
