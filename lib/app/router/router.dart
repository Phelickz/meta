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
          // initial: true,
        ),
        AdaptiveRoute(page: OnboardingRoute.page),
        AdaptiveRoute(page: AuthRoute.page),
        AdaptiveRoute(page: HomeRoute.page),
        AdaptiveRoute(page: SettingsRoute.page),
        AdaptiveRoute(page: ReferralRoute.page),
        AdaptiveRoute(
          page: PaymentMethodRoute.page,
          initial: true,
        ),
        AdaptiveRoute(page: VerificationRoute.page),
        AdaptiveRoute(page: DashboardRoute.page),
        AdaptiveRoute(page: BottomNavBarRoute.page),
        AdaptiveRoute(page: SecurityRoute.page)
      ];
}

// import '../../ui/views/auth/auth_view.dart';
// import '../../ui/views/bottomNav/bottom_nav.dart';
// import '../../ui/views/dashboard/dashboard_view.dart';
// import '../../ui/views/onboarding/onboarding.dart';
// import '../../ui/views/verification/verification_view.dart';
//
// @AdaptiveAutoRouter(
//   replaceInRouteName: "View,Route",
//   routes: <AutoRoute>[
//     AdaptiveRoute(page: StartupView, initial: true),
//     AdaptiveRoute(page: HomeView),
//     AdaptiveRoute(page: OnboardingView),
//     AdaptiveRoute(page: AuthView),
//     AdaptiveRoute(page: VerificationView),
//     AdaptiveRoute(page: DashboardView),
//     AdaptiveRoute(page: BottomNavBarView)
//   ],
// )
