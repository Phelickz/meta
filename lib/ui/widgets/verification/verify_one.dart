import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/verification/verification_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class VerifyOnePage extends StatelessWidget {
  final VerificationViewModel model;
  const VerifyOnePage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceSmall(context),
            SvgPicture.asset(
              'assets/images/verify.svg',
              height: McGyver.rsDoubleH(context, 50),
              width: McGyver.rsDoubleH(context, 50),
            ),
            Text(
              LocaleKeys.profile_verificationBar_verifyYourAccount,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 2.6),
                // fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            verticalSpaceSmall(context),
            Text(
              LocaleKeys.financialRegulation,
              textAlign: TextAlign.center,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.6),
                // fontSize: 14,
                fontWeight: FontWeight.normal,
                color: isDarkMode ? Colors.white : Colors.black54,
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceMedium(context),
            CustomButtons.generalButton(
                context: context,
                onTap: () {
                  model.setVerificationViewEnum =
                      VerificationPageEnum.verifyLanding;
                },
                text: LocaleKeys
                    .views_socialTradingView_socialTradingWelcome_getStarted),
            verticalSpaceXSmall(context),
            TextButton(
              onPressed: () {
                model.push(const BottomNavBarRoute());
              },
              child: const Text(LocaleKeys.skip),
            ),
            verticalSpaceMedium(context),
          ],
        ),
      ),
    );
  }
}
