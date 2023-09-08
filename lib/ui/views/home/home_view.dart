// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/router/router.gr.dart';
import 'package:meta_trader/app/utils/theme.dart';
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
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.headset_outlined,
              size: 30,
            ),
            color: isDarkMode ? Colors.white54 : Colors.white,
          ),
          IconButton(
            onPressed: () {
              viewModel.push(const NotificationRoute());
            },
            icon: const Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
            color: isDarkMode ? Colors.white54 : Colors.white,
          )
        ],
        appBarCenterTitle: false,
        appBarTitle: returnAppBar(context),
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
          children: [sliverBody(context)],
        ),
        bottomWidgetHeight: McGyver.rsDoubleH(context, 14),
        bottomWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bottomIcons(
                context, 'assets/images/money-recive.svg', 'Deposit Funds', () {
              viewModel.push(const FundAccountRoute());
            }),
            const SizedBox(width: 10),
            bottomIcons(
                context, 'assets/images/money-send.svg', 'Withdraw Funds', () {
              viewModel.push(const WithdrawFundRoute());
            }),
            const SizedBox(width: 10),
            bottomIcons(context, 'assets/images/gift.svg', 'Loyalty Rewards',
                () {
              viewModel.push(const LoyaltyRewardsRoute());
            }),
            const SizedBox(width: 10),
            bottomIcons(
                context, 'assets/images/note-2.svg', 'Transaction History', () {
              viewModel.push(const TransactionsRoute());
            }),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: McGyver.rsDoubleW(context, 6),
          ),
          child: ListView(
            children: [
              Text(
                'Trade Features',
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
                height: McGyver.rsDoubleH(context, 20),
                width: McGyver.rsDoubleW(context, 100),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TradeFeatures(
                      onTap: () {
                        viewModel.push(const SocialTradingWelcome());
                      },
                      image: 'assets/images/trade.svg',
                      title: 'Social Trading',
                      subtitle: 'Copy and earn with experienced traders',
                    ),
                    TradeFeatures(
                      onTap: () {
                        viewModel.push(const ForexNewsRoute());
                      },
                      image: 'assets/images/trade.svg',
                      title: 'Forex News',
                      subtitle: 'Stay up to date with forex news',
                    ),
                    TradeFeatures(
                      onTap: () {
                        viewModel.push(ChartRoute(showBackButton: true));
                      },
                      image: 'assets/images/trade.svg',
                      title: 'Chart Analysis',
                      subtitle: 'Copy and earn with experienced traders',
                    ),
                  ],
                ),
              ),
              verticalSpaceSmall(context),
              verticalSpaceXSmall(context),
              Text(
                'Trading Tools',
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
                height: McGyver.rsDoubleH(context, 16),
                width: McGyver.rsDoubleW(context, 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // scrollDirection: Axis.horizontal,
                  children: [
                    TradingTools(
                      image: 'assets/images/trade.svg',
                      text: 'Profit calculator',
                      onTap: () {
                        viewModel.push(const ProfitCalculatorRoute());
                      },
                    ),
                    TradingTools(
                      image: 'assets/images/trade.svg',
                      text: 'Currency converter',
                      onTap: () {
                        viewModel.push(const CurrencyConverterRoute());
                      },
                    ),
                    TradingTools(
                      image: 'assets/images/trade.svg',
                      text: 'Pips calculator',
                      onTap: () {
                        viewModel.push(const PipCalculatorRoute());
                      },
                    ),
                    TradingTools(
                      image: 'assets/images/trade.svg',
                      text: 'Margin calculator',
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
                    'Market News',
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
                      child: const Text('View more'))
                ],
              ),
              verticalSpaceXSmall(context),
              SizedBox(
                height: McGyver.rsDoubleH(context, 35),
                width: McGyver.rsDoubleW(context, 100),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const MarketNews();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return verticalSpaceSmall(context);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price Sentiments',
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
                      child: const Text('View more'))
                ],
              ),
              SizedBox(
                height: McGyver.rsDoubleH(context, 19),
                width: McGyver.rsDoubleW(context, 100),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const PriceSentiments(
                      pair: 'AUDUSD',
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return verticalSpaceSmall(context);
                  },
                ),
              ),
              Text(
                'Rewards',
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xff475467),
                ),
              ),
              verticalSpaceXSmall(context),
              Image.asset(
                'assets/images/reward.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              verticalSpaceSmall(context),
              verticalSpaceXSmall(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Social Trading',
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
                      child: const Text('View more'))
                ],
              ),
              SizedBox(
                height: McGyver.rsDoubleH(context, 55),
                width: McGyver.rsDoubleW(context, 100),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const HigherSuccessRates();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return verticalSpaceXSmall(context);
                  },
                ),
              ),
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
            'assets/images/avi.png',
          ),
          backgroundColor: Colors.white,
        ),
        horizontalSpaceXSmall(context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, Susan",
              style: CustomThemeData.generateStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.white : Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
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
                          'Silver',
                          style: CustomThemeData.generateStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? Colors.white
                                  : const Color(0xffD0D5DD)),
                        )
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
                          'VERIFIED',
                          style: CustomThemeData.generateStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
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

  Widget sliverBody(BuildContext context) {
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
                'Wallet balance',
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  color: isDarkMode
                      ? const Color(0xffD0D5DD)
                      : const Color(0xffD3ECFD),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Margin (%): ',
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
                "\$283,500",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 3.5),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? const Color(0xffD0D5DD) : Colors.white,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: isDarkMode
                        ? const Color(0xffD0D5DD)
                        : Colors.white.withOpacity(0.8),
                  )),
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: 'Equity: ',
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
