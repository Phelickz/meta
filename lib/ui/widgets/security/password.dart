import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';
import '../buttons/buttons.dart';
import '../textfields/label_password_field.dart';

class PasswordPage extends StatelessWidget {
  final SecurityViewModel model;
  const PasswordPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceXSmall(context),
          Row(
            children: [
              SizedBox(
                height: McGyver.rsDoubleH(context, 7),
                width: McGyver.rsDoubleH(context, 7),
                child: Image.asset("assets/images/fx_pro.png"),
              ),
              horizontalSpaceXSmall(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FXPro",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.7),
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? const Color(0xFFD0D5DD)
                          : const Color(0xFF667085),
                    ),
                  ),
                  Text(
                    "ForexPro",
                    style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.4),
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ],
          ),
          verticalSpaceSmall(context),
          verticalSpaceXSmall(context),
          const LabelPasswordField(
            label:
                LocaleKeys.manageAccounts_existingAccountsForm_currentPassword,
            hintText: LocaleKeys
                .manageAccounts_existingAccountsForm_enterCurrentPassword,
          ),
          const LabelPasswordField(
            label: LocaleKeys.manageAccounts_existingAccountsForm_newPassword,
            hintText:
                LocaleKeys.manageAccounts_existingAccountsForm_enterNewPassword,
          ),
          const LabelPasswordField(
            label:
                LocaleKeys.manageAccounts_existingAccountsForm_reEnterPassword,
            hintText: LocaleKeys
                .manageAccounts_existingAccountsForm_reEnterNewPassword,
          ),
          Row(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor:
                      isDarkMode ? Colors.white70 : const Color(0xff98A2B3),
                ),
                child: Checkbox(
                  value: false,
                  visualDensity: VisualDensity.compact,
                  onChanged: (val) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xff98A2B3),
                  ),
                  checkColor:
                      isDarkMode ? Colors.white70 : const Color(0xff98A2B3),
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                width: McGyver.rsDoubleW(context, 1),
              ),
              Expanded(
                child: Text(
                  LocaleKeys.savePassword,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.7),
                    fontWeight: FontWeight.normal,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ),
              )
            ],
          ),
          verticalSpaceMedium(context),
          verticalSpaceSmall(context),
          CustomButtons.generalButton(
            text: LocaleKeys.saveChanges,
            context: context,
            onTap: () {
              model.securityPageEnum = SecurityPageEnum.main;
            },
          ),
          SizedBox(
            width: McGyver.rsDoubleW(context, 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.forgetPassword,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  fontWeight: FontWeight.w500,
                  color: isDarkMode
                      ? const Color(0xFFD0D5DD)
                      : const Color(0xFF667085),
                ),
              ),
              CustomButtons.generalTextButton(
                width: McGyver.rsDoubleW(context, 27),
                text: LocaleKeys.contactBroker,
                padding: McGyver.rsDoubleH(context, 0.1),
                context: context,
                textColor: isDarkMode
                    ? const Color(0xFF42B0F8)
                    : const Color(0xFF20A0F3),
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
