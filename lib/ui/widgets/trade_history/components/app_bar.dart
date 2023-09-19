import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/ui/views/trade_history/trade_history_view_model.dart';

import '../../../../app/utils/theme.dart';
import 'filter_modal.dart';

AppBar tradeHistoryAppBar(BuildContext context, String title, String subtitle,
    TradeHistoryViewModel model,
    [String assetName = '']) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return AppBar(
    elevation: 0,
    backgroundColor: isDarkMode
        ? Theme.of(context).scaffoldBackgroundColor
        : const Color(0xFFD3ECFD),
    automaticallyImplyLeading: false,
    leading: IconButton(
        icon: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: isDarkMode ? const Color(0xffD2D2D2) : Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        }),
    centerTitle: false,
    title: Text(
      title,
      style: CustomThemeData.generateStyle(
        fontSize: McGyver.textSize(context, 2),
        color: isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF344054),
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
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
