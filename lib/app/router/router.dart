import 'package:auto_route/auto_route.dart';
import 'package:meta_trader/app/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class MetaTraderRouter extends $MetaTraderRouter {
  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(page: StartupRoute.page, initial: true),
        AdaptiveRoute(page: OnboardingRoute.page),
        AdaptiveRoute(page: AuthRoute.page),
        AdaptiveRoute(page: HomeRoute.page),
        AdaptiveRoute(page: SettingsRoute.page),
        AdaptiveRoute(page: ReferralRoute.page),
        AdaptiveRoute(page: PaymentMethodRoute.page),
        AdaptiveRoute(page: VerificationRoute.page),
        AdaptiveRoute(page: DashboardRoute.page),
        AdaptiveRoute(page: BottomNavBarRoute.page),
        AdaptiveRoute(page: SecurityRoute.page),
        AdaptiveRoute(page: FundAccountRoute.page),
        AdaptiveRoute(page: TradeHistoryRoute.page),
        AdaptiveRoute(page: TradeRoute.page),
        AdaptiveRoute(page: HelpAndSupportRoute.page),
        AdaptiveRoute(page: NotificationRoute.page),
        AdaptiveRoute(page: WithdrawFundRoute.page),
        AdaptiveRoute(page: TradeHistoryRoute.page),
        AdaptiveRoute(page: ForexNewsRoute.page),
        AdaptiveRoute(page: PipCalculatorRoute.page),
        AdaptiveRoute(page: MarginCalculatorRoute.page),
        AdaptiveRoute(page: ProfitCalculatorRoute.page),
        AdaptiveRoute(page: CurrencyConverterRoute.page),
        AdaptiveRoute(page: ManageAccountRoute.page),
        AdaptiveRoute(page: LoyaltyRewardsRoute.page),
        AdaptiveRoute(page: PriceSentimentsRoute.page),
        AdaptiveRoute(page: SocialTradingWelcome.page),
        AdaptiveRoute(page: SocialTradingDasboard.page),
        AdaptiveRoute(page: MasterTraderOverview.page),
        AdaptiveRoute(page: TransactionsRoute.page),
        AdaptiveRoute(page: ChartRoute.page),
      ];
}
