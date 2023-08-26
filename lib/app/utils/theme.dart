import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_themes/stacked_themes.dart';

class CustomThemeData {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // primaryColor: const Color(0xff925012),
    primaryColor: const Color(0xff0C95EF),
    scaffoldBackgroundColor: const Color(0xffF9FAFB),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.dmSans(
          color: const Color(0xff667085),
          fontSize: 18,
          fontWeight: FontWeight.w600),
      titleMedium: GoogleFonts.dmSans(
          color: const Color(0xff667085),
          fontSize: 16,
          fontWeight: FontWeight.w600),
      titleSmall: GoogleFonts.dmSans(
          color: const Color(0xff667085),
          fontSize: 10,
          fontWeight: FontWeight.w400),
      bodyLarge: GoogleFonts.dmSans(
          color: const Color(0xff667085),
          fontSize: 16,
          fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.dmSans(
          color: const Color(0xff667085),
          fontSize: 10,
          fontWeight: FontWeight.w400),
      bodySmall: GoogleFonts.dmSans(
          color: const Color(0xff667085),
          fontSize: 8,
          fontWeight: FontWeight.w400),
    ),
    secondaryHeaderColor: const Color(0xff98A2B3),
  );
  static ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0xff0B7FCB),
      scaffoldBackgroundColor: const Color(0xff0C2031),
      secondaryHeaderColor: const Color(0xff98A2B3),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.dmSans(
            color: const Color(0xffD0D5DD),
            fontSize: 18,
            fontWeight: FontWeight.w600),
        titleMedium: GoogleFonts.dmSans(
            color: const Color(0xffD0D5DD),
            fontSize: 16,
            fontWeight: FontWeight.w600),
        titleSmall: GoogleFonts.dmSans(
            color: const Color(0xffD0D5DD),
            fontSize: 10,
            fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.dmSans(
            color: const Color(0xffD0D5DD),
            fontSize: 16,
            fontWeight: FontWeight.w400),
        bodyMedium: GoogleFonts.dmSans(
            color: const Color(0xffD0D5DD),
            fontSize: 10,
            fontWeight: FontWeight.w400),
        bodySmall: GoogleFonts.dmSans(
            color: const Color(0xffD0D5DD),
          fontSize: 8,
            fontWeight: FontWeight.w400),
      ));

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
