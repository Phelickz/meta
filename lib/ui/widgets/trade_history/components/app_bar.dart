import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/ui/views/trade_history/trade_history_view_model.dart';

import '../../../../app/responsiveness/size.dart';
import '../../../../app/utils/theme.dart';
import 'custom_back_button.dart';
import 'filter_modal.dart';

Widget tradeHistoryAppBar(BuildContext context, String title, String subtitle,
    TradeHistoryViewModel model,
    [String assetName = '']) {
  var isDarkMode = CustomThemeData.isDarkMode(context);
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: McGyver.rsDoubleW(context, 6),
      vertical: McGyver.rsDoubleW(context, 4),
    ),
    decoration: BoxDecoration(
      color: isDarkMode ? const Color(0xFF052844) : const Color(0xFFD3ECFD),
    ),
    child: Row(
      children: [
        CustomBackButton(
          onTap: () {
            model.goBack();
          },
        ),
        horizontalSpaceMedium(context),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.2),
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? const Color(0xFFD0D5DD)
                      : const Color(0xFF344054),
                ),
              ),
              if (subtitle != '')
                Text(
                  subtitle,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.7),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFF667085)
                        : const Color(0xFF667085),
                  ),
                ),
            ],
          ),
        ),
        if (assetName != "")
          GestureDetector(
            onTap: () {
              showFilterModal(context);
            },
            child: SizedBox(
              height: McGyver.rsDoubleH(context, 2.8),
              width: McGyver.rsDoubleH(context, 2.8),
              child: SvgPicture.asset(
                assetName,
                colorFilter: ColorFilter.mode(
                  isDarkMode
                      ? const Color(0xff98A2B3)
                      : const Color(0xFF667085),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
      ],
    ),
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
