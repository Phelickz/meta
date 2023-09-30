import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/quotes/components/simple_view_tile.dart';

import '../../../app/responsiveness/res.dart';
import '../../views/quotes/quotes_view_model.dart';

class SimpleMarketView extends StatelessWidget {
  final QuotesViewModel model;

  const SimpleMarketView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 6)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpaceSmall(context),
          Row(
            children: [
              SizedBox(
                width: 115.pWidth(context),
                child: Text(
                  LocaleKeys.symbol,
                  style: CustomThemeData.generateColoredStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    fontWeight: FontWeight.bold,
                    context: context,
                  ),
                ).tr(),
              ),
              SizedBox(
                width: 14.pWidth(context),
              ),
              Text(
                LocaleKeys.bid,
                style: CustomThemeData.generateColoredStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  fontWeight: FontWeight.bold,
                  context: context,
                ),
              ).tr(),
              SizedBox(
                width: 44.pWidth(context),
              ),
              Text(
                LocaleKeys.ask,
                style: CustomThemeData.generateColoredStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    fontWeight: FontWeight.bold,
                    context: context),
              ).tr(),
              SizedBox(
                width: 34.pWidth(context),
              ),
              Text(
                LocaleKeys.spread,
                style: CustomThemeData.generateColoredStyle(
                  fontSize: McGyver.textSize(context, 1.5),
                  fontWeight: FontWeight.bold,
                  context: context,
                ),
              ).tr(),
            ],
          ),
          SizedBox(
            height: 10.pHeight(context),
          ),
          verticalSpaceSmall(context),
          Expanded(
            child: ListView.separated(
              itemCount: model.quoteList.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 24.pHeight(context));
              },
              itemBuilder: (context, index) {
                final quote = model.quoteList[index];
                return InkWell(
                  onTap: () {
                    model.openOptionsBottomSheet(context);
                  },
                  child: SimpleViewTile(
                    currencyPair: quote["currencyPair"],
                    high: quote["high"],
                    low: quote["low"],
                    spread: quote["spread"],
                    isFav: model.isFav,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
