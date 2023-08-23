import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_themes/stacked_themes.dart';

class CustomThemeData {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // primaryColor: const Color(0xff925012),
    primaryColor: const Color(0xff0C95EF),
    scaffoldBackgroundColor: const Color(0xffF9FAFB),
    secondaryHeaderColor: const Color(0xffD0D5DD),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff0C95EF),
    scaffoldBackgroundColor: const Color(0xff0C2031),
    secondaryHeaderColor: const Color(0xff98A2B3),
  );

  // static TextStyle generateStyle(
  //     {required double fontSize,
  //     FontWeight fontWeight = FontWeight.normal,
  //     Color color = Colors.black,
  //     double? lineHeight}) {
  //   return TextStyle(
  //       fontFamily: 'Gilroy',
  //       color: color,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //       height: lineHeight,
  //       fontStyle: FontStyle.normal,
  //       decoration: TextDecoration.none);
  // }

  static TextStyle generateStyle(
      {required double fontSize,
      FontWeight fontWeight = FontWeight.normal,
      Color color = Colors.black,
      double? lineHeight}) {
    return GoogleFonts.dmSans(
        // fontFamily: 'Gilroy',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineHeight,
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none);
  }

  static bool isDarkMode(BuildContext context) {
    return getThemeManager(context).getSelectedTheme().themeMode ==
        ThemeMode.dark;
  }
}
