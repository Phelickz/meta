import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
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
              LocaleKeys.verificationWidget_verifyLanding_letStart,
              // textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.5),
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ).tr(),
            verticalSpaceSmall(context),
            vListTile(
                context,
                LocaleKeys
                    .verificationWidget_verifyLanding_emailVerificationText
                    .tr(),
                LocaleKeys.verificationWidget_verifyLanding_weWillSend.tr(),
                1),
            verticalSpaceSmall(context),
            vListTile(
                context,
                LocaleKeys.verificationWidget_verifyLanding_identityVerification
                    .tr(),
                LocaleKeys.verificationWidget_verifyLanding_toHelpProtect.tr(),
                2),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                horizontalSpaceMedium(context),
                horizontalSpaceSmall(context),
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkMode ? Colors.white60 : Colors.black54,
                  ),
                ),
                horizontalSpaceXXSmall(context),
                Text(
                  LocaleKeys.driversLicense,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.6),
                    color: isDarkMode ? Colors.white60 : Colors.black54,
                  ),
                ).tr()
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                horizontalSpaceMedium(context),
                horizontalSpaceSmall(context),
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkMode ? Colors.white60 : Colors.black54,
                  ),
                ),
                horizontalSpaceXXSmall(context),
                Text(
                  LocaleKeys.internationalPassport,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.6),
                    color: isDarkMode ? Colors.white60 : Colors.black54,
                  ),
                ).tr()
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                horizontalSpaceMedium(context),
                horizontalSpaceSmall(context),
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDarkMode ? Colors.white60 : Colors.black54,
                  ),
                ),
                horizontalSpaceXXSmall(context),
                Text(
                  LocaleKeys.nationalId,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.6),
                    color: isDarkMode ? Colors.white60 : Colors.black54,
                  ),
                ).tr()
              ],
            ),
            verticalSpaceMedium(context),
            verticalSpaceSmall(context),
            CustomButtons.generalButton(
              context: context,
              onTap: () {
                model.setVerificationViewEnum =
                    VerificationPageEnum.emailVerification;
              },
              text: LocaleKeys.next.tr(),
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
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          title,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 2),
            color: isDarkMode ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
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
