import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

class OrderHeaderDetails extends StatelessWidget {
  const OrderHeaderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      padding: EdgeInsets.only(
        top: McGyver.rsDoubleH(context, 3),
        bottom: McGyver.rsDoubleH(context, 4),
        left: McGyver.rsDoubleW(context, 8),
        right: McGyver.rsDoubleW(context, 8),
      ),
      decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF052844) : const Color(0xFFD3ECFD),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              McGyver.rsDoubleH(context, 4),
            ),
            bottomRight: Radius.circular(
              McGyver.rsDoubleH(context, 4),
            ),
          )),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  LocaleKeys.filled,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ).tr(),
                Text(
                  "3",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: McGyver.rsDoubleH(context, 4),
            width: 1,
            color:
                isDarkMode ? const Color(0xFF667085) : const Color(0xFF98A2B3),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  LocaleKeys.canceled,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ).tr(),
                Text(
                  "0",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: McGyver.rsDoubleH(context, 4),
            width: 1,
            color:
                isDarkMode ? const Color(0xFF667085) : const Color(0xFF98A2B3),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  LocaleKeys.total,
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    fontWeight: FontWeight.w500,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ).tr(),
                Text(
                  "3",
                  style: CustomThemeData.generateStyle(
                    fontSize: McGyver.textSize(context, 1.5),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? const Color(0xFFD0D5DD)
                        : const Color(0xFF667085),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
