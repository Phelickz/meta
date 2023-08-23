import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class MetaTraderRouter extends $MetaTraderRouter {
  @override
  List<AutoRoute> get routes => [
        // AdaptiveRoute(page: StartupRoute.page),
        //Should be the commented/below instead of the above
        AdaptiveRoute(page: StartupRoute.page, initial: true),
        AdaptiveRoute(page: OnboardingRoute.page),
        AdaptiveRoute(page: AuthRoute.page),
        AdaptiveRoute(page: HomeRoute.page),
        AdaptiveRoute(page: PmAddRoute.page),
        AdaptiveRoute(page: SettingsRoute.page),
        AdaptiveRoute(page: ReferralRoute.page),
        AdaptiveRoute(page: PmMainRoute.page),
        AdaptiveRoute(page: PmAddRoute.page),
      ];
}
