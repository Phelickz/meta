import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/trade_history/trade_history_view_model.dart';

class TradeOrderTile extends StatelessWidget {
  final TradeType tradeType;
  const TradeOrderTile({super.key, required this.tradeType});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    Color bgColor = tradeType == TradeType.buy
        ? Theme.of(context).primaryColor
        : const Color(0xFfF97066);

    String typeText =
        tradeType == TradeType.buy ? LocaleKeys.buy : LocaleKeys.sell;
    return Container(
      margin: EdgeInsets.only(
        bottom: McGyver.rsDoubleH(context, 1.5),
      ),
      padding: EdgeInsets.symmetric(
        vertical: McGyver.rsDoubleH(context, 0.5),
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "AUDJPY",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.9),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF667085),
                      ),
                    ),
                    horizontalSpaceXSmall(context),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: McGyver.rsDoubleW(context, 2),
                        vertical: McGyver.rsDoubleH(context, 0.4),
                      ),
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(
                            McGyver.rsDoubleH(context, 1),
                          )),
                      child: Text(
                        "$typeText 10",
                        style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.3),
                            fontWeight: FontWeight.bold,
                            color: isDarkMode
                                ? const Color(0xFFFCFCFD)
                                : const Color(0xFFFAFDFF)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 0.8),
                ),
                Row(
                  children: [
                    Text(
                      "4.51234",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.4),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF98A2B3),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: McGyver.rsDoubleH(context, 2),
                      color: const Color(0xFF98A2B3),
                    ),
                    Text(
                      "4.51234",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.4),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF98A2B3),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          horizontalSpaceMedium(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "19.3.2023 13:16:44",
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.4),
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF98A2B3),
                ),
              ),
              Text(
                LocaleKeys.filled,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 1.9),
                  fontWeight: FontWeight.w500,
                  color: isDarkMode
                      ? const Color(0xFF98A2B3)
                      : const Color(0xFF667085),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
