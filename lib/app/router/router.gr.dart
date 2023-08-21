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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:meta_trader/ui/views/auth/auth_view.dart' as _i4;
import 'package:meta_trader/ui/views/dashboard/dashboard_view.dart' as _i6;
import 'package:meta_trader/ui/views/home/home_view.dart' as _i2;
import 'package:meta_trader/ui/views/onboarding/onboarding.dart' as _i3;
import 'package:meta_trader/ui/views/startup/startup_view.dart' as _i1;
import 'package:meta_trader/ui/views/verification/verification_view.dart'
    as _i5;

class MetaTraderRouter extends _i7.RootStackRouter {
  MetaTraderRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingView(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.AuthView(),
      );
    },
    VerificationRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.VerificationView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.DashboardView(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          StartupRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/home-view',
        ),
        _i7.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding-view',
        ),
        _i7.RouteConfig(
          AuthRoute.name,
          path: '/auth-view',
        ),
        _i7.RouteConfig(
          VerificationRoute.name,
          path: '/verification-view',
        ),
        _i7.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupRoute extends _i7.PageRouteInfo<void> {
  const StartupRoute()
      : super(
          StartupRoute.name,
          path: '/',
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.OnboardingView]
class OnboardingRoute extends _i7.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding-view',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i4.AuthView]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/auth-view',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i5.VerificationView]
class VerificationRoute extends _i7.PageRouteInfo<void> {
  const VerificationRoute()
      : super(
          VerificationRoute.name,
          path: '/verification-view',
        );

  static const String name = 'VerificationRoute';
}

/// generated route for
/// [_i6.DashboardView]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard-view',
        );

  static const String name = 'DashboardRoute';
}
