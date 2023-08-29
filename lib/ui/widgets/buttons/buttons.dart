import 'package:flutter/material.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';

class CustomButtons {
  static Widget generalButton(
      {required BuildContext context,
      required Function? onTap,
      required String text,
      Color? color,
      Color textColor = Colors.white,
      double? width,
      double? padding,
      double? textSize,
      double? borderRadius}) {
    return SizedBox(
      width: width ?? McGyver.rsDoubleW(context, 90),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
        ),
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          onTap!();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding ?? 18),
          child: Text(
            text,
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, textSize ?? 1.6),
                color: textColor),
          ),
        ),
      ),
    );
  }

  static Widget clearButton(
      {required BuildContext context,
      required Function? onTap,
      required String text,
      Color? color,
      Color textColor = Colors.black,
      double? width,
      double? padding,
      double? textSize,
      double? borderRadius}) {
    return SizedBox(
      width: width ?? McGyver.rsDoubleW(context, 90),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            side: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
          ),
        ),
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          onTap!();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding ?? 18),
          child: Text(
            text,
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, textSize ?? 1.5),
                color: textColor),
          ),
        ),
      ),
    );
  }

  static Widget generalTextButton(
      {required BuildContext context,
      required Function? onTap,
      required String text,
      Color? color,
      Color textColor = const Color(0xFF8ACDF9),
      double? width,
      double? padding,
      double? textSize,
      double? borderRadius}) {
    return SizedBox(
      width: width ?? McGyver.rsDoubleW(context, 90),
      child: Center(
        child: TextButton(
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            onTap!();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: padding ?? 18),
            child: Text(
              text,
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, textSize ?? 1.5),
                  color: textColor),
            ),
          ),
        ),
      ),
    );
  }

  static Widget buttonWithoutBackground(
      {required BuildContext context,
      required Function? onTap,
      required String text,
      Color? color,
      Color textColor = Colors.black,
      double? width,
      double? padding,
      double? textSize,
      double? borderRadius}) {
    return SizedBox(
      width: width ?? McGyver.rsDoubleW(context, 90),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            side: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
          ),
        ),
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          onTap!();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding ?? 18),
          child: Text(
            text,
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, textSize ?? 1.5),
                color: textColor),
          ),
        ),
      ),
    );
  }

  static Widget outlineButton(
      {required BuildContext context,
      required Function? onTap,
      required String text,
      Color? color,
      Color textColor = Colors.black,
      double? width,
      double? padding,
      double? textSize,
      double? borderRadius}) {
    return SizedBox(
      width: width ?? McGyver.rsDoubleW(context, 90),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            side: BorderSide(
              color: color ?? Theme.of(context).primaryColor.withOpacity(0.6),
            ),
          ),
        ),
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          onTap!();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding ?? 18),
          child: Text(
            text,
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, textSize ?? 1.5),
                fontWeight: FontWeight.w500,
                color: textColor),
          ),
        ),
      ),
    );
  }

  static Widget textButton(
      {required BuildContext context,
      required Function? onTap,
      required String text,
      Color textColor = Colors.black,
      double? width,
      double? textSize,
      double? borderRadius}) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onTap!();
      },
      child: Container(
        height: McGyver.rsDoubleH(context, 6),
        width: McGyver.rsDoubleW(context, 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            borderRadius ?? McGyver.rsDoubleW(context, 2),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: CustomThemeData.generateStyle(
              fontSize: textSize ?? McGyver.textSize(context, 1.5),
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
