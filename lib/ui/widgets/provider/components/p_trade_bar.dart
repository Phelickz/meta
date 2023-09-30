import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

class PTradeBar extends StatelessWidget {
  final Map<String, dynamic> tradeInfo;
  final bool showExpandedPositionView;
  const PTradeBar(
      {super.key,
      required this.tradeInfo,
      required this.showExpandedPositionView});

  @override
  Widget build(BuildContext context) {
    var isDark = CustomThemeData.isDarkMode(context);
    return Container(
      // height: 70.pHeight(context),
      padding: EdgeInsets.symmetric(
          horizontal: 12.pHeight(context), vertical: 12.pWidth(context)),
      margin: EdgeInsets.symmetric(vertical: 12.pHeight(context)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:
              isDark ? ColorManager.darkHeaderColor : const Color(0xFFFAFDFF),
          border: Border.all(
              color: isDark ? Colors.transparent : const Color(0xFFE4E7EC))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                tradeInfo["trade"],
                style: CustomThemeData.generateColoredStyle(
                    context: context,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 8.pWidth(context),
              ),
              quickContainer(context),
              const Spacer(),
              Text(
                tradeInfo["amount"],
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 16,
                    context: context,
                    fontWeight: FontWeight.w400,
                    darkTextColor: tradeInfo["sell"]
                        ? const Color(0xFF20A0F3)
                        : const Color(0xFFF04438),
                    lightTextColor: tradeInfo["sell"]
                        ? const Color(0xFF20A0F3)
                        : const Color(0xFFF04438)),
              )
            ],
          ),
          SizedBox(
            height: 10.pHeight(context),
          ),
          Row(
            children: [
              Text(
                tradeInfo["from"],
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w400,
                    lightTextColor: const Color(0xFF98A2B3),
                    darkTextColor: const Color(0xFF98A2B3)),
              ),
              SizedBox(
                width: 4.pWidth(context),
              ),
              const Icon(
                Icons.arrow_forward,
                size: 16,
                color: Color(0xFF98A2B3),
              ),
              SizedBox(
                width: 4.pWidth(context),
              ),
              Text(
                tradeInfo["to"],
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w400,
                    lightTextColor: const Color(0xFF98A2B3),
                    darkTextColor: const Color(0xFF98A2B3)),
              ),
              SizedBox(
                width: 4.pWidth(context),
              ),
              const Spacer(),
              const Icon(Icons.calendar_today_outlined,
                  size: 16, color: Color(0xFF98A2B3)),
              SizedBox(
                width: 4.pWidth(context),
              ),
              Text(
                tradeInfo["available"],
                style: CustomThemeData.generateColoredStyle(
                    fontSize: 12,
                    context: context,
                    fontWeight: FontWeight.w400,
                    lightTextColor: const Color(0xFF98A2B3),
                    darkTextColor: const Color(0xFF98A2B3)),
              ),
            ],
          ),
          showExpandedPositionView
              ? Container(child: expandedInfoContainer(context))
              : const SizedBox()
        ],
      ),
    );
  }

  Widget quickContainer(BuildContext context) {
    return Container(
      width: 50.pWidth(context),
      height: 20.pHeight(context),
      padding: EdgeInsets.symmetric(
          horizontal: 6.pWidth(context), vertical: 2.pHeight(context)),
      decoration: BoxDecoration(
          color: tradeInfo["sell"] ? Colors.red : const Color(0xFF20A0F3),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tradeInfo["sell"] ? "Sell" : "Buy",
            style: CustomThemeData.generateColoredStyle(
                fontSize: 12,
                context: context,
                fontWeight: FontWeight.bold,
                lightTextColor: const Color(0xFFFAFDFF),
                darkTextColor: const Color(0xFFFAFDFF)),
          ),
          const Spacer(),
          Text(
            tradeInfo["quantity"],
            style: CustomThemeData.generateColoredStyle(
                fontSize: 12,
                context: context,
                fontWeight: FontWeight.bold,
                lightTextColor: const Color(0xFFFAFDFF),
                darkTextColor: const Color(0xFFFAFDFF)),
          ),
        ],
      ),
    );
  }

  Widget expandedInfoContainer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 12.pHeight(context),
        ),
        const Divider(),
        SizedBox(
          height: 12.pHeight(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.providerWidget_providerComponent_pTradeBar_dateW,
              style: CustomThemeData.generateColoredStyle(
                  fontSize: 12,
                  context: context,
                  fontWeight: FontWeight.w400,
                  lightTextColor: const Color(0xFF667085),
                  darkTextColor: const Color(0xFF98A2B3)),
            ).tr(),
            const Spacer(),
            Text(
              tradeInfo["date"],
              style: CustomThemeData.generateColoredStyle(
                fontSize: 12,
                context: context,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        SizedBox(
          height: 8.pHeight(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.providerWidget_providerComponent_pTradeBar_orderId,
              style: CustomThemeData.generateColoredStyle(
                  fontSize: 12,
                  context: context,
                  fontWeight: FontWeight.w400,
                  lightTextColor: const Color(0xFF667085),
                  darkTextColor: const Color(0xFF98A2B3)),
            ).tr(),
            const Spacer(),
            Text(
              tradeInfo["orderID"],
              style: CustomThemeData.generateColoredStyle(
                fontSize: 12,
                context: context,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        SizedBox(
          height: 8.pHeight(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys
                  .providerWidget_providerComponent_pTradeBar_followersCommission,
              style: CustomThemeData.generateColoredStyle(
                  fontSize: 12,
                  context: context,
                  fontWeight: FontWeight.w400,
                  lightTextColor: const Color(0xFF667085),
                  darkTextColor: const Color(0xFF98A2B3)),
            ).tr(),
            const Spacer(),
            Text(
              tradeInfo["commission"],
              style: CustomThemeData.generateColoredStyle(
                fontSize: 12,
                context: context,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ],
    );
  }
}
