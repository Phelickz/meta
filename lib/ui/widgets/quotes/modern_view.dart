import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/ui/widgets/quotes/components/modern_view_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../views/quotes/quotes_view_model.dart';

class ModernMarketView extends StatelessWidget {
  final QuotesViewModel model;

  const ModernMarketView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 12.pHeight(context),
            );
          },
          itemCount: model.quoteList.length,
          itemBuilder: (context, index) {
            final quotes = model.quoteList[index];
            return ModernViewTile(
                spread: quotes["spread"],
                currencyPair: quotes["currencyPair"],
                percentageChange: quotes["percentageChange"],
                bidPrice: quotes["low"],
                currencyIcon: quotes["currencyIcon"],
                trend: quotes["trend"],
                currencyPairFull: quotes["currencyPairFull"]);
          }),
    );
  }
}
