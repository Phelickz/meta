import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceMedium(context),
            SvgPicture.asset(
              'assets/images/verify4.svg',
              height: McGyver.rsDoubleH(context, 50),
              width: McGyver.rsDoubleH(context, 50),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Verify Your Identity',
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.4),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ),
            verticalSpaceSmall(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'To successfully verify your identity, we accept either a snapshot of your: \n     * Drivers license\n     * International Passport\n     *National ID card\nIt takes 8-24 hrs for your ID to be verified.',
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  color: isDarkMode ? Colors.white70 : Colors.black54,
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
                text: 'Continue'),
            verticalSpaceXSmall(context),
            CustomButtons.clearButton(
              context: context,
              onTap: () {
                model.setVerificationViewEnum =
                    VerificationPageEnum.selectIdentity;
              },
              text: 'Skip',
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}