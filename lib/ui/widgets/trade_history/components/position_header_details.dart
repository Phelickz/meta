import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

class PositionHeaderDetails extends StatelessWidget {
  const PositionHeaderDetails({super.key});

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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.profit,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.5),
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? const Color(0xFF98A2B3)
                            : const Color(0xFF667085),
                      ),
                    ),
                    verticalSpaceXXSmall(context),
                    Text(
                      "509 082.18",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2.1),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? const Color(0xFF94D1F9)
                            : const Color(0xFF47B0F5),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      LocaleKeys.deposit,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.5),
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? const Color(0xFF98A2B3)
                            : const Color(0xFF667085),
                      ),
                    ),
                    verticalSpaceXXSmall(context),
                    Text(
                      "592 380.17",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 2.1),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? const Color(0xFFD0D5DD)
                            : const Color(0xFF475467),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          verticalSpaceSmall(context),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.balance,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.5),
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? const Color(0xFFD0D5DD)
                            : const Color(0xFF667085),
                      ),
                    ),
                    Text(
                      "100 000.00",
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
                color: isDarkMode
                    ? const Color(0xFF667085)
                    : const Color(0xFF98A2B3),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.swap,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.5),
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? const Color(0xFFD0D5DD)
                            : const Color(0xFF667085),
                      ),
                    ),
                    Text(
                      "113 436.65",
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
                color: isDarkMode
                    ? const Color(0xFF667085)
                    : const Color(0xFF98A2B3),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.commission,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.5),
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? const Color(0xFFD0D5DD)
                            : const Color(0xFF667085),
                      ),
                    ),
                    Text(
                      "478 944.06",
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
          )
        ],
      ),
    );
  }
}
