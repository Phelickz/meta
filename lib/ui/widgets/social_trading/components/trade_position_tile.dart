import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_trader/app/utils/capitalize.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';
import '../../../../app/responsiveness/res.dart';
import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';

class TradePositionTile extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  final TradeType tradeType;
  final PositionType positionType;
  const TradePositionTile(
      {super.key,
      required this.tradeType,
      required this.viewModel,
      required this.positionType});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    Color bgColor = tradeType == TradeType.buy
        ? Theme.of(context).primaryColor
        : const Color(0xFfF97066);
    Color txtColor = tradeType == TradeType.buy
        ? isDarkMode
            ? const Color(0xFF77C5F8)
            : const Color(0xFF20A0F3)
        : const Color(0xFFF97066);

    String typeText =
        tradeType == TradeType.buy ? LocaleKeys.buy.tr() : LocaleKeys.sell.tr();
    String typeSign = tradeType == TradeType.buy ? "" : "-";
    return Container(
      margin: EdgeInsets.only(
        bottom: McGyver.rsDoubleH(context, 1.5),
      ),
      padding: EdgeInsets.symmetric(
        vertical: McGyver.rsDoubleH(context, 0.5),
        horizontal: McGyver.rsDoubleW(context, 6),
      ),
      child: InkWell(
        onLongPress: () {
          // showTradeModal(context);
        },
        onTap: () {
          // viewModel.tradePageEnum = TradePageEnum.modifyTrade;
        },
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
                  "${typeSign}234.56",
                  textAlign: TextAlign.end,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.9),
                    fontWeight: FontWeight.w500,
                    color: txtColor,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: McGyver.rsDoubleH(context, 1.8),
                      width: McGyver.rsDoubleH(context, 1.8),
                      child: SvgPicture.asset(
                        "assets/images/calendar_2.svg",
                        colorFilter: ColorFilter.mode(
                          isDarkMode
                              ? const Color(0xff98A2B3)
                              : const Color(0xFF667085),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      positionType.name.capitalize(),
                      textAlign: TextAlign.end,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.4),
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF98A2B3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
