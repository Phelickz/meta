// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/capitalize.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/app/utils/utils.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/auth/auth_view.dart';
import 'package:meta_trader/ui/views/price_sentiments/price_sentiments_view_model.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/home/price_sentiments.dart';
import 'package:meta_trader/ui/widgets/home/trading_tools.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:meta_trader/ui/widgets/sliverappbar/fade_scroll_app_bar.dart';
import 'package:stacked/stacked.dart';

import './home_view_model.dart';
import '../../widgets/home/higher_success_rates.dart';
import '../../widgets/home/market_news.dart';
import '../../widgets/home/trade_features.dart';

@RoutePage()
class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      bodyPadding: EdgeInsets.zero,
      body: FadeScrollAppBar(
        // toolbarHeight: 20,
        scrollController: viewModel.scrollController,
        // appBarLeading: const Padding(
        //   padding: EdgeInsets.only(left: 8.0),
        //   child: CircleAvatar(
        //     backgroundImage: AssetImage(
        //       'assets/images/logo.png',
        //     ),
        //     backgroundColor: Colors.white,
        //   ),
        // ),
        appBarActions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.headset_outlined,
          //     size: 30,
          //   ),
          //   color: isDarkMode ? Colors.white54 : Colors.white,
          // ),
          IconButton(
            onPressed: () {
              viewModel.push(const NotificationRoute());
            },
            icon: const Icon(
              Icons.notifications_outlined,
              size: 23,
            ),
            color: isDarkMode ? Colors.white54 : Colors.white,
          )
        ],
        appBarCenterTitle: false,
        toolbarHeight: Platform.isIOS ? kToolbarHeight : 85,
        appBarTitle: returnAppBar(context),
        collapsedHeight: Platform.isIOS ? 65 : 90,
        appBarForegroundColor: Colors.amber,
        pinned: true,
        appBarShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
        ),
        fadeOffset: 120,
        expandedHeight: 270,
        backgroundColor: isDarkMode
            ? const Color(0xff052844)
            : Theme.of(context).primaryColor.withOpacity(0.9),
        fadeWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [sliverBody(context, viewModel)],
        ),
        bottomWidgetHeight: McGyver.rsDoubleH(context, 14),
        bottomWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomIcons(context, 'assets/images/money-recive.svg',
                  LocaleKeys.depositFunds.tr(), () {
                viewModel.push(const FundAccountRoute());
              }),
              const SizedBox(width: 10),
              bottomIcons(context, 'assets/images/money-send.svg',
                  LocaleKeys.views_homeView_withdrawFunds.tr(), () {
                viewModel.push(const WithdrawFundRoute());
              }),
              const SizedBox(width: 10),
              bottomIcons(context, 'assets/icons/recovery-convert.svg',
                  LocaleKeys.views_homeView_internalTransfer.tr(), () {
                viewModel.push(const InternalTransferRoute());
              }),
              const SizedBox(width: 10),
              bottomIcons(context, 'assets/images/note-2.svg',
                  LocaleKeys.views_homeView_transactionHistory.tr(), () {
                viewModel.push(const TransactionsRoute());
              }),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 4),
          ),
          child: ListView(
            children: [
              // verticalSpaceSmall(context),
              Text(
                LocaleKeys.views_homeView_tradeFeatures.tr(),
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xff475467),
                ),
              ),
              verticalSpaceXSmall(context),
              SizedBox(
                // height: McGyver.rsDoubleH(context, 23),
                width: McGyver.rsDoubleW(context, 100),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    children: [
                      TradeFeatures(
                        onTap: () {
                          viewModel.push(const SocialTradingWelcome());
                        },
                        image: 'assets/images/trade.svg',
                        title: LocaleKeys.socialTrading.tr(),
                        subtitle: LocaleKeys
                            .views_homeView_TradeFeaturesSub_subtitle
                            .tr(),
                      ),
                      TradeFeatures(
                        onTap: () {
                          viewModel.push(const ForexNewsRoute());
                        },
                        image: 'assets/images/forex-news.svg',
                        title: LocaleKeys.forexNews.tr(),
                        subtitle: LocaleKeys
                            .views_homeView_TradeFeaturesSub_subtitle1
                            .tr(),
                      ),
                      TradeFeatures(
                        onTap: () {
                          // viewModel.push(ChartRoute(showBackButton: true));
                          viewModel.push(const LoyaltyRewardsRoute());
                        },
                        image: 'assets/images/loyalty-re.svg',
                        title: LocaleKeys
                            .views_loyaltyRewardsView_loyaltyRewards
                            .tr(),
                        subtitle: LocaleKeys
                            .views_homeView_TradeFeaturesSub_subtitle
                            .tr(),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpaceSmall(context),
              verticalSpaceXSmall(context),
              Text(
                LocaleKeys.views_homeView_tradingTools.tr(),
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xff475467),
                ),
              ),
              verticalSpaceXSmall(context),
              SizedBox(
                // height: McGyver.rsDoubleH(context, 16),
                width: McGyver.rsDoubleW(context, 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // scrollDirection: Axis.horizontal,
                  children: [
                    TradingTools(
                      image: 'assets/images/profit_calc.svg',
                      text: LocaleKeys.views_homeView_profitCalculator.tr(),
                      onTap: () {
                        viewModel.push(const ProfitCalculatorRoute());
                      },
                    ),
                    TradingTools(
                      image: 'assets/images/currency_conv.svg',
                      text: LocaleKeys.currencyConverter.tr(),
                      onTap: () {
                        viewModel.push(const CurrencyConverterRoute());
                      },
                    ),
                    TradingTools(
                      image: 'assets/images/pips_calc.svg',
                      text: LocaleKeys.pipsCalculator.tr(),
                      onTap: () {
                        viewModel.push(const PipCalculatorRoute());
                      },
                    ),
                    TradingTools(
                      image: 'assets/images/margin_calc.svg',
                      text: LocaleKeys.marginCalculator.tr(),
                      onTap: () {
                        viewModel.push(const MarginCalculatorRoute());
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.views_homeView_marketNews.tr(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 2),
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? const Color(0xff98A2B3)
                          : const Color(0xff475467),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        viewModel.push(const ForexNewsRoute());
                      },
                      child: Text(LocaleKeys.viewMore.tr()))
                ],
              ),
              verticalSpaceXSmall(context),
              SizedBox(
                // height: McGyver.rsDoubleH(context, 35),
                width: McGyver.rsDoubleW(context, 100),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          viewModel.push(const ForexNewsRoute());
                        },
                        child: const MarketNews()),
                    verticalSpaceSmall(context),
                    GestureDetector(
                        onTap: () {
                          viewModel.push(const ForexNewsRoute());
                        },
                        child: const MarketNews()),
                    verticalSpaceSmall(context),
                    GestureDetector(
                        onTap: () {
                          viewModel.push(const ForexNewsRoute());
                        },
                        child: const MarketNews()),
                  ],
                ),
              ),
              // SizedBox(
              //   height: McGyver.rsDoubleH(context, 35),
              //   width: McGyver.rsDoubleW(context, 100),
              //   child: ListView.separated(
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: 3,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //           onTap: () {
              //             viewModel.push(const ForexNewsRoute());
              //           },
              //           child: const MarketNews());
              //     },
              //     separatorBuilder: (BuildContext context, int index) {
              //       return verticalSpaceSmall(context);
              //     },
              //   ),
              // ),
              verticalSpaceSmall(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.views_homeView_priceSentiments.tr(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 2),
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? const Color(0xff98A2B3)
                          : const Color(0xff475467),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        viewModel.push(const PriceSentimentsRoute());
                      },
                      child: Text(LocaleKeys.viewMore.tr()))
                ],
              ),
              verticalSpaceXSmall(context),
              SizedBox(
                // height: McGyver.rsDoubleH(context, 19),
                width: McGyver.rsDoubleW(context, 100),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // viewModel.push(const PriceSentimentsRoute());
                        final m = PriceSentimentViewModel();
                        m.setSelectedPrice = 'AUDUSD';
                        viewModel.push(PriceSentimentDetails(model: m));
                      },
                      child: const PriceSentiments(
                        pair: 'AUDUSD',
                      ),
                    ),
                    verticalSpaceSmall(context),
                    GestureDetector(
                      onTap: () {
                        final m = PriceSentimentViewModel();
                        m.setSelectedPrice = 'AUDUSD';
                        viewModel.push(PriceSentimentDetails(model: m));
                      },
                      child: const PriceSentiments(
                        pair: 'AUDUSD',
                      ),
                    ),
                    verticalSpaceSmall(context),
                    GestureDetector(
                      onTap: () {
                        final m = PriceSentimentViewModel();
                        m.setSelectedPrice = 'AUDUSD';
                        viewModel.push(PriceSentimentDetails(model: m));
                      },
                      child: const PriceSentiments(
                        pair: 'AUDUSD',
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: McGyver.rsDoubleH(context, 19),
              //   width: McGyver.rsDoubleW(context, 100),
              //   child: ListView.separated(
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: 3,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //         onTap: () {
              //           viewModel.push(const PriceSentimentsRoute());
              //         },
              //         child: const PriceSentiments(
              //           pair: 'AUDUSD',
              //         ),
              //       );
              //     },
              //     separatorBuilder: (BuildContext context, int index) {
              //       return verticalSpaceSmall(context);
              //     },
              //   ),
              // ),
              verticalSpaceSmall(context),
              verticalSpaceXSmall(context),
              Text(
                LocaleKeys.rewards.tr(),
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xff475467),
                ),
              ),
              verticalSpaceSmall(context),
              Container(
                height: 230,
                width: McGyver.rsDoubleW(context, 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/rewardsb.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceXXSmall(context),
                      Text(
                        LocaleKeys.views_rewardsCard_earnPointsWhileTrading
                            .tr(),
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 2.4),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      verticalSpaceSmall(context),
                      Text(
                        LocaleKeys.views_rewardsCard_body.tr(),
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.7),
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      verticalSpaceXSmall(context),
                      Icon(
                        Utils.getTextDirection(context) == TextDirection.LTR
                            ? Icons.arrow_forward
                            : Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              //Color.fromARGB(255, 128, 117, 117)ctor(
              //   onTap: () {
              //     viewModel.push(const LoyaltyRewardsRoute());
              //   },
              //   child: Image.asset(
              //     'assets/images/rewards.png',
              //     width: double.infinity,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              verticalSpaceSmall(context),
              verticalSpaceXSmall(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.socialTrading.tr(),
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 2),
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? const Color(0xff98A2B3)
                          : const Color(0xff475467),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        viewModel.push(const SocialTradingDasboard());
                      },
                      child: Text(LocaleKeys.viewMore.tr()))
                ],
              ),
              SizedBox(
                  // height: McGyver.rsDoubleH(context, 55),
                  width: McGyver.rsDoubleW(context, 100),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            viewModel.push(MasterTraderOverview(
                                model: SocialTradingViewModel()));
                          },
                          child: const HigherSuccessRates()),
                      verticalSpaceXSmall(context),
                      GestureDetector(
                          onTap: () {
                            viewModel.push(MasterTraderOverview(
                                model: SocialTradingViewModel()));
                          },
                          child: const HigherSuccessRates()),
                      verticalSpaceXSmall(context),
                      GestureDetector(
                          onTap: () {
                            viewModel.push(MasterTraderOverview(
                                model: SocialTradingViewModel()));
                          },
                          child: const HigherSuccessRates()),
                    ],
                  )),
              // SizedBox(
              //   height: McGyver.rsDoubleH(context, 55),
              //   width: McGyver.rsDoubleW(context, 100),
              //   child: ListView.separated(
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: 3,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //           onTap: () {
              //             viewModel.push(MasterTraderOverview(
              //                 model: SocialTradingViewModel()));
              //           },
              //           child: const HigherSuccessRates());
              //     },
              //     separatorBuilder: (BuildContext context, int index) {
              //       return verticalSpaceXSmall(context);
              //     },
              //   ),
              // ),
              verticalSpaceSmall(context),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Provider Stats',
              //       style: CustomThemeData.generateStyle(
              //         fontSize: McGyver.textSize(context, 2),
              //         fontWeight: FontWeight.bold,
              //         color: isDarkMode
              //             ? const Color(0xff98A2B3)
              //             : const Color(0xff475467),
              //       ),
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         viewModel.push(const ProviderRoute());
              //       },
              //       child: const Text('View more'),
              //     )
              //   ],
              // ),
              // verticalSpaceXSmall(context),
              // Psummary(viewModel: ProviderViewModel()),
              // verticalSpaceXSmall(context),
              // verticalSpaceXSmall(context),
              // Psummary2(viewModel: ProviderViewModel()),
              // verticalSpaceSmall(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget returnAppBar(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Row(
      children: [
        const CircleAvatar(
          radius: 27,
          backgroundImage: AssetImage(
            'assets/images/Frame_346.png',
          ),
          backgroundColor: Colors.white,
        ),
        horizontalSpaceXSmall(context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.views_homeView_welcome,
              style: CustomThemeData.generateStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.white : Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ).tr(),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color:
                          isDarkMode ? Colors.black : const Color(0xff101828),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7.0, vertical: 3),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          child: SvgPicture.asset('assets/images/silver.svg'),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          LocaleKeys.sliver,
                          style: CustomThemeData.generateStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? Colors.white
                                  : const Color(0xffD0D5DD)),
                        ).tr()
                      ],
                    ),
                  ),
                ),
                horizontalSpaceXSmall(context),
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xff052844) : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 7),
                    child: Row(
                      children: [
                        Text(
                          isDemo.value == true
                              ? LocaleKeys.demo.capitalize()
                              : LocaleKeys.verifiedCap,
                          style: CustomThemeData.generateStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                        ).tr(),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.check_circle_outline_outlined,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.6),
                          size: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget sliverBody(BuildContext context, HomeViewModel model) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpaceSmall(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.views_homeView_walletBalance,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode
                      ? const Color(0xffD0D5DD)
                      : const Color(0xffD3ECFD),
                ),
              ).tr(),
              RichText(
                text: TextSpan(
                  text: LocaleKeys.marginWithP.tr(args: ['%', ':']),
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode
                        ? const Color(0xffD0D5DD)
                        : const Color(0xffD3ECFD),
                  ),
                  children: [
                    TextSpan(
                      text: '25000',
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.5),
                        color:
                            isDarkMode ? const Color(0xffD0D5DD) : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // verticalSpaceXSmall(context),
          Row(
            // mainAxisAlignment: MainAxisAlignment,
            children: [
              Text(
                model.showBalance == true ? "\$283,500" : "********",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 3.5),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? const Color(0xffD0D5DD) : Colors.white,
                ),
              ),
              IconButton(
                  onPressed: () {
                    model.setShowBalance();
                  },
                  icon: Icon(
                    model.showBalance == true
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                    color: isDarkMode
                        ? const Color(0xffD0D5DD)
                        : Colors.white.withOpacity(0.8),
                  )),
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: LocaleKeys.equity.tr(),
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    color: isDarkMode
                        ? const Color(0xffD0D5DD)
                        : const Color(0xffD3ECFD),
                  ),
                  children: [
                    TextSpan(
                      text: '25000',
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.5),
                        color:
                            isDarkMode ? const Color(0xffD0D5DD) : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomIcons(
      BuildContext context, String image, String text, void Function()? onTap) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDarkMode
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                )),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  color: isDarkMode ? const Color(0xff47B0F5) : Colors.white,
                ),
              ),
            ),
          ),
          verticalSpaceXSmall(context),
          Text(
            text,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(
                context,
                1.2,
              ),
              fontWeight: FontWeight.normal,
              color: isDarkMode ? const Color(0xffD0D5DD) : Colors.white,
            ),
          ),
          verticalSpaceSmall(context)
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
