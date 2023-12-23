import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/login_cubit.dart';
import 'package:flutter_piton/product/entities/login.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:flutter_piton/product/storage/secure_storage.dart';
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
  late Timer _timer;
  void redirect() async {
    var at = await SecureStorage().readSecureData("at");
    var email = await SecureStorage().readSecureData("email");
    var password = await SecureStorage().readSecureData("password");
    // ignore: use_build_context_synchronously
    var token = await context.read<LoginCubit>().login(LoginModel(email: email ?? "", password: password ?? ""));
    debugPrint(token.action.token);
    debugPrint(at);
    debugPrint(email);
    if (at == token.action.token) {
      _timer = Timer(const Duration(seconds: 3), () {
        context.go(RouterManager.login);
      });
    } else {
      _timer = Timer(const Duration(seconds: 3), () {
        context.go(RouterManager.login);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
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
