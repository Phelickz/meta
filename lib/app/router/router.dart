import 'package:auto_route/auto_route.dart';

import 'package:meta_trader/ui/views/home/home_view.dart';
import 'package:meta_trader/ui/views/startup/startup_view.dart';

import '../../ui/views/auth/auth_view.dart';
import '../../ui/views/onboarding/onboarding.dart';

export './router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: OnboardingView),
    AdaptiveRoute(page: AuthView)
  ],
)
class $MetaTraderRouter {}
