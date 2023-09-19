import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/security/components/change_password_modal.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';
import 'components/security_option_tile.dart';

class SecurityMainPage extends StatelessWidget {
  final SecurityViewModel model;
  const SecurityMainPage({super.key, required this.model});

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
              "Two-Factor Authentication",
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.2),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF344054),
              ),
            ),
            Text(
              "To protect your account, it is required for you to turn on at least one 2FA",
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
          assetName: "assets/images/shield_security.svg",
          vm: model,
          hasLeadingIcon: true,
          hasStatus: true,
          label: "Passkey",
          status: SecurityOptionStatus.confirmed,
          onTap: () => model.securityPageEnum = SecurityPageEnum.passkey,
        ),
        SecurityOptionTile(
          assetName: "assets/images/message_text.svg",
          vm: model,
          hasLeadingIcon: true,
          label: "Email",
          status: SecurityOptionStatus.unconfirmed,
          hasStatus: true,
          onTap: () => model.securityPageEnum = SecurityPageEnum.emailVerify,
        ),
        SecurityOptionTile(
          assetName: "assets/images/mobile.svg",
          vm: model,
          hasLeadingIcon: true,
          label: "Phone Number",
          status: SecurityOptionStatus.unconfirmed,
          hasStatus: true,
          onTap: () => model.securityPageEnum = SecurityPageEnum.phoneVerify,
        ),
        SecurityOptionTile(
          assetName: "assets/images/password_check.svg",
          vm: model,
          label: "Password",
          hasStatus: true,
          hasLeadingIcon: true,
          status: SecurityOptionStatus.confirmed,
          // onTap: () => model.securityPageEnum = SecurityPageEnum.password,
          onTap: () => showChangePasswordModal(context),
        ),
        verticalSpaceMedium(context),
        Text(
          "Others",
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 2.2),
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF344054),
          ),
        ),
        verticalSpaceXXSmall(context),
        SecurityOptionTile(
          assetName: "assets/images/password_check.svg",
          vm: model,
          label: "Auto-Lock",
          onTap: () => model.securityPageEnum = SecurityPageEnum.autoLock,
        ),
        SecurityOptionTile(
          assetName: "assets/images/password_check.svg",
          vm: model,
          label: "Devices",
          onTap: () => model.securityPageEnum = SecurityPageEnum.devices,
        ),
        verticalSpaceSmall(context),
        SecurityOptionTile(
          assetName: "assets/images/password_check.svg",
          vm: model,
          label: "Disable Account",
          hasRedLabel: true,
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const DisableccountDialog();
                });
          },
        ),
      ],
    );
  }

  void showChangePasswordModal(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    showModalBottomSheet(
        backgroundColor:
            isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(McGyver.rsDoubleH(context, 2)),
            topRight: Radius.circular(McGyver.rsDoubleH(context, 2)),
          ),
        ),
        context: context,
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        builder: (context) {
          return ChangePasswordModal(vm: model);
        });
  }
}

class DisableccountDialog extends StatelessWidget {
  const DisableccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        height: 170.pHeight(context),
        width: 300.pWidth(context),
        padding: EdgeInsets.symmetric(
            vertical: 24.pHeight(context), horizontal: 12.pWidth(context)),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Disable account",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 17),
            ),
            SizedBox(height: 12.pHeight(context)),
            Text(
              'Do you really want to disable account?',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 24.pWidth(context)),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 48.pHeight(context),
                    width: 154.pWidth(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red)),
                    child: Center(
                      child: Text(
                        "Disable",
                        style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 2),
                            color: Colors.red,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.pWidth(context),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2),
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
