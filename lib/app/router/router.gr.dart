// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i33;
import 'package:flutter/material.dart' as _i34;
import 'package:meta_trader/ui/views/auth/auth_view.dart' as _i1;
import 'package:meta_trader/ui/views/bottomNav/bottom_nav.dart' as _i2;
import 'package:meta_trader/ui/views/chart/chart_view.dart' as _i3;
import 'package:meta_trader/ui/views/currency_converter/currency_converter_view.dart'
    as _i4;
import 'package:meta_trader/ui/views/dashboard/dashboard_view.dart' as _i5;
import 'package:meta_trader/ui/views/forex_news/forex_news_view.dart' as _i6;
import 'package:meta_trader/ui/views/fund_account/fund_account_view.dart'
    as _i7;
import 'package:meta_trader/ui/views/help_and_support/help_and_support_view.dart'
    as _i8;
import 'package:meta_trader/ui/views/home/home_view.dart' as _i9;
import 'package:meta_trader/ui/views/loyalty_rewards/loyalty_rewards_view.dart'
    as _i10;
import 'package:meta_trader/ui/views/manage_accounts/manage_account_view.dart'
    as _i11;
import 'package:meta_trader/ui/views/margin_calculator/margin_calculator_view.dart'
    as _i12;
import 'package:meta_trader/ui/views/notifications/notifications_view.dart'
    as _i14;
import 'package:meta_trader/ui/views/onboarding/onboarding.dart' as _i15;
import 'package:meta_trader/ui/views/payment_methods/payment_method_view.dart'
    as _i16;
import 'package:meta_trader/ui/views/pip_calculator/pip_calculator_view.dart'
    as _i17;
import 'package:meta_trader/ui/views/price_sentiments/price_sentiments_view.dart'
    as _i18;
import 'package:meta_trader/ui/views/profile/profile_view.dart' as _i19;
import 'package:meta_trader/ui/views/profit_calculator/profit_calculator_view.dart'
    as _i20;
import 'package:meta_trader/ui/views/quotes/quotes_view.dart' as _i21;
import 'package:meta_trader/ui/views/referral/referral_view.dart' as _i22;
import 'package:meta_trader/ui/views/security/security_view.dart' as _i23;
import 'package:meta_trader/ui/views/settings/settings_view.dart' as _i24;
import 'package:meta_trader/ui/views/social_trading/dashboard.dart' as _i25;
import 'package:meta_trader/ui/views/social_trading/master_trader_overview.dart'
    as _i13;
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart'
    as _i35;
import 'package:meta_trader/ui/views/social_trading/welcome.dart' as _i26;
import 'package:meta_trader/ui/views/startup/startup_view.dart' as _i27;
import 'package:meta_trader/ui/views/trade/trade_view.dart' as _i29;
import 'package:meta_trader/ui/views/trade_history/trade_history_view.dart'
    as _i28;
import 'package:meta_trader/ui/views/transactions/transactions_view.dart'
    as _i30;
import 'package:meta_trader/ui/views/verification/verification_view.dart'
    as _i31;
import 'package:meta_trader/ui/views/withdraw_funds/withdraw_funds_view.dart'
    as _i32;

abstract class $MetaTraderRouter extends _i33.RootStackRouter {
  $MetaTraderRouter({super.navigatorKey});

  @override
  final Map<String, _i33.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthView(),
      );
    },
    BottomNavBarRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BottomNavBarView(),
      );
    },
    ChartRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChartView(),
      );
    },
    CurrencyConverterRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CurrencyConverterView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DashboardView(),
      );
    },
    ForexNewsRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ForexNewsView(),
      );
    },
    FundAccountRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.FundAccountView(),
      );
    },
    HelpAndSupportRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HelpAndSupportView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomeView(),
      );
    },
    LoyaltyRewardsRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoyaltyRewardsView(),
      );
    },
    ManageAccountRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ManageAccountView(),
      );
    },
    MarginCalculatorRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.MarginCalculatorView(),
      );
    },
    MasterTraderOverview.name: (routeData) {
      final args = routeData.argsAs<MasterTraderOverviewArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.MasterTraderOverview(
          key: args.key,
          model: args.model,
        ),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.NotificationView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.OnboardingView(),
      );
    },
    PaymentMethodRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PaymentMethodView(),
      );
    },
    PipCalculatorRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.PipCalculatorView(),
      );
    },
    PriceSentimentsRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.PriceSentimentsView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.ProfileView(),
      );
    },
    ProfitCalculatorRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.ProfitCalculatorView(),
      );
    },
    QuotesRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.QuotesView(),
      );
    },
    ReferralRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.ReferralView(),
      );
    },
    SecurityRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SecurityView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.SettingsView(),
      );
    },
    SocialTradingDasboard.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.SocialTradingDasboard(),
      );
    },
    SocialTradingWelcome.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.SocialTradingWelcome(),
      );
    },
    StartupRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.StartupView(),
      );
    },
    TradeHistoryRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.TradeHistoryView(),
      );
    },
    TradeRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.TradeView(),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.TransactionsView(),
      );
    },
    VerificationRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.VerificationView(),
      );
    },
    WithdrawFundRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.WithdrawFundView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthView]
class AuthRoute extends _i33.PageRouteInfo<void> {
  const AuthRoute({List<_i33.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BottomNavBarView]
class BottomNavBarRoute extends _i33.PageRouteInfo<void> {
  const BottomNavBarRoute({List<_i33.PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChartView]
class ChartRoute extends _i33.PageRouteInfo<void> {
  const ChartRoute({List<_i33.PageRouteInfo>? children})
      : super(
          ChartRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChartRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CurrencyConverterView]
class CurrencyConverterRoute extends _i33.PageRouteInfo<void> {
  const CurrencyConverterRoute({List<_i33.PageRouteInfo>? children})
      : super(
          CurrencyConverterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CurrencyConverterRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DashboardView]
class DashboardRoute extends _i33.PageRouteInfo<void> {
  const DashboardRoute({List<_i33.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ForexNewsView]
class ForexNewsRoute extends _i33.PageRouteInfo<void> {
  const ForexNewsRoute({List<_i33.PageRouteInfo>? children})
      : super(
          ForexNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForexNewsRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i7.FundAccountView]
class FundAccountRoute extends _i33.PageRouteInfo<void> {
  const FundAccountRoute({List<_i33.PageRouteInfo>? children})
      : super(
          FundAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'FundAccountRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HelpAndSupportView]
class HelpAndSupportRoute extends _i33.PageRouteInfo<void> {
  const HelpAndSupportRoute({List<_i33.PageRouteInfo>? children})
      : super(
          HelpAndSupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpAndSupportRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeView]
class HomeRoute extends _i33.PageRouteInfo<void> {
  const HomeRoute({List<_i33.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LoyaltyRewardsView]
class LoyaltyRewardsRoute extends _i33.PageRouteInfo<void> {
  const LoyaltyRewardsRoute({List<_i33.PageRouteInfo>? children})
      : super(
          LoyaltyRewardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoyaltyRewardsRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ManageAccountView]
class ManageAccountRoute extends _i33.PageRouteInfo<void> {
  const ManageAccountRoute({List<_i33.PageRouteInfo>? children})
      : super(
          ManageAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageAccountRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MarginCalculatorView]
class MarginCalculatorRoute extends _i33.PageRouteInfo<void> {
  const MarginCalculatorRoute({List<_i33.PageRouteInfo>? children})
      : super(
          MarginCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarginCalculatorRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i13.MasterTraderOverview]
class MasterTraderOverview
    extends _i33.PageRouteInfo<MasterTraderOverviewArgs> {
  MasterTraderOverview({
    _i34.Key? key,
    required _i35.SocialTradingViewModel model,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          MasterTraderOverview.name,
          args: MasterTraderOverviewArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'MasterTraderOverview';

  static const _i33.PageInfo<MasterTraderOverviewArgs> page =
      _i33.PageInfo<MasterTraderOverviewArgs>(name);
}

class MasterTraderOverviewArgs {
  const MasterTraderOverviewArgs({
    this.key,
    required this.model,
  });

  final _i34.Key? key;

  final _i35.SocialTradingViewModel model;

  @override
  String toString() {
    return 'MasterTraderOverviewArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i14.NotificationView]
class NotificationRoute extends _i33.PageRouteInfo<void> {
  const NotificationRoute({List<_i33.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i15.OnboardingView]
class OnboardingRoute extends _i33.PageRouteInfo<void> {
  const OnboardingRoute({List<_i33.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PaymentMethodView]
class PaymentMethodRoute extends _i33.PageRouteInfo<void> {
  const PaymentMethodRoute({List<_i33.PageRouteInfo>? children})
      : super(
          PaymentMethodRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentMethodRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i17.PipCalculatorView]
class PipCalculatorRoute extends _i33.PageRouteInfo<void> {
  const PipCalculatorRoute({List<_i33.PageRouteInfo>? children})
      : super(
          PipCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'PipCalculatorRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i18.PriceSentimentsView]
class PriceSentimentsRoute extends _i33.PageRouteInfo<void> {
  const PriceSentimentsRoute({List<_i33.PageRouteInfo>? children})
      : super(
          PriceSentimentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PriceSentimentsRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ProfileView]
class ProfileRoute extends _i33.PageRouteInfo<void> {
  const ProfileRoute({List<_i33.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i20.ProfitCalculatorView]
class ProfitCalculatorRoute extends _i33.PageRouteInfo<void> {
  const ProfitCalculatorRoute({List<_i33.PageRouteInfo>? children})
      : super(
          ProfitCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfitCalculatorRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i21.QuotesView]
class QuotesRoute extends _i33.PageRouteInfo<void> {
  const QuotesRoute({List<_i33.PageRouteInfo>? children})
      : super(
          QuotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuotesRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ReferralView]
class ReferralRoute extends _i33.PageRouteInfo<void> {
  const ReferralRoute({List<_i33.PageRouteInfo>? children})
      : super(
          ReferralRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReferralRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SecurityView]
class SecurityRoute extends _i33.PageRouteInfo<void> {
  const SecurityRoute({List<_i33.PageRouteInfo>? children})
      : super(
          SecurityRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecurityRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i24.SettingsView]
class SettingsRoute extends _i33.PageRouteInfo<void> {
  const SettingsRoute({List<_i33.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i25.SocialTradingDasboard]
class SocialTradingDasboard extends _i33.PageRouteInfo<void> {
  const SocialTradingDasboard({List<_i33.PageRouteInfo>? children})
      : super(
          SocialTradingDasboard.name,
          initialChildren: children,
        );

  static const String name = 'SocialTradingDasboard';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i26.SocialTradingWelcome]
class SocialTradingWelcome extends _i33.PageRouteInfo<void> {
  const SocialTradingWelcome({List<_i33.PageRouteInfo>? children})
      : super(
          SocialTradingWelcome.name,
          initialChildren: children,
        );

  static const String name = 'SocialTradingWelcome';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i27.StartupView]
class StartupRoute extends _i33.PageRouteInfo<void> {
  const StartupRoute({List<_i33.PageRouteInfo>? children})
      : super(
          StartupRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartupRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i28.TradeHistoryView]
class TradeHistoryRoute extends _i33.PageRouteInfo<void> {
  const TradeHistoryRoute({List<_i33.PageRouteInfo>? children})
      : super(
          TradeHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'TradeHistoryRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i29.TradeView]
class TradeRoute extends _i33.PageRouteInfo<void> {
  const TradeRoute({List<_i33.PageRouteInfo>? children})
      : super(
          TradeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TradeRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i30.TransactionsView]
class TransactionsRoute extends _i33.PageRouteInfo<void> {
  const TransactionsRoute({List<_i33.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i31.VerificationView]
class VerificationRoute extends _i33.PageRouteInfo<void> {
  const VerificationRoute({List<_i33.PageRouteInfo>? children})
      : super(
          VerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i32.WithdrawFundView]
class WithdrawFundRoute extends _i33.PageRouteInfo<void> {
  const WithdrawFundRoute({List<_i33.PageRouteInfo>? children})
      : super(
          WithdrawFundRoute.name,
          initialChildren: children,
        );

  static const String name = 'WithdrawFundRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}
