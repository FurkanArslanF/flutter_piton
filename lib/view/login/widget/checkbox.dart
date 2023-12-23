import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/checkbox.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:flutter_piton/product/utility/constant/app_string.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class LoginCheckBox extends StatefulWidget {
  const LoginCheckBox({super.key});

  @override
  State<LoginCheckBox> createState() => _LoginCheckBoxState();
}

class _LoginCheckBoxState extends State<LoginCheckBox> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckboxCubit, bool>(
      builder: (context, checkBoxValue) {
        return SizedBox(
          width: 45.w,
          child: Transform.translate(
            offset: Offset(-2.w, 0),
            child: CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(width: 2.0, color: AppConstants.textButtonColor),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              controlAffinity: ListTileControlAffinity.leading,
              value: checkBoxValue,
              onChanged: (bool? value) {
                context.read<CheckboxCubit>().toggleCheckbox();
              },
              title: Transform.translate(
                offset: Offset(-5.w, 0),
                child: Text(
                  AppString.rememberMe,
                  style: context.general.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppConstants.textButtonColor,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
