import 'package:flutter/material.dart';
import 'package:flutter_piton/product/widget/logo.dart';
import 'package:flutter_piton/product/widget/text/normal_and_bold_text.dart';
import 'package:flutter_piton/view/register/widget/login_form.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                normalText: "Welcome back!",
                boldText: "Register an account",
              ),
              context.sized.emptySizedHeightBoxHigh,
              const RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
