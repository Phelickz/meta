import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/extension.dart';
import 'package:easy_localization/easy_localization.dart' as el;

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
}
