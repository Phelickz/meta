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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:meta_trader/ui/views/auth/auth_view.dart' as _i4;
import 'package:meta_trader/ui/views/home/home_view.dart' as _i2;
import 'package:meta_trader/ui/views/onboarding/onboarding.dart' as _i3;
import 'package:meta_trader/ui/views/startup/startup_view.dart' as _i1;

class MetaTraderRouter extends _i5.RootStackRouter {
  MetaTraderRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingView(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.AuthView(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          StartupRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/home-view',
        ),
        _i5.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding-view',
        ),
        _i5.RouteConfig(
          AuthRoute.name,
          path: '/auth-view',
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupRoute extends _i5.PageRouteInfo<void> {
  const StartupRoute()
      : super(
          StartupRoute.name,
          path: '/',
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.OnboardingView]
class OnboardingRoute extends _i5.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding-view',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i4.AuthView]
class AuthRoute extends _i5.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/auth-view',
        );

  static const String name = 'AuthRoute';
}
