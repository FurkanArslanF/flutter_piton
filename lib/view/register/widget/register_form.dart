import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/register_cubit.dart';
import 'package:flutter_piton/product/entities/register.dart';
import 'package:flutter_piton/product/navigation/go_router.dart';
import 'package:flutter_piton/product/storage/secure_storage.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:flutter_piton/product/utility/constant/app_string.dart';
import 'package:flutter_piton/product/widget/button/eleveted_button.dart';
import 'package:flutter_piton/product/widget/toastr/toastr.dart';
import 'package:flutter_piton/view/register/widget/title_and_textfield.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: const RegisterFormBuilder(),
    );
  }
}

class RegisterFormBuilder extends StatefulWidget {
  const RegisterFormBuilder({super.key});

  @override
  State<RegisterFormBuilder> createState() => _RegisterFormBuilderState();
}

class _RegisterFormBuilderState extends State<RegisterFormBuilder> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool namevalide = false;
  bool emailvalide = false;
  bool passwordvalide = false;
  String passwordvalideText = "";
  String isLoading = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegisterTitleAndTextField(
          controller: nameController,
          title:  AppString.registerName,
          valide: namevalide,
          valideText: AppString.nameValide,
          height: 26,
        ),
        RegisterTitleAndTextField(
          controller: emailController,
          title: AppString.email,
          valide: emailvalide,
          valideText: AppString.emailValide,
          height: 26,
        ),
        RegisterTitleAndTextField(
          controller: passwordController,
          title: AppString.password,
          valide: passwordvalide,
          valideText: passwordvalideText,
          obscureText: true,
          height: 39,
        ),
        //context.sized.emptySizedHeightBoxNormal,
        registerButton(context)
      ],
    );
  }

  BlocListener<RegisterCubit, String> registerButton(BuildContext context) {
    return BlocListener<RegisterCubit, String>(
        listener: (context, state) {
          if (state == "success") {
            ToastrMsg.instance.showToastrMsg(context, AppString.registerToastr);
            SecureStorage().deleteSecureData();
            context.go(RouterManager.home);
          } else if (state == "error") {
            ToastrMsg.instance.showToastrMsg(context, AppString.registerToastr2);
          } else {
            setState(() {
              isLoading = state;
            });
          }
        },
        child: NormalElevetedButton(
          buttonText: AppString.register,
          state: isLoading,
          onPressed: () async {
            register(context);
          },
        ),
      );
  }

  Future<void> register(BuildContext context) async {
    debugPrint(AppConstants.isAlphanumeric(passwordController.text).toString());
    setState(() {
      namevalide = false;
      emailvalide = false;
      passwordvalide = false;
    });
    if (nameController.text.ext.isNotNullOrNoEmpty &&
        (emailController.text.ext.isNotNullOrNoEmpty && emailController.text.contains("@")) &&
        (passwordController.text.ext.isNotNullOrNoEmpty && passwordController.text.length >= 6 && AppConstants.isAlphanumeric(passwordController.text))) {
      final registerModel = RegisterModel(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
      );
      await context.read<RegisterCubit>().register(registerModel);
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
      if (passwordController.text.ext.isNullOrEmpty || passwordController.text.length < 6 || AppConstants.isAlphanumeric(passwordController.text) == false) {
        setState(() {
          passwordvalide = true;
          if (passwordController.text.isEmpty) {
            passwordvalideText = AppString.psswordValide;
          } else if (passwordController.text.length < 6) {
            passwordvalideText = AppString.passwordValide2;
          } else if (!AppConstants.isAlphanumeric(passwordController.text)) {
            passwordvalideText = AppString.passwordValide3;
          }
        });
      }
    }
  }
}
