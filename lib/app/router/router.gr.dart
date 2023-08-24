// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:meta_trader/ui/views/auth/auth_view.dart' as _i1;
import 'package:meta_trader/ui/views/bottomNav/bottom_nav.dart' as _i2;
import 'package:meta_trader/ui/views/dashboard/dashboard_view.dart' as _i3;
import 'package:meta_trader/ui/views/home/home_view.dart' as _i4;
import 'package:meta_trader/ui/views/notifications/notifications_view.dart'
    as _i5;
import 'package:meta_trader/ui/views/onboarding/onboarding.dart' as _i6;
import 'package:meta_trader/ui/views/payment_methods/add_payment_method/pm_add_view.dart'
    as _i8;
import 'package:meta_trader/ui/views/payment_methods/add_payment_success/add_payment_success_view.dart'
    as _i7;
import 'package:meta_trader/ui/views/payment_methods/pm_binance_pay/pm_binance_pay_view.dart'
    as _i13;
import 'package:meta_trader/ui/views/payment_methods/pm_bitcoin/pm_bitcoin_view.dart'
    as _i9;
import 'package:meta_trader/ui/views/payment_methods/pm_main/pm_main_view.dart'
    as _i10;
import 'package:meta_trader/ui/views/payment_methods/pm_neteller/pm_neteller_view.dart'
    as _i11;
import 'package:meta_trader/ui/views/payment_methods/pm_online_bank/pm_online_view.dart'
    as _i12;
import 'package:meta_trader/ui/views/payment_methods/pm_perfect_money.dart/pm_perfect_money.dart'
    as _i14;
import 'package:meta_trader/ui/views/payment_methods/pm_skrill/pm_skrill_view.dart'
    as _i15;
import 'package:meta_trader/ui/views/payment_methods/pm_stic_pay/pm_stic_pay_view.dart'
    as _i16;
import 'package:meta_trader/ui/views/payment_methods/pm_tether/pm_tether_view.dart'
    as _i17;
import 'package:meta_trader/ui/views/profile/profile_view.dart' as _i18;
import 'package:meta_trader/ui/views/referral/referral_view.dart' as _i19;
import 'package:meta_trader/ui/views/settings/settings_view.dart' as _i20;
import 'package:meta_trader/ui/views/startup/startup_view.dart' as _i21;
import 'package:meta_trader/ui/views/verification/verification_view.dart'
    as _i22;

abstract class $MetaTraderRouter extends _i23.RootStackRouter {
  $MetaTraderRouter({super.navigatorKey});

  @override
  final Map<String, _i23.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthView(),
      );
    },
    BottomNavBarRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BottomNavBarView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NotificationView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OnboardingView(),
      );
    },
    PmAddPaymentSuccessRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PmAddPaymentSuccessView(),
      );
    },
    PmAddRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PmAddView(),
      );
    },
    PmBitcoinRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PmBitcoinView(),
      );
    },
    PmMainRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PmMainView(),
      );
    },
    PmNetellerRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PmNetellerView(),
      );
    },
    PmOnlineRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PmOnlineView(),
      );
    },
    PmBinancePayRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.PmOnlineView(),
      );
    },
    PmPerfectMoneyRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.PmPerfectMoneyView(),
      );
    },
    PmSkrillRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PmSkrillView(),
      );
    },
    PmSticPayRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PmSticPayView(),
      );
    },
    PmTetherRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.PmTetherView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ProfileView(),
      );
    },
    ReferralRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ReferralView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SettingsView(),
      );
    },
    StartupRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.StartupView(),
      );
    },
    VerificationRoute.name: (routeData) {
      return _i23.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.VerificationView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthView]
class AuthRoute extends _i23.PageRouteInfo<void> {
  const AuthRoute({List<_i23.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BottomNavBarView]
class BottomNavBarRoute extends _i23.PageRouteInfo<void> {
  const BottomNavBarRoute({List<_i23.PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardView]
class DashboardRoute extends _i23.PageRouteInfo<void> {
  const DashboardRoute({List<_i23.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeView]
class HomeRoute extends _i23.PageRouteInfo<void> {
  const HomeRoute({List<_i23.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NotificationView]
class NotificationRoute extends _i23.PageRouteInfo<void> {
  const NotificationRoute({List<_i23.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnboardingView]
class OnboardingRoute extends _i23.PageRouteInfo<void> {
  const OnboardingRoute({List<_i23.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PmAddPaymentSuccessView]
class PmAddPaymentSuccessRoute extends _i23.PageRouteInfo<void> {
  const PmAddPaymentSuccessRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PmAddPaymentSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmAddPaymentSuccessRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PmAddView]
class PmAddRoute extends _i23.PageRouteInfo<void> {
  const PmAddRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PmAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmAddRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PmBitcoinView]
class PmBitcoinRoute extends _i23.PageRouteInfo<void> {
  const PmBitcoinRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PmBitcoinRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmBitcoinRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PmMainView]
class PmMainRoute extends _i23.PageRouteInfo<void> {
  const PmMainRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PmMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmMainRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PmNetellerView]
class PmNetellerRoute extends _i23.PageRouteInfo<void> {
  const PmNetellerRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PmNetellerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmNetellerRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PmOnlineView]
class PmOnlineRoute extends _i23.PageRouteInfo<void> {
  const PmOnlineRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PmOnlineRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmOnlineRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PmOnlineView]
class PmBinancePayRoute extends _i23.PageRouteInfo<void> {
  const PmBinancePayRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PmBinancePayRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmBinancePayRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PmPerfectMoneyView]
class PmPerfectMoneyRoute extends _i23.PageRouteInfo<void> {
  const PmPerfectMoneyRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PmPerfectMoneyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmPerfectMoneyRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PmSkrillView]
class PmSkrillRoute extends _i23.PageRouteInfo<void> {
  const PmSkrillRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PmSkrillRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmSkrillRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PmSticPayView]
class PmSticPayRoute extends _i23.PageRouteInfo<void> {
  const PmSticPayRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PmSticPayRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmSticPayRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i17.PmTetherView]
class PmTetherRoute extends _i23.PageRouteInfo<void> {
  const PmTetherRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PmTetherRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmTetherRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ProfileView]
class ProfileRoute extends _i23.PageRouteInfo<void> {
  const ProfileRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ReferralView]
class ReferralRoute extends _i23.PageRouteInfo<void> {
  const ReferralRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ReferralRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReferralRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i20.SettingsView]
class SettingsRoute extends _i23.PageRouteInfo<void> {
  const SettingsRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i21.StartupView]
class StartupRoute extends _i23.PageRouteInfo<void> {
  const StartupRoute({List<_i23.PageRouteInfo>? children})
      : super(
          StartupRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartupRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}

/// generated route for
/// [_i22.VerificationView]
class VerificationRoute extends _i23.PageRouteInfo<void> {
  const VerificationRoute({List<_i23.PageRouteInfo>? children})
      : super(
          VerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const _i23.PageInfo<void> page = _i23.PageInfo<void>(name);
}
