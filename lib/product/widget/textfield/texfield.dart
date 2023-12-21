import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({super.key, required this.controller, this.obscureText = false});
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: obscureText ? TextInputType.text : TextInputType.emailAddress,
        inputFormatters: [
          obscureText ? LengthLimitingTextInputFormatter(20) : FilteringTextInputFormatter.deny(RegExp(r"\s")),
        ],
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: const Color(0xFFF4F4F4),
          errorStyle: const TextStyle(
            fontSize: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none,
          ),
          hintText: obscureText ? "* * * * * *" : "john@mail.com",
        ),
      ),
    );
  }
}
