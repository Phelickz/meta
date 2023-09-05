import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/locator/locator.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/services/router_service.dart';
import 'package:meta_trader/app/utils/theme.dart';
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
                'Welcome to MT5 Social Trading Platform',
                textAlign: TextAlign.center,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.4),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              verticalSpaceSmall(context),
              Text(
                'Now you can start investing with top master traders, track and manage your subscriptions.',
                textAlign: TextAlign.center,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  fontWeight: FontWeight.normal,
                  color: isDarkMode ? Colors.white : Colors.black54,
                ),
              ),
              verticalSpaceSmall(context),
              verticalSpaceMedium(context),
              CustomButtons.generalButton(
                  context: context,
                  onTap: () {
                    final routerService = locator<RouterService>();
                    routerService.router.push(const SocialTradingDasboard());
                  },
                  text: 'Get Started'),
              verticalSpaceSmall(context),
            ],
          ),
        ),
      ),
    );
  }
}
