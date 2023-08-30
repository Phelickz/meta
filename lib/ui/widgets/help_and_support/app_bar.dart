import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';

import '../../../../app/utils/theme.dart';
import '../../../app/utils/asset_manager.dart';
import '../../views/help_and_support/help_and_support_view_model.dart';

AppBar helpAndSupportAppBar(
    BuildContext context,
    String title,
    String subtitle,
    HelpAndSupportViewModel model,
    HelpAndSupportPageEnum helpAndSupportPageEnum) {
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
        onPressed: () {
          if (helpAndSupportPageEnum == HelpAndSupportPageEnum.helpAndSupport) {
            model.goBack();
          } else {
            model.helpAndSupportPageEnum ==
                HelpAndSupportPageEnum.helpAndSupport;
          }
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
        helpAndSupportPageEnum == HelpAndSupportPageEnum.customerSupport
            ? Text(
                subtitle,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode ? Colors.white54 : const Color(0xff667085),
                  fontWeight: FontWeight.normal,
                ),
              )
            : const SizedBox(),
      ],
    ),
    actions: [
      model.helpAndSupportPageEnum == HelpAndSupportPageEnum.faq
          ? Padding(
              padding: EdgeInsets.only(right: 24.pWidth(context)),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  AssetManager.chat,
                  // ignore: deprecated_member_use
                  color: const Color(0x0098a2b3),
                ),
              ),
            )
          : const SizedBox(),
    ],
  );
}
