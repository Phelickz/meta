import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/ui/views/social_trading/social_trading_view_model.dart';

class SummaryComponent extends StatelessWidget {
  final SocialTradingViewModel viewModel;
  final PositionType positionType;
  const SummaryComponent({
    super.key,
    required this.viewModel,
    this.positionType = PositionType.open,
  });

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: McGyver.rsDoubleH(context, 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xFF073961)
                          : const Color(0xFFECF7FE),
                      borderRadius:
                          BorderRadius.circular(McGyver.rsDoubleW(context, 2)),
                      border: !isDarkMode
                          ? Border.all(color: const Color(0xffE4E7EC))
                          : null),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Success Rate",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.4),
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? const Color(0xFF98A2B3)
                              : const Color(0xFF667085),
                        ),
                      ),
                      SizedBox(
                        height: McGyver.rsDoubleH(context, 0.7),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "32.8",
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.5),
                              fontWeight: FontWeight.bold,
                              color: isDarkMode
                                  ? const Color(0xFFD0D5DD)
                                  : const Color(0xFF98A2B3),
                            ),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Text(
                            "%",
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.3),
                              fontWeight: FontWeight.normal,
                              color: isDarkMode
                                  ? const Color(0xFFD0D5DD)
                                  : const Color(0xFF98A2B3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpaceXXSmall(context),
              horizontalSpaceXXSmall(context),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? const Color(0xFF073961)
                        : const Color(0xFFECF7FE),
                    borderRadius:
                        BorderRadius.circular(McGyver.rsDoubleW(context, 2)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Gain",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.4),
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? const Color(0xFF98A2B3)
                              : const Color(0xFF667085),
                        ),
                      ),
                      SizedBox(
                        height: McGyver.rsDoubleH(context, 0.7),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "29",
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.5),
                              fontWeight: FontWeight.bold,
                              color: isDarkMode
                                  ? const Color(0xFFD0D5DD)
                                  : const Color(0xFF98A2B3),
                            ),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Text(
                            "%",
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.3),
                              fontWeight: FontWeight.normal,
                              color: isDarkMode
                                  ? const Color(0xFFD0D5DD)
                                  : const Color(0xFF98A2B3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpaceXXSmall(context),
              horizontalSpaceXXSmall(context),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? const Color(0xFF073961)
                        : const Color(0xFFECF7FE),
                    borderRadius:
                        BorderRadius.circular(McGyver.rsDoubleW(context, 2)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Risk Score",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.4),
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? const Color(0xFF98A2B3)
                              : const Color(0xFF667085),
                        ),
                      ),
                      SizedBox(
                        height: McGyver.rsDoubleH(context, 0.7),
                      ),
                      Text(
                        "7 / 10",
                        style: CustomThemeData.generateStyle(
                          fontSize: McGyver.textSize(context, 1.5),
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? const Color(0xFFD0D5DD)
                              : const Color(0xFF98A2B3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpaceSmall(context),
        _twotext(context, "Balance:", "233 899.12"),
        if (positionType == PositionType.open)
          Column(
            children: [
              verticalSpaceXXSmall(context),
              _twotext(context, "Equity:", "233 899.12"),
              verticalSpaceXXSmall(context),
              _twotext(context, "Margin", "3 899.12"),
              verticalSpaceXXSmall(context),
              _twotext(context, "Free Margin", "193 899.12"),
              verticalSpaceXXSmall(context),
              _twotext(context, "Margin Level", "121%"),
            ],
          ),
        verticalSpaceSmall(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Profit",
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.4),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFF98A2B3)
                    : const Color(0xFF667085),
              ),
            ),
            Text(
              "loss",
              textAlign: TextAlign.end,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.4),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFF98A2B3)
                    : const Color(0xFF667085),
              ),
            ),
          ],
        ),
        verticalSpaceXXSmall(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$300",
              textAlign: TextAlign.end,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.7),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF98A2B3),
              ),
            ),
            Text(
              "\$21",
              textAlign: TextAlign.end,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.7),
                fontWeight: FontWeight.bold,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF98A2B3),
              ),
            ),
          ],
        ),
        SizedBox(
          height: McGyver.rsDoubleH(context, 0.5),
        ),
        LinearProgressIndicator(
          minHeight: McGyver.rsDoubleH(context, 1),
          value: 0.5,
          color: const Color(0xff47b0f5),
          backgroundColor: const Color(0xFFF04438),
        ),
      ],
    );
  }

  Widget _twotext(BuildContext context, String text1, String text2) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.4),
            fontWeight: FontWeight.w500,
            color:
                isDarkMode ? const Color(0xFF98A2B3) : const Color(0xFF667085),
          ),
        ),
        Text(
          text2,
          textAlign: TextAlign.end,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.7),
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF98A2B3),
          ),
        ),
      ],
    );
  }
}
