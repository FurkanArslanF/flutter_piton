import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/register_cubit.dart';
import 'package:flutter_piton/product/entities/register.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:flutter_piton/product/widget/button/eleveted_button.dart';
import 'package:flutter_piton/product/widget/toastr/toastr.dart';
import 'package:flutter_piton/view/register/widget/title_and_textfield.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool namevalide = false;
  bool emailvalide = false;
  bool passwordvalide = false;
  String passwordvalideText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegisterTitleAndTextField(
          controller: nameController,
          title: "Name",
          valide: namevalide,
          valideText: "Lütfen geçerli bir isim giriniz",
          height: 26,
        ),
        RegisterTitleAndTextField(
          controller: emailController,
          title: "Email",
          valide: emailvalide,
          valideText: "Lütfen geçerli bir email giriniz",
          height: 26,
        ),
        RegisterTitleAndTextField(
          controller: passwordController,
          title: "Password",
          valide: passwordvalide,
          valideText: passwordvalideText,
          obscureText: true,
          height: 39,
        ),
        //context.sized.emptySizedHeightBoxNormal,
        NormalElevetedButton(
          buttonText: "Register",
          onPressed: () async {
            login(context);
          },
        ),
      ],
    );
  }

  Future<void> login(BuildContext context) async {
    setState(() {
      namevalide = false;
      emailvalide = false;
      passwordvalide = false;
    });
    if (nameController.text.ext.isNotNullOrNoEmpty && emailController.text.ext.isNotNullOrNoEmpty && (passwordController.text.ext.isNotNullOrNoEmpty && passwordController.text.length >= 6)) {
      final registerModel = RegisterModel(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
      );
      await context.read<RegisterCubit>().register(registerModel);
      if (context.mounted) {
        final state = context.read<RegisterCubit>().state;
        if (state == "success") {
          context.go(RouterManager.home);
        } else {
          ToastrMsg.instance.showToastrMsg(context, state);
        }
      }
    } else {
      if (nameController.text.ext.isNullOrEmpty) {
        setState(() {
          namevalide = true;
        });
      }
      if (emailController.text.ext.isNullOrEmpty || !emailController.text.contains("@")) {
        setState(() {
          emailvalide = true;
        });
      }
      if (passwordController.text.ext.isNullOrEmpty || passwordController.text.length < 6 || !AppConstants.isAlphanumeric(passwordController.text)) {
        setState(() {
          passwordvalide = true;
          if (passwordController.text.isEmpty) {
            passwordvalideText = "Lütfen şifrenizi oluşturun";
          } else if (passwordController.text.length < 6) {
            passwordvalideText = "Şifreniz en az 6 karakter olmalıdır";
          } else {
            passwordvalideText = "Şifreniz alfanümerik olmalıdır";
          }
        });
      }
    }
  }
}
