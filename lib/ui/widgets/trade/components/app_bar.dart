import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/ui/views/trade/trade_view_model.dart';

import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/widgets/trade/components/filter_modal.dart';

import '../../../../app/responsiveness/res.dart';

AppBar tradeAppBar(
    BuildContext context, String title, String subtitle, TradeViewModel model,
    [String assetName = '']) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  String typeSign = model.isBuy ? "" : "-";
  return AppBar(
    elevation: 0,
    backgroundColor: isDarkMode
        ? Theme.of(context).scaffoldBackgroundColor
        : model.tradePageEnum == TradePageEnum.trade
            ? const Color(0xFFD3ECFD)
            : Theme.of(context).scaffoldBackgroundColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ? const Color(0xffD2D2D2) : const Color(0xFF667085),
        ),
        onPressed: () {
          if (model.tradePageEnum == TradePageEnum.trade) {
            model.goBack();
          }
          if (model.tradePageEnum == TradePageEnum.modifyTrade) {
            model.tradePageEnum = TradePageEnum.trade;
          }
        }),
    centerTitle: true,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.isEmpty ? '- -' : "$typeSign$title",
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 2),
            fontWeight: FontWeight.bold,
            color: model.isBuy
                ? Theme.of(context).primaryColor
                : isDarkMode
                    ? const Color(0xFFF97066)
                    : const Color(0xFFF04438),
          ),
        ),
        if (subtitle != '')
          Text(
            subtitle,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.6),
              fontWeight: FontWeight.w500,
              color: isDarkMode
                  ? const Color(0xFF667085)
                  : const Color(0xFF667085),
            ),
          ),
      ],
    ),
    actions: [
      if (assetName != "")
        IconButton(
          onPressed: () {
            showFilterModal(context);
          },
          icon: SizedBox(
            height: McGyver.rsDoubleH(context, 2.8),
            width: McGyver.rsDoubleH(context, 2.8),
            child: SvgPicture.asset(
              assetName,
              colorFilter: ColorFilter.mode(
                isDarkMode ? const Color(0xff98A2B3) : const Color(0xFF667085),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
    ],
  );
}

void showFilterModal(BuildContext context) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  showModalBottomSheet(
      backgroundColor:
          isDarkMode ? const Color(0xFF0C2031) : const Color(0xFFFAFDFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(McGyver.rsDoubleH(context, 2)),
          topRight: Radius.circular(McGyver.rsDoubleH(context, 2)),
        ),
      ),
      context: context,
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      builder: (context) {
        return const FilterModal();
      });
}
