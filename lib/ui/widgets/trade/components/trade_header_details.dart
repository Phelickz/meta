// ignore_for_file: non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/trade/trade_view_model.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';

class TradeHeaderDetails extends StatelessWidget {
  final TradeViewModel viewModel;
  const TradeHeaderDetails({super.key, required this.viewModel});

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
                      LocaleKeys.balance,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.4),
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? const Color(0xFF98A2B3)
                            : const Color(0xFF667085),
                      ),
                    ).tr(),
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
                      LocaleKeys.equity,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.4),
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? const Color(0xFF98A2B3)
                            : const Color(0xFF667085),
                      ),
                    ).tr(),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TwoTextPercent(context),
            ],
          ),
          verticalSpaceSmall(context),
          verticalSpaceXSmall(context),
          Row(
            children: [
              if (viewModel.hasCredit)
                Expanded(
                  child: _TwoTextBelow(
                    context,
                    LocaleKeys.credit.tr(),
                    "100 000.00",
                  ),
                ),
              if (viewModel.hasCredit) _Divider(context),
              Expanded(
                child: _TwoTextBelow(
                  context,
                  LocaleKeys.margin.tr(),
                  "113 436.65",
                ),
              ),
              _Divider(context),
              Expanded(
                child: _TwoTextBelow(
                  context,
                  LocaleKeys.freeMargin.tr(),
                  viewModel.isEmpty ? "-" : "478 944.06",
                ),
              ),
              _Divider(context),
              Expanded(
                child: _TwoTextBelow(
                  context,
                  LocaleKeys.marginLevel.tr(),
                  viewModel.isEmpty ? "-" : "522.21%",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _TwoTextPercent(BuildContext context, [bool increment = true]) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "20%",
              style: CustomThemeData.generateStyle(
                  fontSize: McGyver.textSize(context, 2.5),
                  fontWeight: FontWeight.w800,
                  color: increment
                      ? isDarkMode
                          ? const Color(0xFF69E77C)
                          : const Color(0xFF039855)
                      : isDarkMode
                          ? const Color(0xFFF97066)
                          : const Color(0xFFF04438)),
            ),
            Text(
              LocaleKeys.last2Hrs,
              style: CustomThemeData.generateStyle(
                fontSize: McGyver.textSize(context, 1.5),
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFFD0D5DD)
                    : const Color(0xFF667085),
              ),
            ).tr(),
          ],
        ),
      ],
    );
  }

  Widget _Divider(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Container(
      height: McGyver.rsDoubleH(context, 3.6),
      width: 1,
      color: isDarkMode ? const Color(0xFF667085) : const Color(0xFF98A2B3),
    );
  }

  Widget _TwoTextBelow(BuildContext context, String title, String subtitle) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return Column(
      children: [
        Text(
          title,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.3),
            fontWeight: FontWeight.w500,
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
          ),
        ),
        Text(
          subtitle,
          style: CustomThemeData.generateStyle(
            fontSize: McGyver.textSize(context, 1.3),
            fontWeight: FontWeight.bold,
            color:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
          ),
        ),
      ],
    );
  }
}
