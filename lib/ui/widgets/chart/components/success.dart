import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/services/router_service.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';

@RoutePage()
class BuySellSuccess extends StatelessWidget {
  final bool isBuy;
  const BuySellSuccess({super.key, required this.isBuy});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: false,
      body: Column(
        children: [
          verticalSpaceSmall(context),
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
          Text(
            LocaleKeys.successful,
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
              text: isBuy == true
                  ? LocaleKeys.chart_youHaveBought.tr()
                  : LocaleKeys.chart_youHaveSold.tr(),
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
              final router = locator<RouterService>();
              router.router.replaceAll([const BottomNavBarRoute()]);
            },
            text: LocaleKeys.continueWord.tr(),
          ),
          verticalSpaceSmall(context),
        ],
      ),
    );
  }
}
