import 'package:flutter/material.dart';
import 'package:flutter_piton/product/widget/button/eleveted_button.dart';
import 'package:flutter_piton/product/widget/button/text_button.dart';
import 'package:flutter_piton/product/widget/textfield/texfield.dart';
import 'package:flutter_piton/view/login/widget/checkbox.dart';
import 'package:kartal/kartal.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "E-mail",
          style: context.general.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        context.sized.emptySizedHeightBoxLow,
        AppTextFormField(
          controller: emailController,
        ),
        context.sized.emptySizedHeightBoxLow3x,
        Text(
          "Password",
          style: context.general.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        context.sized.emptySizedHeightBoxLow,
        AppTextFormField(
          controller: passwordController,
          obscureText: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const LoginCheckBox(),
            NormalTextButton(
              buttonText: "Register",
              onPressed: () {},
            ),
          ],
        ),
        context.sized.emptySizedHeightBoxHigh,
        context.sized.emptySizedHeightBoxLow3x,
        NormalElevetedButton(
          buttonText: "Login",
          onPressed: () {},
        ),
      ],
    );
  }
}
