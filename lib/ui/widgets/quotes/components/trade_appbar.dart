import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/utils/asset_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/color_manager.dart';
import '../../../../app/utils/theme.dart';

AppBar tradeAppBars(BuildContext context,bool isDetails, String title, String subtitle){
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation:0,
    backgroundColor: isDarkMode
        ? ColorManager.darkHeaderColor
        : Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: (){},
      icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ?Colors.white : Colors.black,
        ),
    ),
    centerTitle: isDetails? false : true,
    title: Column(
      crossAxisAlignment: isDetails? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.2),
              color: isDarkMode ? Colors.white : const Color(0xFF475467),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 4.pHeight(context),),
        Text(
          subtitle,
          style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.7),
              color: isDarkMode ? Colors.white : const Color(0xFF475467),
              fontWeight: FontWeight.w400)
        )
      ],
    ),
  );
}

AppBar tradeAppBars1(BuildContext context,bool isDetails, String title, String subtitle, [Widget? icon]){
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation:0,
    backgroundColor: isDarkMode
        ? ColorManager.darkHeaderColor
        : Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: (){},
      icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ?Colors.white : Colors.black,
        ),
    ),
    actions: [
      icon??const Placeholder()
    ],
    centerTitle: isDetails? false : true,
    title: Column(
      crossAxisAlignment: isDetails? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.2),
              color: isDarkMode ? Colors.white : const Color(0xFF475467),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 4.pHeight(context),),
        Text(
          subtitle,
          style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.7),
              color: isDarkMode ? Colors.white : const Color(0xFF475467),
              fontWeight: FontWeight.w400)
        )
      ],
    ),
  );
}