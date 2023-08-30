import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';
import '../buttons/buttons.dart';

class EmailVerificationPage extends StatelessWidget {
  final SecurityViewModel model;
  const EmailVerificationPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        SizedBox(
          height: McGyver.rsDoubleH(context, 50),
          width: McGyver.rsDoubleW(context, 80),
          child: SvgPicture.asset(
            "assets/images/verify2.svg",
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 4),
          ),
          child: Text(
            "Passkey Added Successfully",
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
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 4),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "We sent a verification email to ",
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
                    text: '. Please tap the link sent in the email to continue',
                  )
                ]),
          ),
        ),
        verticalSpaceLarge(context),
        CustomButtons.generalButton(
          context: context,
          onTap: () {
            model.securityPageEnum = SecurityPageEnum.emailVerifySuccess;
          },
          text: 'Check mail',
        ),
        verticalSpaceXSmall(context),
        CustomButtons.outlineButton(
          context: context,
          onTap: () {},
          text: 'Resend code',
          textColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
