import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';

import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/security/security_view_model.dart';
import 'custom_back_button.dart';

Widget securityAppBar(BuildContext context, String title, String subtitle,
    SecurityViewModel model) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: McGyver.rsDoubleW(context, 6),
      vertical: McGyver.rsDoubleW(context, 4),
    ),
    decoration: BoxDecoration(
      color: isDarkMode ? const Color(0xFF052844) : const Color(0xFFFAFDFF),
    ),
    child: Row(
      children: [
        CustomBackButton(
          onTap: () {
            if (model.securityPageEnum == SecurityPageEnum.main) {
              model.goBack();
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
          },
        ),
        horizontalSpaceMedium(context),
        Expanded(
          child: Column(
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
      ],
    ),
  );
}
