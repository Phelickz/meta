import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/textfields/label_password_field.dart';
import 'package:meta_trader/ui/widgets/textfields/label_text_field.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';
import '../buttons/buttons.dart';

class AddPasskeyEnterPage extends StatelessWidget {
  final SecurityViewModel model;
  const AddPasskeyEnterPage({super.key, required this.model});

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
              LocaleKeys.securityWidget_addPasskeyEnter_enterAUnique,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.2),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF344054),
              ),
            ).tr(),
            Text(
              LocaleKeys.securityWidget_addPasskeyEnter_yourPasskeyWillBe,
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
         LabelTextField(
          label: LocaleKeys.passkey,
          hintText:
              LocaleKeys.securityWidget_addPasskeyEnter_enter4digitsPasskey
              .tr(),
        ),
         LabelPasswordField(
          label: LocaleKeys.password.tr(),
          hintText: LocaleKeys.securityWidget_addPasskeyEnter_enterYourPassword.tr(),
        ),
        verticalSpaceSmall(context),
        verticalSpaceSmall(context),
        CustomButtons.generalButton(
          text: LocaleKeys.continueWord.tr(),
          context: context,
          onTap: () {
            model.securityPageEnum = SecurityPageEnum.passkeyAddedSuccess;
          },
        )
      ],
    );
  }
}
