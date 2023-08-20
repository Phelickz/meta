// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class OnboardingFour extends StatelessWidget {
  const OnboardingFour({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.textSize(context, 3),
      ),
      child: Column(
        children: [
          verticalSpaceSmall(context),
          SvgPicture.asset(
            'assets/images/onboarding4.svg',
            height: McGyver.rsDoubleH(context, 50),
            width: McGyver.rsDoubleH(context, 70),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Save and export ',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 3.2),
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
              ),
              children: [
                TextSpan(
                  text: 'chart analysis on the Meta Trader 5 app.',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 3.2),
                    fontWeight: FontWeight.w700,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          verticalSpaceSmall(context),
          Text(
            'You can now manage your setups. Save, export, and download chart analysis from the Meta trader 5 community',
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
    );
  }
}
