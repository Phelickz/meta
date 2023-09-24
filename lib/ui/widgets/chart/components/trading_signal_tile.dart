import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

class TraadingSignalTile extends StatelessWidget {
  final Widget leadingIcon;
  final Color leadingBgColor;
  const TraadingSignalTile(
      {super.key, required this.leadingIcon, required this.leadingBgColor});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: McGyver.rsDoubleH(context, 0.7),
        top: McGyver.rsDoubleH(context, 0.7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: leadingBgColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: leadingIcon,
              ),
              horizontalSpaceXSmall(context),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        LocaleKeys.chart_tradingSignalTiles_intraday.tr(),
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.8),
                          color: isDarkMode
                              ? const Color(0xFFD0D5DD)
                              : const Color(0xFF667085),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                LocaleKeys.chart_tradingSignalTiles_timeText.tr(),
                textAlign: TextAlign.right,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.6),
                  color: const Color(0xFF98A2B3),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          verticalSpaceXXSmall(context),
          Text(
            "${LocaleKeys.chart_tradingSignalTiles_miamiCryptoText.tr()}\n${LocaleKeys.chart_tradingSignalTiles_miamiCryptoTextContinue.tr()}",
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              color: isDarkMode
                  ? const Color(0xFFD0D5DD)
                  : const Color(0xFF98A2B3),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
