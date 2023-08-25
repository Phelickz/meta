import 'package:auto_route/auto_route.dart';
import 'package:meta_trader/app/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class MetaTraderRouter extends $MetaTraderRouter {
  @override
  List<AutoRoute> get routes => [
        // AdaptiveRoute(page: StartupRoute.page),
        //Should be the commented/below instead of the above
        AdaptiveRoute(
          page: StartupRoute.page,
          initial: true,
        ),
        AdaptiveRoute(page: OnboardingRoute.page),
        AdaptiveRoute(page: AuthRoute.page),
        AdaptiveRoute(page: HomeRoute.page),
        AdaptiveRoute(page: SettingsRoute.page),
        AdaptiveRoute(page: ReferralRoute.page),

        //payment methods routes
        AdaptiveRoute(
          page: PmMainRoute.page,
        ),
        AdaptiveRoute(page: PmAddRoute.page),
        // AdaptiveRoute(page: PmOnlineRoute.page), //they are being managed in the state now. its better like that so that they can share the paymentmethodviewmodel
        // AdaptiveRoute(page: PmBinancePayRoute.page),
        // AdaptiveRoute(page: PmNetellerRoute.page),
        // AdaptiveRoute(page: PmSticPayRoute.page),
        // AdaptiveRoute(page: PmTetherRoute.page),
        // AdaptiveRoute(page: PmSkrillRoute.page),
        // AdaptiveRoute(page: PmBitcoinRoute.page),
        // AdaptiveRoute(page: PmPerfectMoneyRoute.page),
        AdaptiveRoute(page: PmAddPaymentSuccessRoute.page),
        AdaptiveRoute(page: PmQrcodeRoute.page),

        AdaptiveRoute(page: VerificationRoute.page),
        AdaptiveRoute(page: DashboardRoute.page),
        AdaptiveRoute(page: BottomNavBarRoute.page),
        AdaptiveRoute(
          page: SecurityRoute.page,
          // initial: true,
        ),
        AdaptiveRoute(page: FundAccountRoute.page)
      ];
}
