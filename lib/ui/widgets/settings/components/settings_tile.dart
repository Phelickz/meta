import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

class BasicSettingsTile extends StatelessWidget {
  final String title;
  bool isArrowTrailing;
  Widget? secondaryTrailing;
  BasicSettingsTile(
      {Key? key,
      required this.title,
      this.isArrowTrailing = true,
      this.secondaryTrailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);

    return ListTile(
        title: Text(
          title,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.5),
            color: isDarkMode ? Colors.white54 : const Color(0xff667085),
            fontWeight: FontWeight.normal,
          ),
        ),
        trailing: isArrowTrailing
            ? Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                color: isDarkMode ? Colors.white : Colors.black,
              )
            : secondaryTrailing!);
  }
}
