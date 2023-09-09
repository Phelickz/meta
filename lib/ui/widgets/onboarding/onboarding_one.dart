// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

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
              'assets/images/onboarding1.svg',
              height: McGyver.rsDoubleH(context, 50),
              width: McGyver.rsDoubleH(context, 70),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Trade at the cutting edge with our ',
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 3.2),
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'state-of-the-art ',
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 3.2),
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: 'platform and stay ahead',
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
              "Explore total convenience for your trading journey with our 360-degree platform. Enjoy seamless trading and access extra features to elevate your financial experience.",
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
