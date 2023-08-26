import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/ui/widgets/security/security_option_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';

class AddPasskeyPage extends StatelessWidget {
  final SecurityViewModel model;
  const AddPasskeyPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceXSmall(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Security Verification Requirements",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFD0D5DD)
                      : const Color(0xFF344054),
                ),
              ),
              Text(
                "You need to complete all of the following verification to continue",
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
          verticalSpaceSmall(context),
          SecurityOptionTile(
            assetName: "assets/images/message_text.svg",
            vm: model,
            hasLeadingIcon: true,
            label: "Email Verification",
            status: SecurityOptionStatus.unconfirmed,
            hasStatus: true,
            // onTap: () => model.securityPageEnum = SecurityPageEnum.emailVerify,
            onTap: () =>
                model.securityPageEnum = SecurityPageEnum.addPasskeyEnter,
          ),
          verticalSpaceXSmall(context),
          SecurityOptionTile(
            assetName: "assets/images/mobile.svg",
            vm: model,
            hasLeadingIcon: true,
            label: "Phone Number",
            status: SecurityOptionStatus.unconfirmed,
            hasStatus: true,
            // onTap: () => model.securityPageEnum = SecurityPageEnum.phoneVerify,
            onTap: () =>
                model.securityPageEnum = SecurityPageEnum.addPasskeyEnter,
          ),
        ],
      ),
    );
  }
}
