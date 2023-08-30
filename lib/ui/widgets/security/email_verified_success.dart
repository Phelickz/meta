import 'package:flutter/material.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';
import '../buttons/buttons.dart';

class EmailVerifiedSuccessPage extends StatelessWidget {
  final SecurityViewModel model;
  const EmailVerifiedSuccessPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        verticalSpaceSmall(context),
        SizedBox(
          height: McGyver.rsDoubleH(context, 50),
          width: McGyver.rsDoubleW(context, 100),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 10),
            ),
            child: isDarkMode
                ? Image.asset(
                    "assets/images/email_verified_illustration_dark.png",
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    "assets/images/email_verified_illustration_light.png",
                  ),
          ),
        ),
        verticalSpaceSmall(context),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 4),
          ),
          child: Text(
            "Email Verified Successfully",
            textAlign: TextAlign.center,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 3),
              fontWeight: FontWeight.w700,
              color: isDarkMode
                  ? const Color(0xFFF2F4F7)
                  : const Color(0xff475467),
            ),
          ),
        ),
        verticalSpaceSmall(context),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 4),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Your email account ",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.8),
                  fontWeight: FontWeight.w500,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                ),
                children: [
                  TextSpan(
                    text: "Susan@gmail.com",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 2),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xFF47B0F5)
                          : const Color(0xff77C5F8),
                    ),
                  ),
                  const TextSpan(
                    text: ' has been verified successfully',
                  )
                ]),
          ),
        ),
        verticalSpaceLarge(context),
        CustomButtons.generalButton(
          context: context,
          onTap: () {
            model.securityPageEnum = SecurityPageEnum.addPasskeyEnter;
          },
          text: 'Continue',
        ),
      ],
    );
  }
}
