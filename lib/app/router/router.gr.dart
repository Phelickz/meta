// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:meta_trader/ui/views/auth/auth_view.dart' as _i1;
import 'package:meta_trader/ui/views/home/home_view.dart' as _i2;
import 'package:meta_trader/ui/views/onboarding/onboarding.dart' as _i3;
import 'package:meta_trader/ui/views/payment_methods/add_payment_method/pm_add_view.dart'
    as _i4;
import 'package:meta_trader/ui/views/payment_methods/pm_binance_pay/pm_binance_pay_view.dart'
    as _i9;
import 'package:meta_trader/ui/views/payment_methods/pm_bitcoin/pm_bitcoin_view.dart'
    as _i5;
import 'package:meta_trader/ui/views/payment_methods/pm_main/pm_main_view.dart'
    as _i6;
import 'package:meta_trader/ui/views/payment_methods/pm_neteller/pm_neteller_view.dart'
    as _i7;
import 'package:meta_trader/ui/views/payment_methods/pm_online_bank/pm_online_view.dart'
    as _i8;
import 'package:meta_trader/ui/views/payment_methods/pm_perfect_money.dart/pm_perfect_money.dart'
    as _i10;
import 'package:meta_trader/ui/views/payment_methods/pm_skrill/pm_skrill_view.dart'
    as _i11;
import 'package:meta_trader/ui/views/payment_methods/pm_stic_pay/pm_stic_pay_view.dart'
    as _i12;
import 'package:meta_trader/ui/views/payment_methods/pm_tether/pm_tether_view.dart'
    as _i13;
import 'package:meta_trader/ui/views/profile/profile_view.dart' as _i14;
import 'package:meta_trader/ui/views/referral/referral_view.dart' as _i15;
import 'package:meta_trader/ui/views/settings/settings_view.dart' as _i16;
import 'package:meta_trader/ui/views/startup/startup_view.dart' as _i17;

abstract class $MetaTraderRouter extends _i18.RootStackRouter {
  $MetaTraderRouter({super.navigatorKey});

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingView(),
      );
    },
    PmAddRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PmAddView(),
      );
    },
    PmBitcoinRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PmBitcoinView(),
      );
    },
    PmMainRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PmMainView(),
      );
    },
    PmNetellerRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PmNetellerView(),
      );
    },
    PmOnlineRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PmOnlineView(),
      );
    },
    PmBinancePayRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PmOnlineView(),
      );
    },
    PmPerfectMoneyRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PmPerfectMoneyView(),
      );
    },
    PmSkrillRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PmSkrillView(),
      );
    },
    PmSticPayRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PmSticPayView(),
      );
    },
    PmTetherRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.PmTetherView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ProfileView(),
      );
    },
    ReferralRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ReferralView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SettingsView(),
      );
    },
    StartupRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.StartupView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthView]
class AuthRoute extends _i18.PageRouteInfo<void> {
  const AuthRoute({List<_i18.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OnboardingView]
class OnboardingRoute extends _i18.PageRouteInfo<void> {
  const OnboardingRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PmAddView]
class PmAddRoute extends _i18.PageRouteInfo<void> {
  const PmAddRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PmAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmAddRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PmBitcoinView]
class PmBitcoinRoute extends _i18.PageRouteInfo<void> {
  const PmBitcoinRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PmBitcoinRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmBitcoinRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PmMainView]
class PmMainRoute extends _i18.PageRouteInfo<void> {
  const PmMainRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PmMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmMainRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PmNetellerView]
class PmNetellerRoute extends _i18.PageRouteInfo<void> {
  const PmNetellerRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PmNetellerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmNetellerRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PmOnlineView]
class PmOnlineRoute extends _i18.PageRouteInfo<void> {
  const PmOnlineRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PmOnlineRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmOnlineRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PmOnlineView]
class PmBinancePayRoute extends _i18.PageRouteInfo<void> {
  const PmBinancePayRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PmBinancePayRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmBinancePayRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PmPerfectMoneyView]
class PmPerfectMoneyRoute extends _i18.PageRouteInfo<void> {
  const PmPerfectMoneyRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PmPerfectMoneyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmPerfectMoneyRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PmSkrillView]
class PmSkrillRoute extends _i18.PageRouteInfo<void> {
  const PmSkrillRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PmSkrillRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmSkrillRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PmSticPayView]
class PmSticPayRoute extends _i18.PageRouteInfo<void> {
  const PmSticPayRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PmSticPayRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmSticPayRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PmTetherView]
class PmTetherRoute extends _i18.PageRouteInfo<void> {
  const PmTetherRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PmTetherRoute.name,
          initialChildren: children,
        );

  static const String name = 'PmTetherRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ProfileView]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ReferralView]
class ReferralRoute extends _i18.PageRouteInfo<void> {
  const ReferralRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ReferralRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReferralRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SettingsView]
class SettingsRoute extends _i18.PageRouteInfo<void> {
  const SettingsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i17.StartupView]
class StartupRoute extends _i18.PageRouteInfo<void> {
  const StartupRoute({List<_i18.PageRouteInfo>? children})
      : super(
          StartupRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartupRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}
