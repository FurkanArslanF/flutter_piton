import 'package:flutter/material.dart';

class AppConstants {

  static bool isAlphanumeric(String str) {
    return RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{6,}$').hasMatch(str);
  }
  static RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
  static String capitalize(String input) {
    return input.split(" ").map((str) => str.isNotEmpty ? str[0].toUpperCase() + str.substring(1) : "").join(" ");
  }

  static Color splashBgColor = const Color(0xFF1D1D4E);
  static Color elevetedButtonBgColor = const Color(0xFFEF6B4A);
  static Color textButtonColor = const Color(0xFF6251DD);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color widgetBg = const Color(0xFFF4F4FF);
  static Color widgetSelectedBg = const Color(0xFF6251DD);
  static Color textColor = const Color(0xFF090937);
  static Color orangeColor = const Color(0xFFEF6B4A);


  static String logoPath = 'assets/logo.png';
}
