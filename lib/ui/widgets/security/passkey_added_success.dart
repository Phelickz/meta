import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../../generated/locale_keys.g.dart';
import '../../views/security/security_view_model.dart';
import '../buttons/buttons.dart';

class PasskeyAddedSuccessPage extends StatelessWidget {
  final SecurityViewModel model;
  const PasskeyAddedSuccessPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        verticalSpaceSmall(context),
        verticalSpaceSmall(context),
        verticalSpaceSmall(context),
        SizedBox(
          height: McGyver.rsDoubleH(context, 50),
          width: McGyver.rsDoubleW(context, 100),
          child: isDarkMode
              ? Image.asset(
                  "assets/images/success_illustration_dark.png",
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  "assets/images/success_illustration_light.png",
                ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 4),
          ),
          child: Text(
            LocaleKeys
                .securityWidget_passkeyAddedSuccess_passkeyAddedSuccessfully,
            textAlign: TextAlign.center,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.7),
              fontWeight: FontWeight.w700,
              color: isDarkMode
                  ? const Color(0xFFF2F4F7)
                  : const Color(0xff475467),
            ),
          ).tr(),
        ),
        verticalSpaceSmall(context),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 4),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: LocaleKeys
                    .securityWidget_passkeyAddedSuccess_yourPasskeyIs
                    .tr(),
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  fontWeight: FontWeight.w500,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                ),
                children: [
                  TextSpan(
                    text: " 2345 ",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 2),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xFF47B0F5)
                          : const Color(0xff77C5F8),
                    ),
                  ),
                  TextSpan(
                    text: LocaleKeys
                        .securityWidget_passkeyAddedSuccess_pleaseKeepThisPasskey
                        .tr(),
                  )
                ]),
          ),
        ),
        verticalSpaceLarge(context),
        CustomButtons.generalButton(
          context: context,
          onTap: () {
            model.securityPageEnum = SecurityPageEnum.passkey;
          },
          text: LocaleKeys.continueWord.tr(),
        ),
      ],
    );
  }
}
