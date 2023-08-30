import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/res.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/ui/views/trade/trade_view_model.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/trade/components/plus_minus_text.dart';

import '../../../app/utils/theme.dart';

class ModifyTrade extends StatelessWidget {
  final TradeViewModel viewModel;
  const ModifyTrade({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = CustomThemeData.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: McGyver.rsDoubleW(context, 6),
        ),
        child: Column(
          children: [
            verticalSpaceXSmall(context),
            PlusMinusText(
              value: "2.0",
              label: "Lot size",
              onPlus: () {},
              onMinus: () {},
              onTextChanged: (val) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlusMinusText(
                  width: McGyver.rsDoubleW(context, 41),
                  value: "Not set",
                  label: "Stop loss",
                  onPlus: () {},
                  onMinus: () {},
                  onTextChanged: (val) {},
                ),
                PlusMinusText(
                  width: McGyver.rsDoubleW(context, 41),
                  value: "Not set",
                  label: "Take Profit",
                  onPlus: () {},
                  onMinus: () {},
                  onTextChanged: (val) {},
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                top: McGyver.rsDoubleW(context, 2),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  McGyver.rsDoubleW(context, 2),
                ),
                border: Border.all(
                  width: 0.3,
                  color: isDarkMode
                      ? const Color(0xFF667085)
                      : const Color(0xFF98A2B3),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: McGyver.rsDoubleW(context, 4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Duration",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.8),
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFFD0D5DD)
                                : const Color(0xFF667085),
                          ),
                        ),
                        Switch.adaptive(value: true, onChanged: (value) {})
                      ],
                    ),
                  ),
                  verticalSpaceXSmall(context),
                  Container(
                    padding: EdgeInsets.all(McGyver.rsDoubleW(context, 4)),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xFF344054)
                          : const Color(0xFFE4E7EC),
                      borderRadius: BorderRadius.circular(
                        McGyver.rsDoubleW(context, 2),
                      ),
                      border: Border.all(
                        width: 0.3,
                        color: isDarkMode
                            ? const Color(0xFF667085)
                            : const Color(0xFF98A2B3),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlusMinusText(
                              width: McGyver.rsDoubleW(context, 35),
                              value: "1 Hr",
                              label: "Time Frame",
                              onPlus: () {},
                              onMinus: () {},
                              onTextChanged: (val) {},
                              hasMargin: false,
                            ),
                            PlusMinusText(
                              width: McGyver.rsDoubleW(context, 35),
                              value: "1.2311",
                              label: "Current Price",
                              onPlus: () {},
                              onMinus: () {},
                              onTextChanged: (val) {},
                              hasMargin: false,
                            ),
                          ],
                        ),
                        verticalSpaceXSmall(context),
                        Text(
                          "In 1 Hour at 10:41 on 29th July 2023 your trade will automatically close",
                          textAlign: TextAlign.start,
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.4),
                            fontWeight: FontWeight.w500,
                            color: isDarkMode
                                ? const Color(0xFF98A2B3)
                                : const Color(0xFF20A0F3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceSmall(context),
            verticalSpaceXSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '63.2',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.8),
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? const Color(0xFFF97066)
                                  : const Color(0xFFF04438),
                            ),
                          ),
                          TextSpan(
                            text: '23',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 2.1),
                              fontWeight: FontWeight.bold,
                              color: isDarkMode
                                  ? const Color(0xFFF97066)
                                  : const Color(0xFFF04438),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceXXSmall(context),
                    SizedBox(
                      width: McGyver.rsDoubleW(context, 40),
                      child: LinearProgressIndicator(
                        value: 40 / 100,
                        backgroundColor: isDarkMode
                            ? const Color(0xFF073961)
                            : const Color(0xFFE4E7EC),
                        color: Colors.red,
                      ),
                    ),
                    verticalSpaceXXSmall(context),
                    Text(
                      "23%",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.6),
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? const Color(0xFFF97066)
                            : const Color(0xFFF04438),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '63.2',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 1.8),
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? const Color(0xFFF97066)
                                  : const Color(0xFFF04438),
                            ),
                          ),
                          TextSpan(
                            text: '23',
                            style: CustomThemeData.generateStyle(
                              fontSize: McGyver.textSize(context, 2.1),
                              fontWeight: FontWeight.bold,
                              color: isDarkMode
                                  ? const Color(0xFFF97066)
                                  : const Color(0xFFF04438),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceXXSmall(context),
                    SizedBox(
                      width: McGyver.rsDoubleW(context, 40),
                      child: LinearProgressIndicator(
                        value: 77 / 100,
                        backgroundColor: isDarkMode
                            ? const Color(0xFF073961)
                            : const Color(0xFFE4E7EC),
                        color: const Color(0xFF47B0F5),
                      ),
                    ),
                    verticalSpaceXXSmall(context),
                    Text(
                      "77%",
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.6),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF47B0F5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpaceSmall(context),
            verticalSpaceXSmall(context),
            CustomButtons.generalButton(
              context: context,
              onTap: () {
                Navigator.pop(context);
              },
              text: "Modify",
              color: isDarkMode
                  ? const Color(0xFF667085)
                  : const Color(0xFFD0D5DD),
              textColor: isDarkMode
                  ? const Color(0xFFFCFCFD)
                  : const Color(0xFF475467),
            ),
            verticalSpaceSmall(context),
            Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: Color(0xFF98A2B3),
                ),
                horizontalSpaceXXSmall(context),
                Expanded(
                  child: Text(
                    "The trade will be executed at market conditions. Difference with requested price maybe significant",
                    style: CustomThemeData.generateStyle(
                      fontSize: McGyver.textSize(context, 1.4),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF98A2B3),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
