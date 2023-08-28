import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';

import '../../../app/utils/theme.dart';

AppBar globalAppBar(BuildContext context, String title, String subtitle,
    void Function()? onPressed, List<Widget>? actions) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor: isDarkMode
        ? const Color(0xff052844)
        : Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: Icon(
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      onPressed: onPressed,
    ),
    centerTitle: false,
    actions: actions,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 2),
            color: isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (subtitle.isNotEmpty) ...[
          Text(
            subtitle,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.5),
              color: isDarkMode ? Colors.white54 : const Color(0xff667085),
              fontWeight: FontWeight.normal,
            ),
          ),
        ]
      ],
    ),
  );
}
