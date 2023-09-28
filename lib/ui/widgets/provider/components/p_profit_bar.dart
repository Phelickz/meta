import 'package:flutter/material.dart';
import 'package:meta_trader/app/utils/color_manager.dart';
import 'package:meta_trader/app/utils/dimensions.dart';
import 'package:meta_trader/app/utils/theme.dart';
import 'package:meta_trader/generated/locale_keys.g.dart';
import 'package:meta_trader/ui/views/provider/provider_view_model.dart';

class ProfitBar extends StatelessWidget {
  final ProviderViewModel viewModel;
  const ProfitBar({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123.pHeight(context),
      width: 327.pWidth(context),
      padding: EdgeInsets.only(
          left: 12.5.pWidth(context),
          right: 12.5.pWidth(context),
          top: 16.pHeight(context),
          bottom: 5.pHeight(context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: viewModel.isDarkMode()
            ? ColorManager.darkHeaderColor
            : const Color(0xFFECF7FE),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.profit,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 12,
                        context: context,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 8.pHeight(context),
                  ),
                  Text(
                    viewModel.tradeHistoryDetail["profit"],
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 16,
                        context: context,
                        fontWeight: FontWeight.w600,
                        lightTextColor: const Color(0xFF47B0F5),
                        darkTextColor: const Color(0xFF47B0F5)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    LocaleKeys.deposit,
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 12,
                        context: context,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 8.pHeight(context),
                  ),
                  Text(
                    viewModel.tradeHistoryDetail["deposit"],
                    style: CustomThemeData.generateColoredStyle(
                        fontSize: 16,
                        context: context,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16.pHeight(context),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 9.5.pWidth(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.balance,
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 12,
                            context: context,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 4.pHeight(context),
                      ),
                      Text(
                        viewModel.tradeHistoryDetail["balance"],
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 13,
                            context: context,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // SizedBox(width: 20.pWidth(context),),
                  VerticalDivider(
                    color: viewModel.isDarkMode()
                        ? const Color(0xFF667085)
                        : const Color(0xFFD0D5DD),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.equity,
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 12,
                            context: context,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 4.pHeight(context),
                      ),
                      Text(
                        viewModel.tradeHistoryDetail["equity"],
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 13,
                            context: context,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // SizedBox(width: 20.pWidth(context),),
                  VerticalDivider(
                    color: viewModel.isDarkMode()
                        ? const Color(0xFF667085)
                        : const Color(0xFFD0D5DD),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys
                            .providerWidget_providerComponent_pProfitsBar_totalTrade,
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 12,
                            context: context,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 4.pHeight(context),
                      ),
                      Text(
                        viewModel.tradeHistoryDetail["totalTrades"],
                        style: CustomThemeData.generateColoredStyle(
                            fontSize: 13,
                            context: context,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // SizedBox(width: 20.pWidth(context),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
