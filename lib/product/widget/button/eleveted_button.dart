import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_piton/product/cubit/login_cubit.dart';
import 'package:flutter_piton/product/cubit/register_cubit.dart';
import 'package:flutter_piton/product/utility/constant/app_constant.dart';
import 'package:flutter_piton/product/utility/enum/state_enum.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

class NormalElevetedButton extends StatelessWidget {
  const NormalElevetedButton({super.key, required this.buttonText, this.onPressed});
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginCubit>().state;
    final registerState = context.read<RegisterCubit>().state;

    return SizedBox(
      width: 100.w,
      height: 7.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.elevetedButtonBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: loginState == StateEnum.loading || registerState == StateEnum.loading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                buttonText,
                style: context.general.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppConstants.whiteColor,
                ),
              ),
      ),
    );
  }
}
