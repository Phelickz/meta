import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view_model.dart';
import 'package:meta_trader/ui/widgets/quotes/components/market_details.dart';
import 'package:meta_trader/ui/widgets/quotes/components/trade_appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

class TradeDetailsScreen extends StackedView<QuotesViewModel> {
  const TradeDetailsScreen({super.key});

  @override
  Widget builder(
      BuildContext context, QuotesViewModel viewModel, Widget? child) {
    // TODO: implement builder
    return Skeleton(
        isBusy: viewModel.isBusy,
        appBar: tradeAppBars(context, true, "EURUSD", LocaleKeys.details.tr()),
        bodyPadding: EdgeInsets.symmetric(
            vertical: 16.pHeight(context), horizontal: 24.pWidth(context)),
        body: const SafeArea(
            child: SingleChildScrollView(
          child: MarketDetails(),
        )));
  }

  @override
  QuotesViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    return QuotesViewModel();
  }
}
