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
                fontSize: McGyver.textSize(context, textSize ?? 1.5),
                color: textColor),
          ),
        ),
      ),
    );
  }
}
