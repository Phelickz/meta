import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class MetaTraderRouter extends $MetaTraderRouter {
  @override
  List<AutoRoute> get routes => [
        // AdaptiveRoute(page: StartupRoute.page),
        //Should be the commented/below instead of the above
        AdaptiveRoute(page: StartupRoute.page),
        AdaptiveRoute(page: OnboardingRoute.page),
        AdaptiveRoute(page: AuthRoute.page),
        AdaptiveRoute(page: HomeRoute.page),
        AdaptiveRoute(page: SettingsRoute.page),
        AdaptiveRoute(page: ReferralRoute.page),
        AdaptiveRoute(page: PmMainRoute.page),
        AdaptiveRoute(page: PmAddRoute.page),
        AdaptiveRoute(page: PmOnlineRoute.page),
        AdaptiveRoute(page: PmBinancePayRoute.page),
        AdaptiveRoute(page: PmNetellerRoute.page),
        AdaptiveRoute(page: PmSticPayRoute.page, initial: true),
      ];
}
