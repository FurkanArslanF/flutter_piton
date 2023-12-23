import 'package:flutter/material.dart';
import 'package:flutter_piton/product/utility/constant/app_string.dart';
import 'package:flutter_piton/product/widget/logo.dart';
import 'package:flutter_piton/product/widget/text/normal_and_bold_text.dart';
import 'package:flutter_piton/view/login/widget/login_form.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.h),
          padding: context.padding.horizontalNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: AppLogo(width: 26.w),
              ),
              context.sized.emptySizedHeightBoxHigh,
              const NormalAndBoldText(
                normalText: AppString.loginWelcomeBack,
                boldText: AppString.loginLoginToYourAccount,
              ),
              context.sized.emptySizedHeightBoxHigh,
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
