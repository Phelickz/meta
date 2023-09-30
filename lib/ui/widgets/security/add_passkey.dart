import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';
import 'components/security_option_tile.dart';

class AddPasskeyPage extends StatelessWidget {
  final SecurityViewModel model;
  const AddPasskeyPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceXSmall(context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.securityWidget_addPasskey_securityVerification,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.2),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF344054),
              ),
            ).tr(),
            Text(
              LocaleKeys.securityWidget_addPasskey_youNeedToCompleteAll,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.6),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFF667085)
                    : const Color(0xFF667085),
              ),
            ).tr(),
          ],
        ),
        verticalSpaceSmall(context),
        SecurityOptionTile(
          assetName: "assets/images/message_text.svg",
          vm: model,
          hasLeadingIcon: true,
          label: LocaleKeys.verificationWidget_emailVerification.tr(),
          status: SecurityOptionStatus.unconfirmed,
          hasStatus: true,
          // onTap: () => model.securityPageEnum = SecurityPageEnum.emailVerify,
          onTap: () =>
              model.securityPageEnum = SecurityPageEnum.addPasskeyEnter,
        ),
        SecurityOptionTile(
          assetName: "assets/images/mobile.svg",
          vm: model,
          hasLeadingIcon: true,
          label: LocaleKeys.phoneNumber.tr(),
          status: SecurityOptionStatus.unconfirmed,
          hasStatus: true,
          // onTap: () => model.securityPageEnum = SecurityPageEnum.phoneVerify,
          onTap: () =>
              model.securityPageEnum = SecurityPageEnum.addPasskeyEnter,
        ),
      ],
    );
  }
}
