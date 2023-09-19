import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';

import '../../../../app/utils/theme.dart';
import '../../../views/security/security_view_model.dart';
import 'custom_back_button.dart';

AppBar securityAppBar(BuildContext context, String title, String subtitle,
    SecurityViewModel model) {
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
          if (model.securityPageEnum == SecurityPageEnum.main) {
            Navigator.pop(context);
          }

          if (model.securityPageEnum == SecurityPageEnum.passkey) {
            model.securityPageEnum = SecurityPageEnum.main;
          }

          if (model.securityPageEnum == SecurityPageEnum.emailVerify) {
            model.securityPageEnum = SecurityPageEnum.main;
          }

          if (model.securityPageEnum == SecurityPageEnum.phoneVerify) {
            model.securityPageEnum = SecurityPageEnum.main;
          }

          if (model.securityPageEnum == SecurityPageEnum.password) {
            model.securityPageEnum = SecurityPageEnum.main;
          }

          if (model.securityPageEnum == SecurityPageEnum.autoLock) {
            model.securityPageEnum = SecurityPageEnum.main;
          }
          if (model.securityPageEnum == SecurityPageEnum.devices) {
            model.securityPageEnum = SecurityPageEnum.main;
          }
          if (model.securityPageEnum == SecurityPageEnum.addPasskey) {
            model.securityPageEnum = SecurityPageEnum.passkey;
          }
          if (model.securityPageEnum == SecurityPageEnum.addPasskeyEnter) {
            model.securityPageEnum = SecurityPageEnum.addPasskey;
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
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF344054),
          ),
        ),
        if (subtitle != '')
          Text(
            subtitle,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF667085)
                  : const Color(0xFF667085),
            ),
          ),
      ],
    ),
  );
}

PreferredSizeWidget securityAppBar2(BuildContext context, String title,
    String subtitle, SecurityViewModel model) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      centerTitle: false,
      elevation: 0,
      backgroundColor:
          isDarkMode ? const Color(0xFF052844) : const Color(0xFFFAFDFF),
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CustomBackButton(
          onTap: () {
            if (model.securityPageEnum == SecurityPageEnum.main) {
              Navigator.pop(context);
            }

            if (model.securityPageEnum == SecurityPageEnum.passkey) {
              model.securityPageEnum = SecurityPageEnum.main;
            }

            if (model.securityPageEnum == SecurityPageEnum.emailVerify) {
              model.securityPageEnum = SecurityPageEnum.main;
            }

            if (model.securityPageEnum == SecurityPageEnum.phoneVerify) {
              model.securityPageEnum = SecurityPageEnum.main;
            }

            if (model.securityPageEnum == SecurityPageEnum.password) {
              model.securityPageEnum = SecurityPageEnum.main;
            }

            if (model.securityPageEnum == SecurityPageEnum.autoLock) {
              model.securityPageEnum = SecurityPageEnum.main;
            }
            if (model.securityPageEnum == SecurityPageEnum.devices) {
              model.securityPageEnum = SecurityPageEnum.main;
            }
            if (model.securityPageEnum == SecurityPageEnum.addPasskey) {
              model.securityPageEnum = SecurityPageEnum.passkey;
            }
          },
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.2),
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF344054),
            ),
          ),
          if (subtitle != '')
            Text(
              subtitle,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.7),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFF667085)
                    : const Color(0xFF667085),
              ),
            ),
        ],
      ),
    ),
  );
}
