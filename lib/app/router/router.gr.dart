// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i43;
import 'package:flutter/material.dart' as _i44;
import 'package:meta_trader/ui/views/auth/auth_view.dart' as _i1;
import 'package:meta_trader/ui/views/bottomNav/bottom_nav.dart' as _i2;
import 'package:meta_trader/ui/views/chart/chart_view.dart' as _i3;
import 'package:meta_trader/ui/views/currency_converter/currency_converter_view.dart'
    as _i6;
import 'package:meta_trader/ui/views/dashboard/dashboard_view.dart' as _i7;
import 'package:meta_trader/ui/views/forex_news/forex_news_view.dart' as _i8;
import 'package:meta_trader/ui/views/fund_account/fund_account_view.dart'
    as _i9;
import 'package:meta_trader/ui/views/help_and_support/help_and_support_view.dart'
    as _i10;
import 'package:meta_trader/ui/views/home/home_view.dart' as _i11;
import 'package:meta_trader/ui/views/internal_transfer/internal_transfer_view.dart'
    as _i14;
import 'package:meta_trader/ui/views/internal_transfer/internal_transfer_view_model.dart'
    as _i46;
import 'package:meta_trader/ui/views/loyalty_rewards/loyalty_rewards_view.dart'
    as _i15;
import 'package:meta_trader/ui/views/loyalty_rewards/loyalty_rewards_view_model.dart'
    as _i48;
import 'package:meta_trader/ui/views/manage_accounts/manage_account_view.dart'
    as _i16;
import 'package:meta_trader/ui/views/margin_calculator/margin_calculator_view.dart'
    as _i17;
import 'package:meta_trader/ui/views/notifications/notifications_view.dart'
    as _i19;
import 'package:meta_trader/ui/views/onboarding/onboarding.dart' as _i20;
import 'package:meta_trader/ui/views/payment_methods/payment_method_view.dart'
    as _i21;
import 'package:meta_trader/ui/views/pip_calculator/pip_calculator_view.dart'
    as _i22;
import 'package:meta_trader/ui/views/price_sentiments/price_sentiments_view.dart'
    as _i23;
import 'package:meta_trader/ui/views/profile/profile_view.dart' as _i24;
import 'package:meta_trader/ui/views/profit_calculator/profit_calculator_view.dart'
    as _i25;
import 'package:meta_trader/ui/views/provider/provider_view.dart' as _i27;
import 'package:meta_trader/ui/views/provider/provider_view_model.dart' as _i47;
import 'package:meta_trader/ui/views/quotes/quotes_view.dart' as _i28;
import 'package:meta_trader/ui/views/referral/referral_view.dart' as _i30;
import 'package:meta_trader/ui/views/security/security_view.dart' as _i31;
import 'package:meta_trader/ui/views/settings/settings_view.dart' as _i32;
import 'package:meta_trader/ui/views/social_trading/dashboard.dart' as _i33;
import 'package:meta_trader/ui/views/social_trading/master_trader_overview.dart'
    as _i18;
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart'
    as _i45;
import 'package:meta_trader/ui/views/social_trading/welcome.dart' as _i34;
import 'package:meta_trader/ui/views/startup/startup_view.dart' as _i35;
import 'package:meta_trader/ui/views/trade/trade_view.dart' as _i39;
import 'package:meta_trader/ui/views/trade_history/trade_history_view.dart'
    as _i38;
import 'package:meta_trader/ui/views/transactions/transactions_view.dart'
    as _i40;
import 'package:meta_trader/ui/views/verification/verification_view.dart'
    as _i41;
import 'package:meta_trader/ui/views/withdraw_funds/withdraw_funds_view.dart'
    as _i42;
import 'package:meta_trader/ui/widgets/internal_transfer/amount.dart' as _i12;
import 'package:meta_trader/ui/widgets/internal_transfer/success.dart' as _i13;
import 'package:meta_trader/ui/widgets/loyalty_rewards/recent_activity.dart'
    as _i29;
import 'package:meta_trader/ui/widgets/provider/provider_followers.dart'
    as _i26;
import 'package:meta_trader/ui/widgets/social_trading/copied_trader_success.dart'
    as _i4;
import 'package:meta_trader/ui/widgets/social_trading/copied_trader_terminated.dart'
    as _i5;
import 'package:meta_trader/ui/widgets/social_trading/subscription_guide.dart'
    as _i36;
import 'package:meta_trader/ui/widgets/social_trading/subscription_setup.dart'
    as _i37;

abstract class $MetaTraderRouter extends _i43.RootStackRouter {
  $MetaTraderRouter({super.navigatorKey});

  @override
  final Map<String, _i43.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthView(),
      );
    },
    BottomNavBarRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BottomNavBarView(),
      );
    },
    ChartRoute.name: (routeData) {
      final args = routeData.argsAs<ChartRouteArgs>(
          orElse: () => const ChartRouteArgs());
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ChartView(
          key: args.key,
          showBackButton: args.showBackButton,
        ),
      );
    },
    CopiedTraderSuccessPage.name: (routeData) {
      final args = routeData.argsAs<CopiedTraderSuccessPageArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CopiedTraderSuccessPage(
          key: args.key,
          viewModel: args.viewModel,
        ),
      );
    },
    CopiedTraderTerminatedPage.name: (routeData) {
      final args = routeData.argsAs<CopiedTraderTerminatedPageArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CopiedTraderTerminatedPage(
          key: args.key,
          viewModel: args.viewModel,
        ),
      );
    },
    CurrencyConverterRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CurrencyConverterView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DashboardView(),
      );
    },
    ForexNewsRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ForexNewsView(),
      );
    },
    FundAccountRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.FundAccountView(),
      );
    },
    HelpAndSupportRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HelpAndSupportView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.HomeView(),
      );
    },
    InternalTransferAmount.name: (routeData) {
      final args = routeData.argsAs<InternalTransferAmountArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.InternalTransferAmount(
          key: args.key,
          model: args.model,
        ),
      );
    },
    InternalTransferSuccess.name: (routeData) {
      final args = routeData.argsAs<InternalTransferSuccessArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.InternalTransferSuccess(
          key: args.key,
          model: args.model,
        ),
      );
    },
    InternalTransferRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.InternalTransferView(),
      );
    },
    LoyaltyRewardsRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.LoyaltyRewardsView(),
      );
    },
    ManageAccountRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ManageAccountView(),
      );
    },
    MarginCalculatorRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.MarginCalculatorView(),
      );
    },
    MasterTraderOverview.name: (routeData) {
      final args = routeData.argsAs<MasterTraderOverviewArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.MasterTraderOverview(
          key: args.key,
          model: args.model,
        ),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.NotificationView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.OnboardingView(),
      );
    },
    PaymentMethodRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.PaymentMethodView(),
      );
    },
    PipCalculatorRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.PipCalculatorView(),
      );
    },
    PriceSentimentsRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.PriceSentimentsView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.ProfileView(),
      );
    },
    ProfitCalculatorRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.ProfitCalculatorView(),
      );
    },
    ProviderFollowerPage.name: (routeData) {
      final args = routeData.argsAs<ProviderFollowerPageArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.ProviderFollowerPage(
          key: args.key,
          viewModel: args.viewModel,
        ),
      );
    },
    ProviderRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.ProviderView(),
      );
    },
    QuotesRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.QuotesView(),
      );
    },
    RecentActivity.name: (routeData) {
      final args = routeData.argsAs<RecentActivityArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.RecentActivity(
          key: args.key,
          model: args.model,
        ),
      );
    },
    ReferralRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.ReferralView(),
      );
    },
    SecurityRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.SecurityView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.SettingsView(),
      );
    },
    SocialTradingDasboard.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.SocialTradingDasboard(),
      );
    },
    SocialTradingWelcome.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.SocialTradingWelcome(),
      );
    },
    StartupRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i35.StartupView(),
      );
    },
    SubscriptionGuidePage.name: (routeData) {
      final args = routeData.argsAs<SubscriptionGuidePageArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i36.SubscriptionGuidePage(
          key: args.key,
          viewModel: args.viewModel,
        ),
      );
    },
    SubscriptionSetupPage.name: (routeData) {
      final args = routeData.argsAs<SubscriptionSetupPageArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.SubscriptionSetupPage(
          key: args.key,
          viewModel: args.viewModel,
        ),
      );
    },
    TradeHistoryRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i38.TradeHistoryView(),
      );
    },
    TradeRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i39.TradeView(),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i40.TransactionsView(),
      );
    },
    VerificationRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i41.VerificationView(),
      );
    },
    WithdrawFundRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i42.WithdrawFundView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthView]
class AuthRoute extends _i43.PageRouteInfo<void> {
  const AuthRoute({List<_i43.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BottomNavBarView]
class BottomNavBarRoute extends _i43.PageRouteInfo<void> {
  const BottomNavBarRoute({List<_i43.PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChartView]
class ChartRoute extends _i43.PageRouteInfo<ChartRouteArgs> {
  ChartRoute({
    _i44.Key? key,
    bool? showBackButton = false,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          ChartRoute.name,
          args: ChartRouteArgs(
            key: key,
            showBackButton: showBackButton,
          ),
          initialChildren: children,
        );

  static const String name = 'ChartRoute';

  static const _i43.PageInfo<ChartRouteArgs> page =
      _i43.PageInfo<ChartRouteArgs>(name);
}

class ChartRouteArgs {
  const ChartRouteArgs({
    this.key,
    this.showBackButton = false,
  });

  final _i44.Key? key;

  final bool? showBackButton;

  @override
  String toString() {
    return 'ChartRouteArgs{key: $key, showBackButton: $showBackButton}';
  }
}

/// generated route for
/// [_i4.CopiedTraderSuccessPage]
class CopiedTraderSuccessPage
    extends _i43.PageRouteInfo<CopiedTraderSuccessPageArgs> {
  CopiedTraderSuccessPage({
    _i44.Key? key,
    required _i45.SocialTradingViewModel viewModel,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          CopiedTraderSuccessPage.name,
          args: CopiedTraderSuccessPageArgs(
            key: key,
            viewModel: viewModel,
          ),
          initialChildren: children,
        );

  static const String name = 'CopiedTraderSuccessPage';

  static const _i43.PageInfo<CopiedTraderSuccessPageArgs> page =
      _i43.PageInfo<CopiedTraderSuccessPageArgs>(name);
}

class CopiedTraderSuccessPageArgs {
  const CopiedTraderSuccessPageArgs({
    this.key,
    required this.viewModel,
  });

  final _i44.Key? key;

  final _i45.SocialTradingViewModel viewModel;

  @override
  String toString() {
    return 'CopiedTraderSuccessPageArgs{key: $key, viewModel: $viewModel}';
  }
}

/// generated route for
/// [_i5.CopiedTraderTerminatedPage]
class CopiedTraderTerminatedPage
    extends _i43.PageRouteInfo<CopiedTraderTerminatedPageArgs> {
  CopiedTraderTerminatedPage({
    _i44.Key? key,
    required _i45.SocialTradingViewModel viewModel,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          CopiedTraderTerminatedPage.name,
          args: CopiedTraderTerminatedPageArgs(
            key: key,
            viewModel: viewModel,
          ),
          initialChildren: children,
        );

  static const String name = 'CopiedTraderTerminatedPage';

  static const _i43.PageInfo<CopiedTraderTerminatedPageArgs> page =
      _i43.PageInfo<CopiedTraderTerminatedPageArgs>(name);
}

class CopiedTraderTerminatedPageArgs {
  const CopiedTraderTerminatedPageArgs({
    this.key,
    required this.viewModel,
  });

  final _i44.Key? key;

  final _i45.SocialTradingViewModel viewModel;

  @override
  String toString() {
    return 'CopiedTraderTerminatedPageArgs{key: $key, viewModel: $viewModel}';
  }
}

/// generated route for
/// [_i6.CurrencyConverterView]
class CurrencyConverterRoute extends _i43.PageRouteInfo<void> {
  const CurrencyConverterRoute({List<_i43.PageRouteInfo>? children})
      : super(
          CurrencyConverterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CurrencyConverterRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DashboardView]
class DashboardRoute extends _i43.PageRouteInfo<void> {
  const DashboardRoute({List<_i43.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ForexNewsView]
class ForexNewsRoute extends _i43.PageRouteInfo<void> {
  const ForexNewsRoute({List<_i43.PageRouteInfo>? children})
      : super(
          ForexNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForexNewsRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i9.FundAccountView]
class FundAccountRoute extends _i43.PageRouteInfo<void> {
  const FundAccountRoute({List<_i43.PageRouteInfo>? children})
      : super(
          FundAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'FundAccountRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HelpAndSupportView]
class HelpAndSupportRoute extends _i43.PageRouteInfo<void> {
  const HelpAndSupportRoute({List<_i43.PageRouteInfo>? children})
      : super(
          HelpAndSupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpAndSupportRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i11.HomeView]
class HomeRoute extends _i43.PageRouteInfo<void> {
  const HomeRoute({List<_i43.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i12.InternalTransferAmount]
class InternalTransferAmount
    extends _i43.PageRouteInfo<InternalTransferAmountArgs> {
  InternalTransferAmount({
    _i44.Key? key,
    required _i46.InternalTransferViewModel model,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          InternalTransferAmount.name,
          args: InternalTransferAmountArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'InternalTransferAmount';

  static const _i43.PageInfo<InternalTransferAmountArgs> page =
      _i43.PageInfo<InternalTransferAmountArgs>(name);
}

class InternalTransferAmountArgs {
  const InternalTransferAmountArgs({
    this.key,
    required this.model,
  });

  final _i44.Key? key;

  final _i46.InternalTransferViewModel model;

  @override
  String toString() {
    return 'InternalTransferAmountArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i13.InternalTransferSuccess]
class InternalTransferSuccess
    extends _i43.PageRouteInfo<InternalTransferSuccessArgs> {
  InternalTransferSuccess({
    _i44.Key? key,
    required _i46.InternalTransferViewModel model,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          InternalTransferSuccess.name,
          args: InternalTransferSuccessArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'InternalTransferSuccess';

  static const _i43.PageInfo<InternalTransferSuccessArgs> page =
      _i43.PageInfo<InternalTransferSuccessArgs>(name);
}

class InternalTransferSuccessArgs {
  const InternalTransferSuccessArgs({
    this.key,
    required this.model,
  });

  final _i44.Key? key;

  final _i46.InternalTransferViewModel model;

  @override
  String toString() {
    return 'InternalTransferSuccessArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i14.InternalTransferView]
class InternalTransferRoute extends _i43.PageRouteInfo<void> {
  const InternalTransferRoute({List<_i43.PageRouteInfo>? children})
      : super(
          InternalTransferRoute.name,
          initialChildren: children,
        );

  static const String name = 'InternalTransferRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i15.LoyaltyRewardsView]
class LoyaltyRewardsRoute extends _i43.PageRouteInfo<void> {
  const LoyaltyRewardsRoute({List<_i43.PageRouteInfo>? children})
      : super(
          LoyaltyRewardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoyaltyRewardsRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ManageAccountView]
class ManageAccountRoute extends _i43.PageRouteInfo<void> {
  const ManageAccountRoute({List<_i43.PageRouteInfo>? children})
      : super(
          ManageAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageAccountRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i17.MarginCalculatorView]
class MarginCalculatorRoute extends _i43.PageRouteInfo<void> {
  const MarginCalculatorRoute({List<_i43.PageRouteInfo>? children})
      : super(
          MarginCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarginCalculatorRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i18.MasterTraderOverview]
class MasterTraderOverview
    extends _i43.PageRouteInfo<MasterTraderOverviewArgs> {
  MasterTraderOverview({
    _i44.Key? key,
    required _i45.SocialTradingViewModel model,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          MasterTraderOverview.name,
          args: MasterTraderOverviewArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'MasterTraderOverview';

  static const _i43.PageInfo<MasterTraderOverviewArgs> page =
      _i43.PageInfo<MasterTraderOverviewArgs>(name);
}

class MasterTraderOverviewArgs {
  const MasterTraderOverviewArgs({
    this.key,
    required this.model,
  });

  final _i44.Key? key;

  final _i45.SocialTradingViewModel model;

  @override
  String toString() {
    return 'MasterTraderOverviewArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i19.NotificationView]
class NotificationRoute extends _i43.PageRouteInfo<void> {
  const NotificationRoute({List<_i43.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i20.OnboardingView]
class OnboardingRoute extends _i43.PageRouteInfo<void> {
  const OnboardingRoute({List<_i43.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i21.PaymentMethodView]
class PaymentMethodRoute extends _i43.PageRouteInfo<void> {
  const PaymentMethodRoute({List<_i43.PageRouteInfo>? children})
      : super(
          PaymentMethodRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentMethodRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i22.PipCalculatorView]
class PipCalculatorRoute extends _i43.PageRouteInfo<void> {
  const PipCalculatorRoute({List<_i43.PageRouteInfo>? children})
      : super(
          PipCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'PipCalculatorRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i23.PriceSentimentsView]
class PriceSentimentsRoute extends _i43.PageRouteInfo<void> {
  const PriceSentimentsRoute({List<_i43.PageRouteInfo>? children})
      : super(
          PriceSentimentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PriceSentimentsRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i24.ProfileView]
class ProfileRoute extends _i43.PageRouteInfo<void> {
  const ProfileRoute({List<_i43.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ProfitCalculatorView]
class ProfitCalculatorRoute extends _i43.PageRouteInfo<void> {
  const ProfitCalculatorRoute({List<_i43.PageRouteInfo>? children})
      : super(
          ProfitCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfitCalculatorRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i26.ProviderFollowerPage]
class ProviderFollowerPage
    extends _i43.PageRouteInfo<ProviderFollowerPageArgs> {
  ProviderFollowerPage({
    _i44.Key? key,
    required _i47.ProviderViewModel viewModel,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          ProviderFollowerPage.name,
          args: ProviderFollowerPageArgs(
            key: key,
            viewModel: viewModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ProviderFollowerPage';

  static const _i43.PageInfo<ProviderFollowerPageArgs> page =
      _i43.PageInfo<ProviderFollowerPageArgs>(name);
}

class ProviderFollowerPageArgs {
  const ProviderFollowerPageArgs({
    this.key,
    required this.viewModel,
  });

  final _i44.Key? key;

  final _i47.ProviderViewModel viewModel;

  @override
  String toString() {
    return 'ProviderFollowerPageArgs{key: $key, viewModel: $viewModel}';
  }
}

/// generated route for
/// [_i27.ProviderView]
class ProviderRoute extends _i43.PageRouteInfo<void> {
  const ProviderRoute({List<_i43.PageRouteInfo>? children})
      : super(
          ProviderRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProviderRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i28.QuotesView]
class QuotesRoute extends _i43.PageRouteInfo<void> {
  const QuotesRoute({List<_i43.PageRouteInfo>? children})
      : super(
          QuotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuotesRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i29.RecentActivity]
class RecentActivity extends _i43.PageRouteInfo<RecentActivityArgs> {
  RecentActivity({
    _i44.Key? key,
    required _i48.LoyaltyRewardsViewModel model,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          RecentActivity.name,
          args: RecentActivityArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'RecentActivity';

  static const _i43.PageInfo<RecentActivityArgs> page =
      _i43.PageInfo<RecentActivityArgs>(name);
}

class RecentActivityArgs {
  const RecentActivityArgs({
    this.key,
    required this.model,
  });

  final _i44.Key? key;

  final _i48.LoyaltyRewardsViewModel model;

  @override
  String toString() {
    return 'RecentActivityArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i30.ReferralView]
class ReferralRoute extends _i43.PageRouteInfo<void> {
  const ReferralRoute({List<_i43.PageRouteInfo>? children})
      : super(
          ReferralRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReferralRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i31.SecurityView]
class SecurityRoute extends _i43.PageRouteInfo<void> {
  const SecurityRoute({List<_i43.PageRouteInfo>? children})
      : super(
          SecurityRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecurityRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i32.SettingsView]
class SettingsRoute extends _i43.PageRouteInfo<void> {
  const SettingsRoute({List<_i43.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i33.SocialTradingDasboard]
class SocialTradingDasboard extends _i43.PageRouteInfo<void> {
  const SocialTradingDasboard({List<_i43.PageRouteInfo>? children})
      : super(
          SocialTradingDasboard.name,
          initialChildren: children,
        );

  static const String name = 'SocialTradingDasboard';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i34.SocialTradingWelcome]
class SocialTradingWelcome extends _i43.PageRouteInfo<void> {
  const SocialTradingWelcome({List<_i43.PageRouteInfo>? children})
      : super(
          SocialTradingWelcome.name,
          initialChildren: children,
        );

  static const String name = 'SocialTradingWelcome';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i35.StartupView]
class StartupRoute extends _i43.PageRouteInfo<void> {
  const StartupRoute({List<_i43.PageRouteInfo>? children})
      : super(
          StartupRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartupRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i36.SubscriptionGuidePage]
class SubscriptionGuidePage
    extends _i43.PageRouteInfo<SubscriptionGuidePageArgs> {
  SubscriptionGuidePage({
    _i44.Key? key,
    required _i45.SocialTradingViewModel viewModel,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          SubscriptionGuidePage.name,
          args: SubscriptionGuidePageArgs(
            key: key,
            viewModel: viewModel,
          ),
          initialChildren: children,
        );

  static const String name = 'SubscriptionGuidePage';

  static const _i43.PageInfo<SubscriptionGuidePageArgs> page =
      _i43.PageInfo<SubscriptionGuidePageArgs>(name);
}

class SubscriptionGuidePageArgs {
  const SubscriptionGuidePageArgs({
    this.key,
    required this.viewModel,
  });

  final _i44.Key? key;

  final _i45.SocialTradingViewModel viewModel;

  @override
  String toString() {
    return 'SubscriptionGuidePageArgs{key: $key, viewModel: $viewModel}';
  }
}

/// generated route for
/// [_i37.SubscriptionSetupPage]
class SubscriptionSetupPage
    extends _i43.PageRouteInfo<SubscriptionSetupPageArgs> {
  SubscriptionSetupPage({
    _i44.Key? key,
    required _i45.SocialTradingViewModel viewModel,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          SubscriptionSetupPage.name,
          args: SubscriptionSetupPageArgs(
            key: key,
            viewModel: viewModel,
          ),
          initialChildren: children,
        );

  static const String name = 'SubscriptionSetupPage';

  static const _i43.PageInfo<SubscriptionSetupPageArgs> page =
      _i43.PageInfo<SubscriptionSetupPageArgs>(name);
}

class SubscriptionSetupPageArgs {
  const SubscriptionSetupPageArgs({
    this.key,
    required this.viewModel,
  });

  final _i44.Key? key;

  final _i45.SocialTradingViewModel viewModel;

  @override
  String toString() {
    return 'SubscriptionSetupPageArgs{key: $key, viewModel: $viewModel}';
  }
}

/// generated route for
/// [_i38.TradeHistoryView]
class TradeHistoryRoute extends _i43.PageRouteInfo<void> {
  const TradeHistoryRoute({List<_i43.PageRouteInfo>? children})
      : super(
          TradeHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'TradeHistoryRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i39.TradeView]
class TradeRoute extends _i43.PageRouteInfo<void> {
  const TradeRoute({List<_i43.PageRouteInfo>? children})
      : super(
          TradeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TradeRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i40.TransactionsView]
class TransactionsRoute extends _i43.PageRouteInfo<void> {
  const TransactionsRoute({List<_i43.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i41.VerificationView]
class VerificationRoute extends _i43.PageRouteInfo<void> {
  const VerificationRoute({List<_i43.PageRouteInfo>? children})
      : super(
          VerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i42.WithdrawFundView]
class WithdrawFundRoute extends _i43.PageRouteInfo<void> {
  const WithdrawFundRoute({List<_i43.PageRouteInfo>? children})
      : super(
          WithdrawFundRoute.name,
          initialChildren: children,
        );

  static const String name = 'WithdrawFundRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}
