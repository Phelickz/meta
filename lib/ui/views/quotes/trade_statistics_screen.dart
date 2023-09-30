import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view_model.dart';
import 'package:meta_trader/ui/widgets/quotes/components/market_stats.dart';
import 'package:meta_trader/ui/widgets/quotes/components/trade_appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../generated/locale_keys.g.dart';

class TradeStatisticsScreen extends StackedView<QuotesViewModel> {
  const TradeStatisticsScreen({super.key});

  @override
  Widget builder(
      BuildContext context, QuotesViewModel viewModel, Widget? child) {
    // TODO: implement builder
    return Skeleton(
        isBusy: viewModel.isBusy,
        appBar:
            tradeAppBars(context, true, "EURUSD", LocaleKeys.statistics.tr()),
        bodyPadding: EdgeInsets.symmetric(
            vertical: 16.pHeight(context), horizontal: 24.pWidth(context)),
        body: const SafeArea(
            child: SingleChildScrollView(
          child: MarketStats(),
        )));
  }

  @override
  QuotesViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    return QuotesViewModel();
  }
}
