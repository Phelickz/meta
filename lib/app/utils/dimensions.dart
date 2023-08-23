import 'package:flutter/widgets.dart';

extension PHeight on num {
  // convert height
  double pHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const figmaDesignHeight = 794;
    double newScreenHeight = figmaDesignHeight / toDouble();
    return screenHeight / newScreenHeight;
  }
}

extension PWidth on num {
  //  convert width
  double pWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const figmaDesignWidth = 375;
    double newScreenWidth = figmaDesignWidth / toDouble();
    return screenWidth / newScreenWidth;
  }
}

extension DHeight on num {
  // convert height
  double dHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const figmaDesignHeight = 812;
    double newScreenHeight = figmaDesignHeight / toDouble();
    return screenHeight / newScreenHeight;
  }
}

extension DWidth on num {
  //  convert width
  double dWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const figmaDesignWidth = 375;
    double newScreenWidth = figmaDesignWidth / toDouble();
    return screenWidth / newScreenWidth;
  }
}
