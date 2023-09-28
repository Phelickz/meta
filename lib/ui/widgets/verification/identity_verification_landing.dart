import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/verification/verification_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class IdentityVerificationLandingPage extends StatelessWidget {
  final VerificationViewModel model;
  const IdentityVerificationLandingPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Platform.isIOS) ...[
              verticalSpaceSmall(context),
            ],
            SvgPicture.asset(
              'assets/images/verify4.svg',
              height: McGyver.rsDoubleH(context, 50),
              width: McGyver.rsDoubleH(context, 50),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  LocaleKeys
                      .verificationWidget_identityVerificationLanding_verifyYourIdentity,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 2.4),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ),
            verticalSpaceSmall(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                LocaleKeys
                    .verificationWidget_identityVerificationLanding_toSuccessfullyVerify,
                textAlign: TextAlign.center,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                horizontalSpaceMedium(context),
                // horizontalSpaceSmall(context),
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
                )
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                horizontalSpaceMedium(context),
                // horizontalSpaceSmall(context),
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
                )
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                horizontalSpaceMedium(context),
                // horizontalSpaceSmall(context),
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
                )
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  LocaleKeys
                      .verificationWidget_identityVerificationLanding_itTakes8hours,
                  textAlign: TextAlign.left,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.6),
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceMedium(context),
            CustomButtons.generalButton(
              context: context,
              onTap: () {
                model.setVerificationViewEnum =
                    VerificationPageEnum.selectIdentity;
              },
              text: LocaleKeys.continueWord,
            ),
            verticalSpaceXSmall(context),
            CustomButtons.clearButton(
              context: context,
              onTap: () {
                model.push(const BottomNavBarRoute());
              },
              text: LocaleKeys.skip,
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
