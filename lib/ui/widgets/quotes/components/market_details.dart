import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

class MarketDetails extends StatelessWidget {
  const MarketDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.euroVsGreatBritain,
          style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              color: isDarkMode
                  ? const Color(0xFF98A2B3)
                  : const Color(0xFF475467),
              fontWeight: FontWeight.bold),
        ).tr(),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.digits.tr(), "2"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.chart_specification_contractSize.tr(), "332"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.spread.tr(), "35"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(
            LocaleKeys.views_quotesView_quotesViewModel_stopLevel.tr(), "0"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(
            LocaleKeys.chart_specification_contractSize.tr(), "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.spread.tr(), "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.views_quotesView_quotesViewModel_stopLevel.tr(),
            "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(
            LocaleKeys.views_quotesView_quotesViewModel_marginCurrency.tr(),
            "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(
            LocaleKeys.views_quotesView_quotesViewModel_profitCurrency.tr(),
            "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.calculate.tr(), "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.views_quotesView_quotesViewModel_tickSize.tr(),
            "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.views_quotesView_quotesViewModel_tickValue.tr(),
            "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
      ],
    );
  }

  Widget viewTile(String title, String value) {
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
                color: const Color(0xFF98A2B3),
                fontWeight: FontWeight.w400),
          )
        ],
      );
    });
  }
}
