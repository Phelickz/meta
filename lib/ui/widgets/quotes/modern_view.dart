import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/quotes/components/modern_view_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../views/quotes/quotes_view_model.dart';

class ModernMarketView extends StatelessWidget {
  final QuotesViewModel model;

  const ModernMarketView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return ContainedTabBarView(
      tabs: const [
        Text(
          'Popular',
        ),
        Text(
          'Top Movers',
        ),
        Text(
          'Major',
        ),
        Text(
          'Metals',
        ),
        Text(
          'Crypto',
        ),
      ],
      tabBarProperties: TabBarProperties(
        background: Container(
          color: isDarkMode ? const Color(0xff073961) : const Color(0xffD3ECFD),
        ),
        height: 41.0,
        indicatorColor: Theme.of(context).primaryColor,
        // indicator: BoxDecoration(),
        indicatorWeight: 6.0,
        indicator: UnderlineTabIndicator(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 5.0,
            color: isDarkMode
                ? const Color(0xff0C95EF)
                : Theme.of(context).primaryColor,
          ),
          insets: const EdgeInsets.symmetric(horizontal: 20.0),
        ),
        labelStyle: CustomThemeData.generateStyle(
          fontSize: 13,
          color: isDarkMode ? Colors.black38 : Colors.black,
        ),
        labelColor: isDarkMode
            ? const Color(0xff0C95EF)
            : Theme.of(context).primaryColor,
        unselectedLabelColor: isDarkMode ? Colors.white70 : Colors.black,
      ),
      views: [
        TabViewMarkets(
          model: model,
        ),
        TabViewMarkets(
          model: model,
        ),
        TabViewMarkets(
          model: model,
        ),
        TabViewMarkets(
          model: model,
        ),
        TabViewMarkets(
          model: model,
        )
      ],
      onChange: (index) {
        if (index == 0) {
          // viewModel.setForexNewsViewEnum = ForexNewsViewEnum.all;
        }
        if (index == 1) {
          // viewModel.setForexNewsViewEnum = ForexNewsViewEnum.currencyPairs;
        }
        if (index == 2) {
          // viewModel.setForexNewsViewEnum = ForexNewsViewEnum.metals;
        }
        if (index == 3) {
          // viewModel.setForexNewsViewEnum = ForexNewsViewEnum.cryptoCurrency;
        }
      },
    );
  }
}

class TabViewMarkets extends StatelessWidget {
  const TabViewMarkets({super.key, required this.model});
  final QuotesViewModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 6),
        vertical: 10,
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return verticalSpaceSmall(context);
        },
        itemCount: model.quoteList.length,
        itemBuilder: (context, index) {
          final quotes = model.quoteList[index];
          return InkWell(
            onTap: () {
              model.openOptionsBottomSheet(context);
            },
            child: ModernViewTile(
              spread: quotes["spread"],
              currencyPair: quotes["currencyPair"],
              percentageChange: quotes["percentageChange"],
              bidPrice: quotes["low"],
              currencyIcon: quotes["currencyIcon"],
              trend: quotes["trend"],
              currencyPairFull: quotes["currencyPairFull"],
            ),
          );
        },
      ),
    );
  }
}
