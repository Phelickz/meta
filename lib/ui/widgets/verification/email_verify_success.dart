import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/verification/verification_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';

class EmailVerifySuccessPage extends StatelessWidget {
  final VerificationViewModel model;
  const EmailVerifySuccessPage({super.key, required this.model});

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
          children: [
            verticalSpaceMedium(context),
            SvgPicture.asset(
              'assets/images/verify3.svg',
              height: McGyver.rsDoubleH(context, 50),
              width: McGyver.rsDoubleH(context, 50),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Email Verified Successfully',
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.4),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ),
            verticalSpaceSmall(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Your email account ',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.6),
                    color: isDarkMode ? Colors.white60 : Colors.black87,
                  ),
                  children: [
                    TextSpan(
                      text: 'Susan@gmail.com ',
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.6),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'has been verified successfully',
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.6),
                        color: isDarkMode ? Colors.white60 : Colors.black87,
                      ),
                    )
                  ],
                ),
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceMedium(context),
            CustomButtons.generalButton(
                context: context,
                onTap: () {
                  model.setVerificationViewEnum =
                      VerificationPageEnum.identityVerificationLanding;
                },
                text: 'Next: Verify Identity'),
            verticalSpaceXSmall(context),
            CustomButtons.clearButton(
              context: context,
              onTap: () {
                model.setVerificationViewEnum =
                    VerificationPageEnum.identityVerificationLanding;
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