import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/quotes/quotes_view_model.dart';
import 'package:meta_trader/ui/widgets/quotes/components/generic_trade_body.dart';
import 'package:meta_trader/ui/widgets/quotes/components/trade_appbar.dart';
import 'package:meta_trader/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

class TradeCloseScreen extends StackedView<QuotesViewModel> {
  const TradeCloseScreen({super.key});

  @override
  Widget builder(
      BuildContext context, QuotesViewModel viewModel, Widget? child) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Skeleton(
        isBusy: viewModel.isBusy,
        appBar:
            tradeAppBars(context, false, "EURUSD", LocaleKeys.euroVsUs.tr()),
        bodyPadding: EdgeInsets.zero,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const TradeAppbarExtension(),
                SizedBox(
                  height: 13.pHeight(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: McGyver.rsDoubleW(context, 5),
                  ),
                  child: const GenericTradeBody(),
                ),
                verticalSpaceSmall(context),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: McGyver.rsDoubleW(context, 5),
                  ),
                  child: Container(
                    // height: 50.pHeight(context),
                    decoration: BoxDecoration(
                        color: isDarkMode
                            ? const Color(0xFF073961)
                            : const Color(0xFF1570EF),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(
                        horizontal: 6.pWidth(context),
                        vertical: 10.pHeight(context)),
                    width: double.infinity,
                    // color: isDarkMode ? const Color(0xFF073961) : const Color(0xFF1570EF),
                    child: Text(
                      LocaleKeys.views_quotesView_tradeCloseScreen_closeBuy,
                      style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.4),
                          color: isDarkMode
                              ? const Color(0xFFD0D5DD)
                              : const Color(0xFFF2F4F7),
                          fontWeight: FontWeight.w400),
                    ).tr(),
                  ),
                ),
                SizedBox(
                  height: 20.pHeight(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: McGyver.rsDoubleW(context, 5),
                  ),
                  child: Row(
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
                        ).tr(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  QuotesViewModel viewModelBuilder(BuildContext context) {
    return QuotesViewModel();
  }
}
