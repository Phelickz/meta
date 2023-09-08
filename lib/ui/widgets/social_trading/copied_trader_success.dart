import 'package:flutter/material.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../buttons/buttons.dart';

class CopiedTraderSuccessPage extends StatelessWidget {
  final SocialTradingViewModel viewModel;

  const CopiedTraderSuccessPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        verticalSpaceSmall(context),
        SizedBox(
          height: McGyver.rsDoubleH(context, 50),
          width: McGyver.rsDoubleW(context, 100),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: McGyver.rsDoubleW(context, 10),
            ),
            child: isDarkMode
                ? Image.asset(
                    "assets/images/success_illustration_dark.png",
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    "assets/images/success_illustration_light.png",
                  ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 10),
          ),
          child: Text(
            "Master trader copied Successfully",
            textAlign: TextAlign.center,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 3),
              fontWeight: FontWeight.w700,
              color: isDarkMode
                  ? const Color(0xFFF2F4F7)
                  : const Color(0xff475467),
            ),
          ),
        ),
        verticalSpaceSmall(context),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 10),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  "You have successfully started copying Satoshi Nakamoto’s trades automatically. \n\n  Notifications would be sent to you when he opens or closes a trade",
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.7),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xff98A2B3)
                    : const Color(0xFF667085),
              ),
            ),
          ),
        ),
        verticalSpaceLarge(context),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 6),
          ),
          child: CustomButtons.generalButton(
            context: context,
            onTap: () {},
            text: 'Continue',
          ),
        ),
      ],
    );
  }
}
