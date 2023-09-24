import 'package:auto_route/auto_route.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/forex_news/forex_news_view_model.dart';
import 'package:meta_trader/ui/widgets/forex_news/all.dart';
import 'package:meta_trader/ui/widgets/forex_news/cryptocurrency.dart';
import 'package:meta_trader/ui/widgets/forex_news/currency_pairs.dart';
import 'package:meta_trader/ui/widgets/forex_news/detail.dart';
import 'package:meta_trader/ui/widgets/forex_news/metals.dart';
import 'package:meta_trader/ui/widgets/forex_news/search.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../app/responsiveness/res.dart';

@RoutePage()
class ForexNewsView extends StackedView<ForexNewsViewModel> {
  const ForexNewsView({super.key});

  @override
  // A builder function that gives us a ViewModel
  Widget builder(
    BuildContext context,
    ForexNewsViewModel viewModel,
    Widget? child,
  ) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      appBar: viewModel.returnAppbar(context),
      bodyPadding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleW(context, 0),
      ),
      body: viewModel.forexNewsViewEnum == ForexNewsViewEnum.search
          ? Search(model: viewModel)
          : viewModel.forexNewsViewEnum == ForexNewsViewEnum.details
              ? DetailNews(model: viewModel)
              : ContainedTabBarView(
                  tabs: [
                    Text(
                      LocaleKeys.views_forexNews_forexModel_all.tr(),
                      style: CustomThemeData.generateStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white54 : Colors.black,
                      ),
                    ),
                    Text(
                      LocaleKeys.currencyPair.tr(),
                      style: CustomThemeData.generateStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white54 : Colors.black,
                      ),
                    ),
                    Text(
                      LocaleKeys.metals.tr(),
                      style: CustomThemeData.generateStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white54 : Colors.black,
                      ),
                    ),
                    Text(
                      LocaleKeys.views_forexNews_forexModel_cryptoCurrency.tr(),
                      style: CustomThemeData.generateStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white54 : Colors.black,
                      ),
                    ),
                  ],
                  tabBarProperties: TabBarProperties(
                    background: Container(
                      color: isDarkMode
                          ? const Color(0xff073961)
                          : const Color(0xffD3ECFD),
                    ),
                    height: 41.0,
                    indicatorColor: Theme.of(context).primaryColor,
                    // indicator: BoxDecoration(),
                    indicatorWeight: 6.0,
                    indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 2.0,
                        color: isDarkMode
                            ? const Color(0xff0C95EF)
                            : Theme.of(context).primaryColor,
                      ),
                      insets: const EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    labelStyle: CustomThemeData.generateStyle(
                      fontSize: 13,
                      color: isDarkMode ? Colors.black38 : Colors.black,
                    ),
                    labelColor: isDarkMode
                        ? const Color(0xff0C95EF)
                        : Theme.of(context).primaryColor,
                    unselectedLabelColor:
                        isDarkMode ? Colors.white70 : Colors.black,
                  ),
                  views: [
                    ForexNewsAll(
                      model: viewModel,
                    ),
                    CurrencyPairs(model: viewModel),
                    Metals(model: viewModel),
                    CryptoCurrency(model: viewModel),
                  ],
                  onChange: (index) {
                    if (index == 0) {
                      viewModel.setForexNewsViewEnum = ForexNewsViewEnum.all;
                    }
                    if (index == 1) {
                      viewModel.setForexNewsViewEnum =
                          ForexNewsViewEnum.currencyPairs;
                    }
                    if (index == 2) {
                      viewModel.setForexNewsViewEnum = ForexNewsViewEnum.metals;
                    }
                    if (index == 3) {
                      viewModel.setForexNewsViewEnum =
                          ForexNewsViewEnum.cryptoCurrency;
                    }
                  },
                ),
    );
  }

  @override
  ForexNewsViewModel viewModelBuilder(BuildContext context) =>
      ForexNewsViewModel();
}
