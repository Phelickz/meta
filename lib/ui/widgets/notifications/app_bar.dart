import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';

import '../../../../app/utils/theme.dart';
import '../../views/notifications/notifications_view_model.dart';

AppBar notificationsAppBar(
    BuildContext context, String title, NotificationViewModel model) {
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
    title: Text(
      title,
      style: CustomThemeData.generateStyle(
        fontSize: McGyver.textSize(context, 2),
        color: isDarkMode ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
