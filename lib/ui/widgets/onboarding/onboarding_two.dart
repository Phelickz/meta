// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

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
            'assets/images/onboarding2.svg',
            height: McGyver.rsDoubleH(context, 50),
            width: McGyver.rsDoubleH(context, 70),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Secure ',
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 3.2),
                fontWeight: FontWeight.w700,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'instant credits ',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 3.2),
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                TextSpan(
                  text: 'when you trade with higher lot sizes',
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
            'Start earning points on every trade you place, depending on the lot size. The higher the lot size, the higher your points',
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
