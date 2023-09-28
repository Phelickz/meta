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
        ),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.digits, "2"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.chart_specification_contractSize, "332"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.spread, "35"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.views_quotesView_quotesViewModel_stopLevel, "0"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.chart_specification_contractSize, "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.spread, "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.views_quotesView_quotesViewModel_stopLevel,
            "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.views_quotesView_quotesViewModel_marginCurrency,
            "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.views_quotesView_quotesViewModel_profitCurrency,
            "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.calculate, "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(
            LocaleKeys.views_quotesView_quotesViewModel_tickSize, "1211122212"),
        SizedBox(
          height: 20.pHeight(context),
        ),
        viewTile(LocaleKeys.views_quotesView_quotesViewModel_tickValue,
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
