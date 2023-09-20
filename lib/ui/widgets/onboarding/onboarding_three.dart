// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

import '../../../generated/locale_keys.g.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.textSize(context, 3),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpaceSmall(context),
            SvgPicture.asset(
              'assets/images/onboarding3.svg',
              height: McGyver.rsDoubleH(context, 50),
              width: McGyver.rsDoubleH(context, 70),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: LocaleKeys.onboarding3_onboarding_three_text.tr(),
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 3.2),
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
                children: [
                  TextSpan(
                    text: LocaleKeys.onboarding3_onboarding_three_text1.tr(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 3.2),
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: LocaleKeys.onboarding3_onboarding_three_text2.tr(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 3.2),
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: LocaleKeys.onboarding3_onboarding_three_text3.tr(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 3.2),
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  )
                ],
              ),
            ),
            verticalSpaceSmall(context),
            Text(
              LocaleKeys.onboarding3_onboarding_three_bodyText.tr(),
              textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.8),
                color: isDarkMode
                    ? const Color(0xff98A2B3)
                    : const Color(0xff667085),
              ),
            )
          ],
        ),
      ),
    );
  }
}
