import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/utils.dart';

class Constants {
  /// For Example
  /// static const String MY_AWESOME_CONSTANT = 'yazeed';
  ///

  static EdgeInsets getPadding(BuildContext context, dynamic padding) {
    // Define a variable to store the padding value.
    EdgeInsets myEdgeInsets;

// Determine the text direction based on the current locale or context.
    TextDirection textDirection = Utils.getTextDirection(context);

// Conditionally set the padding based on text direction.
    if (textDirection == TextDirection.ltr) {
      myEdgeInsets =
          EdgeInsets.only(right: padding.toDouble()); // LTR text direction
    } else {
      myEdgeInsets =
          EdgeInsets.only(left: padding.toDouble()); // RTL text direction
    }

    return myEdgeInsets;
  }
}
