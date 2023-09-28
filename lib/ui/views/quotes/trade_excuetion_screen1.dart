import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view_model.dart';
import 'package:meta_trader/ui/widgets/quotes/components/generic_trade_body.dart';
import 'package:meta_trader/ui/widgets/quotes/components/trade_appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import '../../../generated/locale_keys.g.dart';

class TradeExecutionScreen extends StackedView<QuotesViewModel> {
  const TradeExecutionScreen({super.key});

  @override
  Widget builder(
      BuildContext context, QuotesViewModel viewModel, Widget? child) {
    // var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
      isBusy: viewModel.isBusy,
      appBar: tradeAppBars(context, false, "EURUSD", LocaleKeys.euroVsUs),
      bodyPadding: EdgeInsets.zero,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // const TradeAppbarExtension(),
              SizedBox(
                height: 13.pHeight(context),
              ),
              const GenericTradeBody(),
              Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 8.pWidth(context),
                  ),
                  Expanded(
                    child: Text(
                      LocaleKeys.theTradeWill,
                      style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.0),
                          color: const Color(0xFF98A2B3),
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  QuotesViewModel viewModelBuilder(BuildContext context) {
    return QuotesViewModel();
  }
}
