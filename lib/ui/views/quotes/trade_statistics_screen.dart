import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view_model.dart';
import 'package:meta_trader/ui/widgets/quotes/components/market_details.dart';
import 'package:meta_trader/ui/widgets/quotes/components/market_stats.dart';
import 'package:meta_trader/ui/widgets/quotes/components/trade_appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

class TradeStatisticsScreen extends StackedView<QuotesViewModel>{
  const TradeStatisticsScreen({super.key});

  @override
  Widget builder(BuildContext context, QuotesViewModel viewModel, Widget? child) {
    // TODO: implement builder
    return Skeleton(
      isBusy: viewModel.isBusy,
      appBar: tradeAppBars(context, true, "EURUSD", "Statistic"), 
      bodyPadding: EdgeInsets.symmetric(vertical: 16.pHeight(context), horizontal: 24.pWidth(context)),
      body: const SafeArea(child: SingleChildScrollView(
        child: MarketStats(),
      ))
      );
  }

  @override
  QuotesViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    return QuotesViewModel();
  }
  
}