import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/login_cubit.dart';
import 'package:flutter_piton/product/entities/login.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:flutter_piton/product/widget/button/eleveted_button.dart';
import 'package:flutter_piton/product/widget/toastr/toastr.dart';
import 'package:flutter_piton/view/login/widget/title_and_textfield.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool emailvalide = false;
  bool passwordvalide = false;
  String passwordvalideText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoginTitleAndTextField(
          controller: emailController,
          title: "Email",
          valide: emailvalide,
          valideText: "Lütfen geçerli bir email giriniz",
        ),
        LoginTitleAndTextField(
          controller: passwordController,
          title: "Password",
          valide: passwordvalide,
          valideText: passwordvalideText,
          obscureText: true,
          height: 45,
        ),
        Padding(
          padding: context.padding.onlyTopMedium * 1.8,
          child: NormalElevetedButton(
            buttonText: "Login",
            onPressed: () async {
              login(context);
            },
          ),
        ),
      ],
    );
  }

  Future<void> login(BuildContext context) async {
    setState(() {
      emailvalide = false;
      passwordvalide = false;
    });
    if (emailController.text.ext.isNotNullOrNoEmpty && (passwordController.text.ext.isNotNullOrNoEmpty && passwordController.text.length >= 6)) {
      final loginModel = LoginModel(
        email: emailController.text,
        password: passwordController.text,
      );
      await context.read<LoginCubit>().login(loginModel);
      if (context.mounted) {
        final state = context.read<LoginCubit>().state;
        if (state == "success") {
          context.go(RouterManager.home);
        } else {
          ToastrMsg.instance.showToastrMsg(context, state);
        }
      }
    } else {
      if (emailController.text.ext.isNullOrEmpty || !emailController.text.contains("@")) {
        setState(() {
          emailvalide = true;
        });
      }
      if (passwordController.text.ext.isNullOrEmpty || passwordController.text.length < 6) {
        setState(() {
          passwordvalide = true;
          if (passwordController.text.ext.isNullOrEmpty) {
            passwordvalideText = "Lütfen şifrenizi giriniz";
          } else {
            passwordvalideText = "Şifreniz en az 6 karakter olmalıdır";
          }
        });
      }
    }
  }
}
