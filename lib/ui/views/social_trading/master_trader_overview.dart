import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:meta_trader/ui/widgets/social_trading/overview.dart';
import 'package:meta_trader/ui/widgets/social_trading/trading_history.dart';

@RoutePage()
class MasterTraderOverview extends StatelessWidget {
  const MasterTraderOverview({super.key, required this.model});
  final SocialTradingViewModel model;

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: model.isBusy,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: isDarkMode
            ? const Color(0xff052844)
            : Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/btc.png',
              width: 35,
            ),
            horizontalSpaceXXSmall(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Satoshi Nakamoto',
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.8),
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber[300],
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber[300],
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber[300],
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber[300],
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber[300],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      bodyPadding: EdgeInsets.zero,
      // body: ContainedTabBarView(
      //   tabs: const [
      //     Text(
      //       'Overview',
      //     ),
      //     Text(
      //       'Trading History',
      //     ),
      //   ],
      //   tabBarProperties: TabBarProperties(
      //     background: Container(
      //       color:
      //           isDarkMode ? const Color(0xff073961) : const Color(0xffD3ECFD),
      //     ),
      //     height: 41.0,
      //     indicatorColor: Theme.of(context).primaryColor,
      //     // indicator: BoxDecoration(),
      //     indicatorWeight: 6.0,
      //     indicator: UnderlineTabIndicator(
      //       borderRadius: BorderRadius.circular(15),
      //       borderSide: BorderSide(
      //         width: 4.0,
      //         color: isDarkMode
      //             ? const Color(0xff0C95EF)
      //             : Theme.of(context).primaryColor,
      //       ),
      //       insets: const EdgeInsets.symmetric(horizontal: 40.0),
      //     ),
      //     labelStyle: CustomThemeData.generateStyle(
      //       fontSize: 13,
      //       color: isDarkMode ? Colors.black38 : Colors.black,
      //     ),
      //     labelColor: isDarkMode
      //         ? const Color(0xff0C95EF)
      //         : Theme.of(context).primaryColor,
      //     unselectedLabelColor: isDarkMode ? Colors.white70 : Colors.black,
      //   ),
      //   views: [
      //     TraderOverview(model: model),
      //     TradingHistory(model: model),
      //   ],
      //   onChange: (index) {
      //     if (index == 0) {
      //       model.setMasterTraderOverviewEnum =
      //           MasterTraderOverviewEnum.overview;
      //     }
      //     if (index == 1) {
      //       model.setMasterTraderOverviewEnum =
      //           MasterTraderOverviewEnum.tradingHistory;
      //     }
      //   },
      // ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: isDarkMode
                  ? const Color(0xff073961)
                  : const Color(0xffD3ECFD), // Container color
              child: TabBar(
                // isScrollable: true,
                tabs: const [
                  Tab(text: "Overview"),
                  Tab(text: "Trading History"),
                ],
                isScrollable: true,
                unselectedLabelColor: isDarkMode
                    ? const Color(0xff98A2B3)
                    : const Color(0xff344054),
                labelColor: isDarkMode
                    ? const Color(0xff77C5F8)
                    : const Color(0xff0C95EF),

                indicatorColor: isDarkMode
                    ? const Color(0xff77C5F8)
                    : const Color(0xff0C95EF),
                unselectedLabelStyle: CustomThemeData.generateColoredStyle(
                    fontSize: 14,
                    context: context,
                    fontWeight: FontWeight.w400,
                    darkTextColor: const Color(0xff98A2B3),
                    lightTextColor: const Color(0xff344054)),

                labelStyle: CustomThemeData.generateColoredStyle(
                    fontSize: 14,
                    context: context,
                    fontWeight: FontWeight.w600,
                    darkTextColor: const Color(0xff77C5F8),
                    lightTextColor: const Color(0xff0C95EF)),
                indicatorWeight: 3,

                // Tab indicator color
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TraderOverview(model: model),
                  TradingHistory(model: model),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
