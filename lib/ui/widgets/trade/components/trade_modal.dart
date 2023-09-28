import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_trader/app/responsiveness/size.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/widgets/buttons/buttons.dart';
import 'package:meta_trader/ui/widgets/trade/components/trade_bulk_operation_modal.dart';

import '../../../../app/responsiveness/res.dart';
import '../../../../app/utils/theme.dart';
import '../../../views/trade/trade_view_model.dart';

class TradeModal extends StatelessWidget {
  final TradeType tradeType;
  const TradeModal({super.key, required this.tradeType});

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

    String typeText = tradeType == TradeType.buy ? "Buy" : "Sell";
    String typeSign = tradeType == TradeType.buy ? "" : "-";
    return Container(
      height: McGyver.rsDoubleH(context, 70),
      padding: EdgeInsets.symmetric(
        horizontal: McGyver.rsDoubleH(context, 2),
        vertical: McGyver.rsDoubleH(context, 3),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(
                  McGyver.rsDoubleH(context, 2),
                ),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xFF475467)
                      : const Color(0xFFE4E7EC),
                  border: Border.all(
                    width: 0.4,
                    color: const Color(0xFF98A2B3),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      McGyver.rsDoubleH(context, 2),
                    ),
                    topRight: Radius.circular(
                      McGyver.rsDoubleH(context, 2),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            SizedBox(
                              width: McGyver.rsDoubleW(context, 1.5),
                            ),
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
                        Text(
                          "#1234344",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.5),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF98A2B3),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceXXSmall(context),
                    Text(
                      LocaleKeys.tradeWidget_tradeModal_australianDollarVsJap,
                      style: CustomThemeData.generateStyle(
                        fontSize: McGyver.textSize(context, 1.5),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF98A2B3),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: McGyver.rsDoubleH(context, 2),
                  vertical: McGyver.rsDoubleH(context, 1),
                ),
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF475467) : Colors.white,
                  border: Border.all(
                    width: 0.4,
                    color: const Color(0xFF98A2B3),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      McGyver.rsDoubleH(context, 2),
                    ),
                    bottomRight: Radius.circular(
                      McGyver.rsDoubleH(context, 2),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "4.51234",
                              style: CustomThemeData.generateStyle(
                                fontSize: McGyver.textSize(context, 1.3),
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
                                fontSize: McGyver.textSize(context, 1.3),
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF98A2B3),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${typeSign}234.56",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 2.1),
                            fontWeight: FontWeight.w500,
                            color: txtColor,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceXSmall(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "S/L",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.3),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF98A2B3),
                          ),
                        ),
                        Text(
                          "Swap: 0.00",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.3),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF98A2B3),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceXXSmall(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "T/P",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.3),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF98A2B3),
                          ),
                        ),
                        Text(
                          "2023.07.25 05:47:43",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.3),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF98A2B3),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceXXSmall(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "24: 1000383",
                          style: CustomThemeData.generateStyle(
                            fontSize: McGyver.textSize(context, 1.3),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF98A2B3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpaceXXSmall(context),
          _buttonText(
            context: context,
            label: LocaleKeys
                .socialTradingWidget_socialTradingComponent_filterPosition_closedPositions,
            onTap: () {},
            labelColor: const Color(0xFFF97066),
          ),
          _buttonText(
            context: context,
            label: LocaleKeys.tradeWidget_tradeModal_modifyPosition,
            onTap: () {},
            labelColor:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
          ),
          _buttonText(
            context: context,
            label: LocaleKeys.trade,
            onTap: () {},
            labelColor:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
          ),
          _buttonText(
            context: context,
            label: LocaleKeys.depthOfMarket,
            onTap: () {},
            labelColor:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
          ),
          _buttonText(
            context: context,
            label: LocaleKeys.chart,
            onTap: () {},
            labelColor:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
          ),
          _buttonText(
            context: context,
            label: LocaleKeys.tradeWidget_tradeModal_bulkOPerationsW,
            onTap: () {
              Navigator.pop(context);
              showBulkOperationModal(context);
            },
            labelColor:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
          ),
          verticalSpaceXSmall(context),
          CustomButtons.generalButton(
            context: context,
            onTap: () {
              Navigator.pop(context);
            },
            text: LocaleKeys.cancel,
            color:
                isDarkMode ? const Color(0xFF052844) : const Color(0xFFD3ECFD),
            textColor:
                isDarkMode ? const Color(0xFFD0D5DD) : const Color(0xFF667085),
          ),
        ],
      ),
    );
  }

  Widget _buttonText({
    required BuildContext context,
    required String label,
    required Function() onTap,
    required Color labelColor,
  }) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Text(
            label,
            style: CustomThemeData.generateStyle(
              fontSize: McGyver.textSize(context, 1.8),
              fontWeight: FontWeight.bold,
              color: labelColor,
            ),
          ),
        ],
      ),
    );
  }

  void showBulkOperationModal(BuildContext context) {
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
          return const TradeBulkOperationModal();
        });
  }
}
