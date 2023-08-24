import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

import '../../../../app/utils/theme.dart';

class AboutUsTile extends StatelessWidget {
  final String title;
  final String leading;
  final bool isArrowTrailing;
  final Widget? secondaryTrailing;
  const AboutUsTile(
      {Key? key,
      required this.title,
      required this.leading,
      this.isArrowTrailing = true,
      this.secondaryTrailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SvgPicture.asset(leading),
      SizedBox(
        width: 16.pWidth(context),
      ),
      Text(
        title,
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 1.7),
          color: isDarkMode ? Colors.white : const Color(0xff667085),
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      isArrowTrailing
          ? Icon(
              Platform.isAndroid
                  ? Icons.arrow_forward
                  : Icons.arrow_forward_ios,
              color: isDarkMode ? Colors.white70 : Colors.black,
            )
          : secondaryTrailing!
    ]);
  }
}
