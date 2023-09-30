import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';

import '../../../app/responsiveness/res.dart';
import '../../../app/responsiveness/size.dart';
import '../../../app/utils/theme.dart';
import '../buttons/buttons.dart';

@RoutePage()
class CopiedTraderSuccessPage extends StatelessWidget {
  final SocialTradingViewModel viewModel;

  const CopiedTraderSuccessPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      body: Column(
        children: [
          verticalSpaceSmall(context),
          // verticalSpaceSmall(context),
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
          Text(
            LocaleKeys
                .socialTradingWidget_copiedTraderSuccess_masterTradeCopiedS,
            textAlign: TextAlign.center,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 2.6),
              fontWeight: FontWeight.w700,
              color: isDarkMode
                  ? const Color(0xFFF2F4F7)
                  : const Color(0xff475467),
            ),
          ).tr(),
          verticalSpaceSmall(context),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: LocaleKeys.youHaveSuccessCopied.tr(),
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.5),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xff98A2B3)
                    : const Color(0xFF667085),
              ),
            ),
          ),
          verticalSpaceLarge(context),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              viewModel.push(const SocialTradingDasboard());
            },
            text: LocaleKeys.continueWord.tr(),
          ),
          verticalSpaceSmall(context),
        ],
      ),
    );
  }
}
