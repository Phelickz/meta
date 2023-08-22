// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:meta_trader/ui/views/auth/auth_view.dart' as _i4;
import 'package:meta_trader/ui/views/bottomNav/bottom_nav.dart' as _i7;
import 'package:meta_trader/ui/views/dashboard/dashboard_view.dart' as _i6;
import 'package:meta_trader/ui/views/home/home_view.dart' as _i2;
import 'package:meta_trader/ui/views/onboarding/onboarding.dart' as _i3;
import 'package:meta_trader/ui/views/startup/startup_view.dart' as _i1;
import 'package:meta_trader/ui/views/verification/verification_view.dart'
    as _i5;

class MetaTraderRouter extends _i8.RootStackRouter {
  MetaTraderRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingView(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.AuthView(),
      );
    },
    VerificationRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.VerificationView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.DashboardView(),
      );
    },
    BottomNavBarRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.BottomNavBarView(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          StartupRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          HomeRoute.name,
          path: '/home-view',
        ),
        _i8.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding-view',
        ),
        _i8.RouteConfig(
          AuthRoute.name,
          path: '/auth-view',
        ),
        _i8.RouteConfig(
          VerificationRoute.name,
          path: '/verification-view',
        ),
        _i8.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard-view',
        ),
        _i8.RouteConfig(
          BottomNavBarRoute.name,
          path: '/bottom-nav-bar-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupRoute extends _i8.PageRouteInfo<void> {
  const StartupRoute()
      : super(
          StartupRoute.name,
          path: '/',
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.OnboardingView]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding-view',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i4.AuthView]
class AuthRoute extends _i8.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/auth-view',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i5.VerificationView]
class VerificationRoute extends _i8.PageRouteInfo<void> {
  const VerificationRoute()
      : super(
          VerificationRoute.name,
          path: '/verification-view',
        );

  static const String name = 'VerificationRoute';
}

/// generated route for
/// [_i6.DashboardView]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard-view',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i7.BottomNavBarView]
class BottomNavBarRoute extends _i8.PageRouteInfo<void> {
  const BottomNavBarRoute()
      : super(
          BottomNavBarRoute.name,
          path: '/bottom-nav-bar-view',
        );

  static const String name = 'BottomNavBarRoute';
}
