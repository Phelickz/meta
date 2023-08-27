import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/textfields/textfield.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../../views/security/security_view_model.dart';

class PhoneVerificationPage extends StatelessWidget {
  final SecurityViewModel model;
  const PhoneVerificationPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceXXSmall(context),
            SizedBox(
              height: McGyver.rsDoubleH(context, 50),
              width: McGyver.rsDoubleW(context, 100),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: McGyver.rsDoubleW(context, 10),
                ),
                child: isDarkMode
                    ? Image.asset(
                        "assets/images/phone_illustration_dark.png",
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        "assets/images/phone_illustration_light.png",
                      ),
              ),
            ),
            verticalSpaceSmall(context),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 10),
              ),
              child: Text(
                "Phone Verification",
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
            verticalSpaceXSmall(context),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 10),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "We sent a verification code to ",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.8),
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? const Color(0xff98A2B3)
                          : const Color(0xFF667085),
                    ),
                    children: [
                      TextSpan(
                        text: "123***554",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 2),
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? const Color(0xFF47B0F5)
                              : const Color(0xff77C5F8),
                        ),
                      ),
                    ]),
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceXSmall(context),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 6),
              ),
              child: const CustomTextFields(
                hintText: "Enter 6-digits verification code",
              ),
            ),
            verticalSpaceMedium(context),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 6),
              ),
              child: CustomButtons.generalButton(
                  context: context,
                  onTap: () {
                    model.securityPageEnum =
                        SecurityPageEnum.phoneVerifySuccess;
                  },
                  text: 'Submit',
                  color: isDarkMode
                      ? const Color(0xFF667085)
                      : const Color(0xFFD0D5DD)),
            ),
            verticalSpaceXSmall(context),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: McGyver.rsDoubleW(context, 6),
              ),
              child: CustomButtons.clearButton(
                context: context,
                onTap: () {},
                text: 'Resend code',
                textColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
