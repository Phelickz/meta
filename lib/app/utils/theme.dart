import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta_trader/app/utils/utils.dart';
import 'package:stacked_themes/stacked_themes.dart';

class CustomThemeData {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // primaryColor: const Color(0xff925012),
    primaryColor: const Color(0xff0C95EF),
    scaffoldBackgroundColor: const Color(0xffF9FAFB),
    textTheme: TextTheme(
      titleLarge: textDirection.value == TextDirection.rtl
          ? GoogleFonts.notoKufiArabic(
              color: const Color(0xff667085),
              fontSize: 18,
              fontWeight: FontWeight.w600)
          : GoogleFonts.dmSans(
              color: const Color(0xff667085),
              fontSize: 18,
              fontWeight: FontWeight.w600),
      titleMedium: textDirection.value == TextDirection.rtl
          ? GoogleFonts.notoKufiArabic(
              color: const Color(0xff667085),
              fontSize: 16,
              fontWeight: FontWeight.w600)
          : GoogleFonts.dmSans(
              color: const Color(0xff667085),
              fontSize: 16,
              fontWeight: FontWeight.w600),
      titleSmall: textDirection.value == TextDirection.rtl
          ? GoogleFonts.notoKufiArabic(
              color: const Color(0xff667085),
              fontSize: 10,
              fontWeight: FontWeight.w400)
          : GoogleFonts.dmSans(
              color: const Color(0xff667085),
              fontSize: 10,
              fontWeight: FontWeight.w400),
      labelLarge: textDirection.value == TextDirection.rtl
          ? GoogleFonts.notoKufiArabic(
              color: const Color(0xff667085),
              fontSize: 14,
              fontWeight: FontWeight.w600)
          : GoogleFonts.dmSans(
              color: const Color(0xff667085),
              fontSize: 14,
              fontWeight: FontWeight.w600),
      labelMedium: textDirection.value == TextDirection.rtl
          ? GoogleFonts.notoKufiArabic(
              color: const Color(0xff667085),
              fontSize: 14,
              fontWeight: FontWeight.w400)
          : GoogleFonts.dmSans(
              color: const Color(0xff667085),
              fontSize: 14,
              fontWeight: FontWeight.w400),
      bodyLarge: textDirection.value == TextDirection.rtl
          ? GoogleFonts.notoKufiArabic(
              color: const Color(0xff667085),
              fontSize: 16,
              fontWeight: FontWeight.w400)
          : GoogleFonts.dmSans(
              color: const Color(0xff667085),
              fontSize: 16,
              fontWeight: FontWeight.w400),
      bodyMedium: textDirection.value == TextDirection.rtl
          ? GoogleFonts.notoKufiArabic(
              color: const Color(0xff667085),
              fontSize: 10,
              fontWeight: FontWeight.w400)
          : GoogleFonts.dmSans(
              color: const Color(0xff667085),
              fontSize: 10,
              fontWeight: FontWeight.w400),
      bodySmall: textDirection.value == TextDirection.rtl
          ? GoogleFonts.notoKufiArabic(
              color: const Color(0xff667085),
              fontSize: 8,
              fontWeight: FontWeight.w400)
          : GoogleFonts.dmSans(
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
        titleLarge: textDirection.value == TextDirection.rtl
            ? GoogleFonts.notoKufiArabic(
                color: const Color(0xffD0D5DD),
                fontSize: 18,
                fontWeight: FontWeight.w600)
            : GoogleFonts.dmSans(
                color: const Color(0xffD0D5DD),
                fontSize: 18,
                fontWeight: FontWeight.w600),
        titleMedium: textDirection.value == TextDirection.rtl
            ? GoogleFonts.notoKufiArabic(
                color: const Color(0xffD0D5DD),
                fontSize: 16,
                fontWeight: FontWeight.w600)
            : GoogleFonts.dmSans(
                color: const Color(0xffD0D5DD),
                fontSize: 16,
                fontWeight: FontWeight.w600),
        titleSmall: textDirection.value == TextDirection.rtl
            ? GoogleFonts.notoKufiArabic(
                color: const Color(0xffD0D5DD),
                fontSize: 10,
                fontWeight: FontWeight.w600)
            : GoogleFonts.dmSans(
                color: const Color(0xffD0D5DD),
                fontSize: 10,
                fontWeight: FontWeight.w600),
        labelLarge: textDirection.value == TextDirection.rtl
            ? GoogleFonts.notoKufiArabic(
                color: const Color(0xffD0D5DD),
                fontSize: 14,
                fontWeight: FontWeight.w600)
            : GoogleFonts.dmSans(
                color: const Color(0xffD0D5DD),
                fontSize: 14,
                fontWeight: FontWeight.w600),
        labelMedium: textDirection.value == TextDirection.rtl
            ? GoogleFonts.notoKufiArabic(
                color: const Color(0xffD0D5DD),
                fontSize: 14,
                fontWeight: FontWeight.w400)
            : GoogleFonts.dmSans(
                color: const Color(0xffD0D5DD),
                fontSize: 14,
                fontWeight: FontWeight.w400),
        labelSmall: textDirection.value == TextDirection.rtl
            ? GoogleFonts.notoKufiArabic(
                color: const Color(0xffD0D5DD),
                fontSize: 12,
                fontWeight: FontWeight.w500)
            : GoogleFonts.dmSans(
                color: const Color(0xffD0D5DD),
                fontSize: 12,
                fontWeight: FontWeight.w500),
        bodyLarge: textDirection.value == TextDirection.rtl
            ? GoogleFonts.notoKufiArabic(
                color: const Color(0xffD0D5DD),
                fontSize: 16,
                fontWeight: FontWeight.w400)
            : GoogleFonts.dmSans(
                color: const Color(0xffD0D5DD),
                fontSize: 16,
                fontWeight: FontWeight.w400),
        bodyMedium: textDirection.value == TextDirection.rtl
            ? GoogleFonts.notoKufiArabic(
                color: const Color(0xffD0D5DD),
                fontSize: 10,
                fontWeight: FontWeight.w400)
            : GoogleFonts.dmSans(
                color: const Color(0xffD0D5DD),
                fontSize: 10,
                fontWeight: FontWeight.w400),
        bodySmall: textDirection.value == TextDirection.rtl
            ? GoogleFonts.notoKufiArabic(
                color: const Color(0xffD0D5DD),
                fontSize: 8,
                fontWeight: FontWeight.w400)
            : GoogleFonts.dmSans(
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
    // Determine the text direction based on the current locale or context.
    // TextDirection textDirection = Utils.getTextDirection(context);
    if (textDirection.value == TextDirection.rtl) {
      return GoogleFonts.notoKufiArabic(
          color: color,
          fontSize: fontSize * 0.9,
          fontWeight: fontWeight,
          height: lineHeight,
          fontStyle: FontStyle.normal,
          decoration: TextDecoration.none);
    } else {
      return GoogleFonts.dmSans(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: lineHeight,
          fontStyle: FontStyle.normal,
          decoration: TextDecoration.none);
    }
  }

  static TextStyle generateColoredStyle(
      {required double fontSize,
      FontWeight fontWeight = FontWeight.normal,
      Color darkTextColor = const Color(0xffD0D5DD),
      Color lightTextColor = const Color(0xff667085),
      double? lineHeight,
      required BuildContext context}) {
    if (textDirection.value == TextDirection.rtl) {
      return GoogleFonts.notoKufiArabic(
          // fontFamily: 'Gilroy',
          color: isDarkMode(context) ? darkTextColor : lightTextColor,
          fontSize: fontSize * 0.9,
          fontWeight: fontWeight,
          height: lineHeight,
          fontStyle: FontStyle.normal,
          decoration: TextDecoration.none);
    } else {
      return GoogleFonts.dmSans(
          // fontFamily: 'Gilroy',
          color: isDarkMode(context) ? darkTextColor : lightTextColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: lineHeight,
          fontStyle: FontStyle.normal,
          decoration: TextDecoration.none);
    }
  }

  static bool isDarkMode(BuildContext context) {
    if (getThemeManager(context).getSelectedTheme().themeMode ==
        ThemeMode.system) {
      return context.isDarkMode;
    } else {
      return getThemeManager(context).isDarkMode;
    }
  }
}

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
