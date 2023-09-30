import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
class SocialTradingWelcome extends StatelessWidget {
  const SocialTradingWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpaceMedium(context),
              SvgPicture.asset(
                'assets/images/social_trading_welcome.svg',
                height: McGyver.rsDoubleH(context, 50),
                width: McGyver.rsDoubleH(context, 50),
              ),
              Text(
                LocaleKeys
                    .views_socialTradingView_socialTradingWelcome_welcomeToMT5,
                textAlign: TextAlign.center,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.4),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ).tr(),
              verticalSpaceSmall(context),
              Text(
                LocaleKeys
                    .views_socialTradingView_socialTradingWelcome_nowYouCanStart,
                textAlign: TextAlign.center,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  fontWeight: FontWeight.normal,
                  color: isDarkMode ? Colors.white : Colors.black54,
                ),
              ).tr(),
              verticalSpaceSmall(context),
              verticalSpaceMedium(context),
              CustomButtons.generalButton(
                context: context,
                onTap: () {
                  final routerService = locator<RouterService>();
                  routerService.router.push(const SocialTradingDasboard());
                },
                text: LocaleKeys
                    .views_socialTradingView_socialTradingWelcome_getStarted
                    .tr(),
              ),
              verticalSpaceSmall(context),
            ],
          ),
        ),
      ),
    );
  }
}
