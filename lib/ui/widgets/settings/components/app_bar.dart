import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';

import '../../../../app/utils/theme.dart';
import '../../../views/settings/settings_view_model.dart';

AppBar settingsAppBar(BuildContext context, String title, String subtitle,
    SettingsViewModel model) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        onPressed: () {
          model.goBack();
        }),
    centerTitle: false,
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
        model.settingsPageEnum == SettingsPageEnum.languageSettings
            ? Text(
                subtitle,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                  fontWeight: FontWeight.normal,
                ),
              )
            : SizedBox(),
      ],
    ),
  );
}
