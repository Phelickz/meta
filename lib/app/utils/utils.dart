import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/extension.dart';
import 'package:easy_localization/easy_localization.dart' as el;
import 'package:meta_trader/app/utils/gtext.dart';
import 'package:meta_trader/app/utils/theme.dart';

// create a value notifier for TextDirection
ValueNotifier<TextDirection> textDirection = ValueNotifier(TextDirection.ltr);

class Utils {
  // Helper function to determine text direction
  static getTextDirection(BuildContext context) {
    if (context.locale.toString().toLowerCase() == 'ar' ||
        isDirectionRTL(context) == true) {
      return TextDirection.rtl; // Set to RTL
    } else {
      return TextDirection.ltr; // Default to LTR
    }
  }

  static Widget getTextWidget(String text, BuildContext context,
      {int? maxLines, TextOverflow? overflow, TextStyle? style}) {
    if (textDirection.value == TextDirection.ltr) {
      return Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        style: style,
      );
    } else {
      return GText(
        text,
        maxLines: maxLines,
        overflow: overflow,
        toLang: context.locale.toString().toLowerCase(),
        style: style,
      );
    }
  }
}
