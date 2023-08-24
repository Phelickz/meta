import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

import '../../views/verification/verification_view_model.dart';

class VerifyLandingPage extends StatelessWidget {
  final VerificationViewModel model;
  const VerifyLandingPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    // getThemeManager(context).setThemeMode(ThemeMode.light);
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 5),
        ),
        child: Column(
          children: [
            verticalSpaceMedium(context),
            Text(
              "Let's Start Your Verification Process",
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.5),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            verticalSpaceMedium(context),
            vListTile(
                context,
                'Email Verification',
                'We will send a link to the email address you provided. Please tap the link to complete your email verification',
                1),
            verticalSpaceSmall(context),
            vListTile(
                context,
                'Identity Verification',
                'To help protect you from fraud and to comply with federal regulations, we need some information. It can be either a snapshot of your: \n      * Drivers license \n      * International Passport \n      * National ID card',
                2),
            verticalSpaceMedium(context),
            verticalSpaceSmall(context),
            CustomButtons.generalButton(
              context: context,
              onTap: () {
                model.setVerificationViewEnum =
                    VerificationPageEnum.emailVerification;
              },
              text: 'Next',
            )
          ],
        ),
      ),
    );
  }

  Widget vListTile(
      BuildContext context, String title, String subtitle, int number) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return ListTile(
      leading: Container(
        height: 23,
        width: 23,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDarkMode ? const Color(0xff073961) : Colors.black,
        ),
        child: Center(
          child: Text(
            '$number',
            style: CustomThemeData.generateStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: CustomThemeData.generateStyle(
          fontSize: McGyver.textSize(context, 2),
          color: isDarkMode
              ? const Color(0xff77C5F8)
              : Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          subtitle,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.6),
            color: isDarkMode ? Colors.white60 : Colors.black54,
          ),
        ),
      ),
    );
  }
}
