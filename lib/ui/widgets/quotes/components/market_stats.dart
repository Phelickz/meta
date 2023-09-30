import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

class MarketStats extends StatelessWidget {
  const MarketStats({super.key});

  @override
  Widget build(BuildContext context) {
    // var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        viewTile(
            LocaleKeys.quotesWidget_components_marketStats_initialMargin.tr(),
            "2",
            false),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.bid.tr(), "3.1", true),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.quotesWidget_components_marketStats_bigHigh.tr(),
            "4.55", true),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.quotesWidget_components_marketStats_bigLow.tr(),
            "0", false),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.ask.tr(), "1.4", false),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.quotesWidget_components_marketStats_askHigh.tr(),
            "1.33", false),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.quotesWidget_components_marketStats_askLow.tr(),
            "0.3", true),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(
            LocaleKeys.quotesWidget_components_marketStats_priceChange.tr(),
            "0.3",
            true),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.views_priceCalculatorView_openingPrice.tr(), "2.1",
            false),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.quotesWidget_components_marketStats_closePrice.tr(),
            "2.3", true),
      ],
    );
  }

  Widget viewTile(String title, String value, bool isRed) {
    return Builder(builder: (context) {
      var isDarkMode = CustomThemeData.isDarkMode(context);
      return Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  color: isDarkMode ? Colors.white : const Color(0xFF667085),
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(
            value,
            style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.4),
                color:
                    isRed ? const Color(0xFFF04438) : const Color(0xFF20A0F3),
                fontWeight: FontWeight.w400),
          )
        ],
      );
    });
  }
}
