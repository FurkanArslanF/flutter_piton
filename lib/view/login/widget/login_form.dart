import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/checkbox.dart';
import 'package:flutter_piton/product/cubit/login_cubit.dart';
import 'package:flutter_piton/product/entities/login.dart';
import 'package:flutter_piton/product/entities/token.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:flutter_piton/product/storage/secure_storage.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:flutter_piton/product/utility/constant/app_string.dart';
import 'package:flutter_piton/product/widget/button/eleveted_button.dart';
import 'package:flutter_piton/product/widget/toastr/toastr.dart';
import 'package:flutter_piton/view/login/widget/title_and_textfield.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: const LoginFormBuilder(),
    );
  }
}

class LoginFormBuilder extends StatefulWidget {
  const LoginFormBuilder({super.key});

  @override
  State<LoginFormBuilder> createState() => _LoginFormBuilderState();
}

class _LoginFormBuilderState extends State<LoginFormBuilder> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool emailvalide = false;
  bool passwordvalide = false;
  String passwordvalideText = "";
  String isLoading = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoginTitleAndTextField(
          controller: emailController,
          title: AppString.login,
          valide: emailvalide,
          valideText: AppString.emailValide,
        ),
        LoginTitleAndTextField(
          controller: passwordController,
          title: AppString.password,
          valide: passwordvalide,
          valideText: passwordvalideText,
          obscureText: true,
          height: 45,
        ),
        loginButton(context),
      ],
    );
  }

  MultiBlocListener loginButton(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, TokenModel>(
          listener: (context, loginState) {
            if (context.read<CheckboxCubit>().state == true) {
              SecureStorage().writeSecureData("email", emailController.text);
              SecureStorage().writeSecureData("password", passwordController.text);
              SecureStorage().writeSecureData("at", loginState.action.token);
            }
            if (loginState.action.token.ext.isNotNullOrNoEmpty) {
              ToastrMsg.instance.showToastrMsg(context, AppString.loginToastr);
              context.go(RouterManager.home);
            } else if (loginState.action.token.ext.isNullOrEmpty) {
              ToastrMsg.instance.showToastrMsg(context, AppString.loginToastr2);
            } else {
              setState(() {
                isLoading = "loading";
              });
            }
          },
        ),
      ],
      child: Padding(
        padding: context.padding.onlyTopMedium * 1.8,
        child: NormalElevetedButton(
          buttonText: AppString.login,
          state: isLoading,
          onPressed: () async {
            login(context);
          },
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    setState(() {
      emailvalide = false;
      passwordvalide = false;
    });
    if ((emailController.text.ext.isNotNullOrNoEmpty && emailController.text.contains("@")) && (passwordController.text.ext.isNotNullOrNoEmpty && passwordController.text.length >= 6)) {
      final loginModel = LoginModel(
        email: emailController.text,
        password: passwordController.text,
      );
      await context.read<LoginCubit>().login(loginModel);
    } else {
      if (emailController.text.ext.isNullOrEmpty || !emailController.text.contains("@")) {
        setState(() {
          emailvalide = true;
        });
      }
      if (passwordController.text.ext.isNullOrEmpty || passwordController.text.length < 6 || !AppConstants.isAlphanumeric(passwordController.text)) {
        setState(() {
          passwordvalide = true;
          if (passwordController.text.isEmpty) {
            passwordvalideText = AppString.psswordValide;
          } else if (passwordController.text.length < 6) {
            passwordvalideText = AppString.passwordValide2;
          } else {
            passwordvalideText = AppString.passwordValide3;
          }
        });
      }
    }
  }
}
