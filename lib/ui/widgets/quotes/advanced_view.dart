import 'package:flutter/material.dart';
import 'package:meta_trader/ui/widgets/quotes/components/advance_view_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../views/quotes/quotes_view_model.dart';

class AdvancedMarketView extends StatelessWidget {
  final QuotesViewModel model;

  const AdvancedMarketView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: ListView.builder(
          itemCount: model.quoteList.length,
          itemBuilder: (context, index) {
            final quote = model.quoteList[index];
            return InkWell(
              onTap: () {
                model.openOptionsBottomSheet(context);
              },
              child: AdvancedViewTile(
                time: quote["time"],
                askingPricePrimary: quote["askingPricePrimary"],
                askingPriceSecondary: quote["askingPriceSecondary"],
                currencyPair: quote["currencyPair"],
                high: quote["high"],
                low: quote["low"],
                pairId: quote["pairId"],
                percentageChange: quote["percentageChange"],
                sellingPricePrimary: quote["sellingPricePrimary"],
                sellingPriceSecondary: quote["sellingPriceSecondary"],
                askingPips: quote["askingPips"],
                sellingPips: quote["sellingPips"],
                trend: quote["trend"],
                spread: quote["spread"],
                isFav: model.isFav,
              ),
            );
          }),
    );
  }
}
